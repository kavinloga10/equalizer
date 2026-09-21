import express from 'express';
import cors from 'cors';
import multer from 'multer';
import fs from 'fs/promises';
import os from 'os';
import crypto from 'crypto';
import { GoogleGenAI, createUserContent, createPartFromUri } from '@google/genai';
import path from 'path';
import { fileURLToPath } from 'url';
import 'dotenv/config';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const app = express();
const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

const SYSTEM_PROMPT = `You are Equalizer AI, a friendly and encouraging tutor for middle school students (grades 6-9) preparing for the Academies of Loudoun (AOS/AET) admissions process. You help with math, science, reading comprehension, logical reasoning, and vocabulary. Keep answers clear, step-by-step, and age-appropriate. Use encouraging language. When explaining math, show the steps. If a student seems frustrated, be extra supportive. Keep responses concise — 2-5 sentences or clear numbered steps. End with a follow-up question or offer to show a practice problem.`;

// Debate Coach: an AI sparring partner for Public Forum debate, the
// competitive speech & debate format built around Constructive, Crossfire,
// Rebuttal, Summary, and Final Focus. Deliberately argues the opposite side
// for real (not a pushover), while flagging any example/statistic as
// illustrative rather than a verified source, since the model can't fact-check
// itself and shouldn't present hallucinated "evidence" as real to a minor.
const DEBATE_SYSTEM_PROMPT_BASE = `You are Equalizer's Debate Coach, an AI sparring partner helping a middle schooler (grades 6-9) practice Public Forum debate.

Take the OPPOSITE side of whatever the student is arguing, and argue it seriously in 2-4 sentences per turn. You may use illustrative reasoning and hypothetical examples, but explicitly label them as illustrative (e.g. "for example, imagine...") rather than presenting invented statistics or sources as verified facts, since you cannot look up real citations. Stay respectful and age-appropriate at all times — this is a coaching exercise, not a real hostile debate.`;

// Behavior changes by phase, not just by turn -- in particular, Crossfire is
// deliberately reversed from the other phases: the AI states a claim and the
// STUDENT practices cross-examining it, rather than the AI interrogating the
// student. That's the skill this phase is meant to build (asking sharp
// questions), which the student never gets to practice if the AI is always
// the one asking.
const DEBATE_PHASE_BEHAVIOR = {
  Constructive: `CURRENT PHASE: Constructive. The student just gave their opening case. Respond with your own opposing Constructive -- a clear, organized case for your side. Don't ask them questions yet; that's what Crossfire is for.`,
  Crossfire: `CURRENT PHASE: Crossfire. This phase is reversed from how you might expect: you present your case, and the student practices cross-examining YOU -- not the other way around. If this is your first turn in Crossfire, open by stating one clear, specific claim from your case. After that, directly and honestly answer whatever question the student asks about it, the way a real debater defends their case under cross-examination -- don't dodge, and don't turn it back into a question for them. Only offer a fresh claim if they've clearly run out of questions and the exchange stalls.`,
  Rebuttal: `CURRENT PHASE: Rebuttal. The student is directly attacking your case. Respond with your own Rebuttal, directly attacking theirs -- point out specific weaknesses in their argument rather than just restating your own case.`,
  Summary: `CURRENT PHASE: Summary. The student is extending their strongest points toward the end of the round. If their message reads like they're consolidating their case rather than raising something new, give a short, honest note on how well they're doing that instead of just rebutting further.`,
  'Final Focus': `CURRENT PHASE: Final Focus. This is the student's closing argument. Give a short, honest critique of their case across the whole round: was their reasoning clear, did they actually engage your counter-arguments, and what would strengthen their case next round.`,
};

const DEBATE_DIFFICULTY_NOTES = {
  Novice: `DIFFICULTY: Novice. Argue genuinely, but keep your points straightforward and easy to follow — this is a student's first few rounds. In Crossfire, answer their questions clearly and directly rather than being evasive. Be encouraging in tone even while disagreeing.`,
  Varsity: `DIFFICULTY: Varsity. Argue as a skilled, well-prepared opponent would — layered reasoning and tighter logic. In Crossfire, answer honestly but the way a sharp debater would: precisely enough to not be caught in a contradiction, without volunteering more than the question actually asked, so the student has to keep pressing to get real ground. Do not soften your arguments to make things easy.`,
};

function debateSystemPrompt(resolution, side, difficulty, phase) {
  const oppositeSide = side === 'Pro' ? 'Con' : 'Pro';
  const difficultyNote = DEBATE_DIFFICULTY_NOTES[difficulty] || DEBATE_DIFFICULTY_NOTES.Novice;
  const phaseNote = DEBATE_PHASE_BEHAVIOR[phase] || DEBATE_PHASE_BEHAVIOR.Constructive;
  return `${DEBATE_SYSTEM_PROMPT_BASE}\n\nRESOLUTION: "${resolution}"\nThe student is arguing ${side}. You are arguing ${oppositeSide}.\n\n${difficultyNote}\n\n${phaseNote}`;
}

const DEBATE_GRADING_SYSTEM_PROMPT = `You are scoring a middle schooler's completed Public Forum debate round against an AI opponent. The writer is 12-14 years old. You are given the resolution, which side the student argued, and the full transcript of their turns (the opponent's turns are shown for context only — do not grade the opponent).

Score the student's overall performance across the round, weighing: clarity and organization of their case, use of evidence or reasoning (illustrative examples count, but reward specificity), how directly they engaged and rebutted the opponent's arguments rather than repeating their own points, and whether their closing (Summary/Final Focus, if present) crystallized clear voter issues. Do not give easy points — a high score requires genuinely strong argumentation across the round, not just participation.

Return your grading as the requested JSON structure. The score must be a number from 0 to 10 in increments of 0.5. "summary" is a 2-3 sentence overall assessment of the round. "strengths" is a list of 2-4 specific things the student did well, quoting or referencing their actual turns. "improvements" is a list of 2-4 specific, actionable pieces of feedback for their next round.`;

// Sports Coach: analyzes a short uploaded video of the student practicing a
// skill. Unlike the academic graders, bad feedback here carries real physical
// risk (form corrections can cause injury if wrong), so the prompt requires
// honest uncertainty when the video doesn't give a clear view, and an
// explicit "get a real coach to confirm" flag for anything safety-relevant.
const SPORTS_COACH_SYSTEM_PROMPT = `You are Equalizer's Sports Coach, giving a middle school student (grades 6-9) feedback on a short training video of themselves practicing a specific skill or sport, which they'll tell you in their message.

Watch the video carefully and give specific, actionable feedback tied to what you actually observe — body positioning, timing, footwork, follow-through, etc. — not generic advice that could apply to any video of that sport. If the camera angle, lighting, distance, or video length makes something hard to judge confidently, say so honestly in your summary rather than guessing with false confidence.

SAFETY: if the skill involves real injury risk when done with poor form (e.g., weightlifting, gymnastics, sprinting mechanics, contact sports, throwing motions), explicitly recommend in your summary that the student have a real coach, trainer, or parent confirm your feedback in person before changing anything that affects safety. You are a supplementary practice tool, not a substitute for in-person coaching.

Stay encouraging and age-appropriate, but do not give easy points — reserve a high score for genuinely strong technique, not just participation. Return your feedback as the requested JSON structure. "score" is a number from 0 to 10 in increments of 0.5 rating the technique shown. "summary" is a 2-3 sentence overview of what you observed (including any safety note or visibility caveat). "strengths" is a list of 2-4 specific things done well. "improvements" is a list of 2-4 specific, actionable things to work on next.`;

// Run as a separate, second call (text-only, no video attached) after the
// main analysis succeeds. This isolation matters for a real reason, not just
// caution: Google Search grounding is NOT available on the free tier for
// Gemini 3.x models at all -- it requires billing enabled on the project
// (confirmed via Google's own docs and a live 429 on this exact call).
// Without billing, every grounded search will fail; keeping it in its own
// call means that failure only costs the video suggestions, not the actual
// coaching feedback, which works fine on the free tier on its own.
const SPORTS_SEARCH_SYSTEM_PROMPT = `You are helping a middle school student find real, publicly available video tutorials that address specific gaps in their sports technique. You'll be given a list of specific things they need to work on. You have a Google Search tool available -- for each gap, run a real search to find an actual tutorial or drill video that addresses it (phrase queries like "[specific technique] tutorial video" or "how to fix [specific issue] [sport]", favoring searches likely to surface real instructional video content such as YouTube). Do not invent or guess at video titles, channels, or URLs yourself -- only real search results should ever be referenced. If a search doesn't turn up anything genuinely relevant, skip it rather than force an unrelated result.

Respond with a short markdown list, one entry per result, formatted exactly as: "- [Exact Video Title](URL)" -- use the real title of the video or page as it actually appears in the search result, not a paraphrase or description of it.`;

const WRITING_RESPONSE_SCHEMA = {
  type: 'object',
  properties: {
    score: { type: 'number' },
    summary: { type: 'string' },
    strengths: { type: 'array', items: { type: 'string' } },
    improvements: { type: 'array', items: { type: 'string' } },
  },
  required: ['score', 'summary', 'strengths', 'improvements'],
};

// This is LCPS's own "2023-2024 Released Writing Prompt" rubric for the
// Academies of Loudoun (AOS/AET) Writing Assessment, transcribed verbatim
// from the official released document (5 indicators, each scored 0/1/2,
// total out of 10). Per the official directions given to students, grammar,
// spelling, and syntax do NOT count against the response — do not penalize
// for them.
const AOS_AET_RUBRIC = `2023-2024 LCPS Academies of Loudoun (AOS/AET) Writing Assessment Rubric — official, released.

Directions given to the student: the response is evaluated on the strength of the argument(s) and ideas presented; it may be structured any way (bulleted phrases, an outline, paragraphs) as long as it is thorough and comprehensive; grammar, spelling, and syntax do NOT count against the student; the real assessment is 45 minutes.

Score each of the 5 indicators below from 0 to 2 (whole numbers only):
0 = No Evidence
1 = Limited Evidence (response indicates a minority of the criteria listed)
2 = Full Evidence (response indicates the majority of the criteria listed)

QUESTIONING / PROCESSING
1 (Limited): questions/processes are basic and lack specificity; poses closed-ended questions; basic exploration of thought.
2 (Full): questions/processes are probing and specific; poses open-ended questions; highly developed/purposeful exploration of thought which challenges assumptions.

INFORMATION GATHERING / ANALYSIS
1 (Limited): irrelevant, illogical, and/or confusing thought processes; superficial information gathering including limited and/or unreliable resources; minimal analysis of topic.
2 (Full): relevant and logical thought processes based on evidence; information gathering includes multiple methods of collection including valid and reliable resources; in-depth analysis and synthesization of topic.

FLUENCY / ORIGINALITY OF IDEAS
1 (Limited): generates few ideas (1-2) specific to the topic; minimal explanation of ideas; ideas lack originality.
2 (Full): generates multiple ideas (3 or more) specific to the topic; provides clear and concise explanation of ideas; ideas are original and demonstrate unique viewpoints.

PRESENTATION / REASONING
1 (Limited): presents ideas in a poorly organized manner which does not directly address the topic and/or has minimal practical application; presents vague evidence of meaningful possibilities; minimal acknowledgement or pursuit of a counter argument.
2 (Full): presents ideas in a clear and well-organized manner which directly addresses and can be applied to the topic; presentation provides detailed/clear descriptions of meaningful possibilities; clearly presents and/or pursues counter argument(s).

POINT OF VIEW / PERSPECTIVE
1 (Limited): describes potential impact on limited audiences or audiences that would only be minimally impacted.
2 (Full): describes impact on a wide range of audiences, or one where the solution would have a major impact.`;

const AOS_AET_GRADING_SYSTEM_PROMPT = `You are a strict, demanding grader scoring a middle schooler's response to the Academies of Loudoun (AOS/AET) Writing Assessment using LCPS's real, official rubric below. The writer is 11-13 years old. Do NOT penalize grammar, spelling, or syntax — the official directions explicitly say these do not count against the student. Every other part of this rubric should be applied rigorously.

GRADING PHILOSOPHY — READ CAREFULLY:
- Do not give easy points on content or ideas. A "2" (Full Evidence) on an indicator requires the response to clearly demonstrate the majority of that indicator's specific criteria, in the rubric's own language — not just gesture at the topic.
- Default to "1" (Limited Evidence) unless the response clearly and specifically earns "2." A response that is on-topic but generic, shallow, or only touches one criterion should stay at "1," not be rounded up out of encouragement.
- Score "0" (No Evidence) when an indicator is essentially unaddressed — do not inflate an absent indicator to a "1" just because the overall response is well-written.
- Fluency/Originality specifically requires 3+ distinct, specific ideas for a "2" — two similar or repetitive ideas do not qualify, regardless of how well they are explained.
- Presentation/Reasoning's "2" requires a genuinely pursued counter-argument, not just a passing acknowledgment that other views exist.
- Be direct and specific about which indicators fell short and why — this is meant to prepare the student for a real, competitive process, so do not soften a thin response into sounding stronger than it is.

${AOS_AET_RUBRIC}

Return your grading as the requested JSON structure. Score each of the 5 "indicatorScores" fields (questioningProcessing, informationGathering, fluencyOriginality, presentationReasoning, pointOfView) as a whole number from 0 to 2, matching the official rubric exactly. Set "score" to the sum of those 5 values (0-10). "summary" is a 2-3 sentence overall assessment that states the score's justification plainly, without cushioning a low score. "strengths" is a list of 2-4 specific things the response does well, each tied to one of the 5 indicators — only list genuine strengths. "improvements" is a list of 2-4 specific, actionable pieces of feedback tied to whichever indicators scored lowest.`;

const AOS_AET_RESPONSE_SCHEMA = {
  type: 'object',
  properties: {
    score: { type: 'number' },
    indicatorScores: {
      type: 'object',
      properties: {
        questioningProcessing: { type: 'number' },
        informationGathering: { type: 'number' },
        fluencyOriginality: { type: 'number' },
        presentationReasoning: { type: 'number' },
        pointOfView: { type: 'number' },
      },
      required: ['questioningProcessing', 'informationGathering', 'fluencyOriginality', 'presentationReasoning', 'pointOfView'],
    },
    summary: { type: 'string' },
    strengths: { type: 'array', items: { type: 'string' } },
    improvements: { type: 'array', items: { type: 'string' } },
  },
  required: ['score', 'indicatorScores', 'summary', 'strengths', 'improvements'],
};

const ALLOWED_ORIGINS = [
  'https://kavinloga10.github.io',
  'https://equalizer-app.com',
  'https://www.equalizer-app.com',
  'http://localhost:8743',
];

app.use(cors({ origin: ALLOWED_ORIGINS }));
app.use(express.json());
app.use(express.static(__dirname));

// Sports Coach video uploads: written to a temp file on disk rather than
// held in memory -- a couple minutes of real phone-camera video easily runs
// 80-150MB (video bitrate, not duration, drives file size), and buffering
// that in RAM risks OOM on Render's free tier. 200MB comfortably covers a
// few minutes of footage; the temp file is deleted after analysis either way.
const VIDEO_SIZE_LIMIT_MB = 200;
const videoUpload = multer({
  storage: multer.diskStorage({ destination: os.tmpdir() }),
  limits: { fileSize: VIDEO_SIZE_LIMIT_MB * 1024 * 1024 },
  fileFilter: (req, file, cb) => {
    if (!file.mimetype.startsWith('video/')) return cb(new Error('Only video files are supported.'));
    cb(null, true);
  },
});

function handleVideoUpload(req, res, next) {
  videoUpload.single('video')(req, res, (err) => {
    if (!err) return next();
    const message = err.code === 'LIMIT_FILE_SIZE'
      ? `That video is too large — keep clips under ${VIDEO_SIZE_LIMIT_MB}MB (a shorter clip is also faster to analyze).`
      : (err.message || 'Upload failed.');
    res.status(400).json({ error: message });
  });
}

app.post('/api/chat', async (req, res) => {
  const { messages } = req.body;
  if (!Array.isArray(messages) || messages.length === 0) {
    return res.status(400).json({ error: 'messages array is required' });
  }

  const contents = messages.map((m) => ({
    role: m.role === 'assistant' ? 'model' : 'user',
    parts: [{ text: m.content }],
  }));

  try {
    const response = await generateContentWithRetry({
      model: 'gemini-3.6-flash',
      contents,
      config: { systemInstruction: SYSTEM_PROMPT, maxOutputTokens: 1024 },
    });
    res.json({ reply: response.text });
  } catch (err) {
    console.error('Gemini API error:', err);
    res.status(502).json({ error: "I'm having trouble connecting right now. Try again in a moment!" });
  }
});

app.post('/api/debate-coach', async (req, res) => {
  const { messages, resolution, side, difficulty, phase } = req.body;
  if (!Array.isArray(messages) || messages.length === 0 || !resolution || !side) {
    return res.status(400).json({ error: 'messages, resolution, and side are required' });
  }

  const contents = messages.map((m) => ({
    role: m.role === 'assistant' ? 'model' : 'user',
    parts: [{ text: m.content }],
  }));

  try {
    const response = await generateContentWithRetry({
      model: 'gemini-3.6-flash',
      contents,
      config: { systemInstruction: debateSystemPrompt(resolution, side, difficulty, phase), maxOutputTokens: 1024 },
    });
    res.json({ reply: response.text });
  } catch (err) {
    console.error('Gemini API error:', err);
    res.status(502).json({ error: "I'm having trouble connecting right now. Try again in a moment!" });
  }
});

app.post('/api/grade-debate', async (req, res) => {
  const { messages, resolution, side } = req.body;
  if (!Array.isArray(messages) || messages.length === 0 || !resolution || !side) {
    return res.status(400).json({ error: 'messages, resolution, and side are required' });
  }

  const transcript = messages
    .map((m) => `${m.role === 'assistant' ? 'OPPONENT' : 'STUDENT'}: ${m.content}`)
    .join('\n\n');

  try {
    const response = await generateContentWithRetry({
      model: 'gemini-3.6-flash',
      contents: [{
        role: 'user',
        parts: [{ text: `RESOLUTION: "${resolution}"\nThe student argued: ${side}\n\nTRANSCRIPT:\n${transcript}` }],
      }],
      config: {
        systemInstruction: DEBATE_GRADING_SYSTEM_PROMPT,
        responseMimeType: 'application/json',
        responseSchema: WRITING_RESPONSE_SCHEMA,
        thinkingConfig: { thinkingLevel: 'minimal' },
        maxOutputTokens: 4096,
      },
    });
    const graded = JSON.parse(response.text);
    res.json(graded);
  } catch (err) {
    console.error('Gemini grading error:', err);
    res.status(502).json({ error: 'Grading failed. Try again in a moment!' });
  }
});

app.post('/api/grade-writing-assessment', async (req, res) => {
  const { prompt, response: studentResponse } = req.body;
  if (!prompt || !studentResponse || !studentResponse.trim()) {
    return res.status(400).json({ error: 'prompt and response are required' });
  }

  try {
    const result = await generateContentWithRetry({
      model: 'gemini-3.6-flash',
      contents: [{
        role: 'user',
        parts: [{ text: `WRITING ASSESSMENT PROMPT:\n${prompt}\n\nSTUDENT RESPONSE:\n${studentResponse}` }],
      }],
      config: {
        systemInstruction: AOS_AET_GRADING_SYSTEM_PROMPT,
        responseMimeType: 'application/json',
        responseSchema: AOS_AET_RESPONSE_SCHEMA,
        thinkingConfig: { thinkingLevel: 'minimal' },
        maxOutputTokens: 4096,
      },
    });
    const graded = JSON.parse(result.text);
    res.json(graded);
  } catch (err) {
    console.error('Gemini grading error:', err);
    res.status(502).json({ error: "Grading failed. Try again in a moment!" });
  }
});

// Video analysis (Gemini file processing + a search-grounded generateContent
// call) can easily run past a minute, and that time varies per video -- held
// open as a single synchronous HTTP request, it's at the mercy of whatever
// proxy/platform timeout Render enforces, which is exactly why this was
// failing inconsistently rather than by video length. Making it a background
// job the client polls for means no single request needs to stay open longer
// than a couple seconds, regardless of how long the actual analysis takes.
const sportsJobs = new Map(); // jobId -> { status: 'processing'|'done'|'error', result?, error? }
const SPORTS_JOB_TTL_MS = 10 * 60 * 1000;

// Real-world testing turned up transient Gemini errors -- 503 "model is
// experiencing high demand" and 429 rate-limit -- that Google's own error
// message says to just retry. Both are common enough in practice that
// failing outright on the first hit produces exactly the "works sometimes,
// not others" behavior this was built to fix.
function isTransientGeminiError(err) {
  const status = err?.status;
  return status === 503 || status === 429;
}

async function generateContentWithRetry(params, retries = 2) {
  for (let attempt = 0; ; attempt++) {
    try {
      return await ai.models.generateContent(params);
    } catch (err) {
      if (attempt >= retries || !isTransientGeminiError(err)) throw err;
      const delay = 2000 * Math.pow(2, attempt); // 2s, 4s, ...
      console.warn(`Transient Gemini error (${err.status}), retrying in ${delay}ms...`);
      await new Promise((r) => setTimeout(r, delay));
    }
  }
}

// Separate, best-effort call: text-only (no video, no response schema) with
// the Google Search tool enabled, run after the main analysis succeeds. Any
// failure here is swallowed -- missing video suggestions is a fine outcome,
// failing the whole analysis over them is not.
//
// IMPORTANT, verified the hard way: the model's own inline text -- even
// when it just cited a real search result -- cannot be trusted for URLs.
// Checked every video ID the model wrote across 8+ live test runs against
// YouTube's oembed endpoint (which reliably 404s for videos that don't
// exist): every single one was fabricated, despite groundingMetadata
// confirming a real search had genuinely run. The model apparently
// reconstructs a plausible-looking destination URL from what it read
// (titles/snippets) rather than having the literal URL, since the tool
// result it sees is an opaque Google redirect link, not the real one.
//
// So URLs ONLY ever come from groundingChunks -- that's the one thing
// actually backed by the real search call. Titles are a different story:
// they can't be cross-verified the same way (redirect tokens don't match
// between the structured metadata and inline text -- tested, 0/8+ matches),
// so this pairs each grounding chunk's real URL with the model's
// corresponding parsed title *by position* as a best-effort label. Worst
// case if a pairing is imperfect: a title slightly mismatches what's
// actually at a still-100%-real link -- not a dead or fake one.
function extractMarkdownLinks(text) {
  const links = [];
  const re = /\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g;
  let match;
  while ((match = re.exec(text)) !== null) {
    const title = match[1].replace(/^[*_]+|[*_]+$/g, '').trim();
    if (title) links.push(title);
  }
  return links;
}

async function findRecommendedVideos(improvements) {
  if (!improvements || !improvements.length) return [];
  try {
    const response = await generateContentWithRetry({
      model: 'gemini-3.6-flash',
      contents: `Areas the student needs to work on:\n${improvements.map((s) => `- ${s}`).join('\n')}`,
      config: {
        systemInstruction: SPORTS_SEARCH_SYSTEM_PROMPT,
        thinkingConfig: { thinkingLevel: 'low' },
        maxOutputTokens: 1024,
        tools: [{ googleSearch: {} }],
      },
    });

    const chunks = (response.candidates?.[0]?.groundingMetadata?.groundingChunks || [])
      .map((c) => c.web)
      .filter((w) => w && w.uri);
    const parsedTitles = extractMarkdownLinks(response.text || '');

    const seenUrls = new Set();
    const results = [];
    for (const w of chunks) {
      if (seenUrls.has(w.uri)) continue;
      seenUrls.add(w.uri);
      results.push({ title: parsedTitles[results.length] || w.title || 'Resource', url: w.uri });
      if (results.length >= 4) break;
    }
    return results;
  } catch (err) {
    console.error('Video recommendation search failed (non-fatal):', err);
    return [];
  }
}

async function runSportsVideoAnalysis(jobId, filePath, mimeType, sport) {
  let uploadedFile;
  try {
    uploadedFile = await ai.files.upload({
      file: filePath,
      config: { mimeType, displayName: 'sports-coach-clip' },
    });

    // Video files process asynchronously on Google's side before they're
    // analyzable -- poll until ACTIVE, or give up after 3 minutes so a stuck
    // upload doesn't hang the job forever.
    let fileInfo = uploadedFile;
    const pollStart = Date.now();
    while (fileInfo.state === 'PROCESSING' && Date.now() - pollStart < 180000) {
      await new Promise((r) => setTimeout(r, 2000));
      fileInfo = await ai.files.get({ name: uploadedFile.name });
    }
    if (fileInfo.state !== 'ACTIVE') {
      throw new Error(`Video did not finish processing (state: ${fileInfo.state}).`);
    }

    // Main analysis: video input + structured JSON output, no search tool.
    // This is the part that has to be reliable -- keep it as simple as
    // possible.
    const response = await generateContentWithRetry({
      model: 'gemini-3.6-flash',
      contents: createUserContent([
        createPartFromUri(fileInfo.uri, fileInfo.mimeType),
        `The student says this video shows them practicing: ${sport}`,
      ]),
      config: {
        systemInstruction: SPORTS_COACH_SYSTEM_PROMPT,
        responseMimeType: 'application/json',
        responseSchema: WRITING_RESPONSE_SCHEMA,
        thinkingConfig: { thinkingLevel: 'minimal' },
        maxOutputTokens: 4096,
      },
    });
    const graded = JSON.parse(response.text);
    graded.recommendedVideos = await findRecommendedVideos(graded.improvements);

    sportsJobs.set(jobId, { status: 'done', result: graded });
  } catch (err) {
    console.error('Sports video analysis error:', err);
    sportsJobs.set(jobId, { status: 'error', error: "Couldn't analyze that video. Try a shorter clip or try again in a moment!" });
  } finally {
    fs.unlink(filePath).catch(() => {});
    if (uploadedFile && uploadedFile.name) {
      ai.files.delete({ name: uploadedFile.name }).catch(() => {});
    }
    setTimeout(() => sportsJobs.delete(jobId), SPORTS_JOB_TTL_MS);
  }
}

app.post('/api/analyze-sports-video', handleVideoUpload, (req, res) => {
  if (!req.file) return res.status(400).json({ error: 'A video file is required.' });
  const sport = (req.body.sport || '').trim();
  if (!sport) return res.status(400).json({ error: 'Tell us what skill or sport this video shows.' });

  const jobId = crypto.randomUUID();
  sportsJobs.set(jobId, { status: 'processing' });
  res.json({ jobId });

  runSportsVideoAnalysis(jobId, req.file.path, req.file.mimetype, sport);
});

app.get('/api/analyze-sports-video/:jobId', (req, res) => {
  const job = sportsJobs.get(req.params.jobId);
  if (!job) return res.status(404).json({ error: 'Job not found or expired.' });
  res.json(job);
});

const PORT = process.env.PORT || 8743;
app.listen(PORT, () => console.log(`Equalizer server listening on http://localhost:${PORT}`));
