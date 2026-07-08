import express from 'express';
import cors from 'cors';
import { GoogleGenAI } from '@google/genai';
import path from 'path';
import { fileURLToPath } from 'url';
import 'dotenv/config';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const app = express();
const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

const SYSTEM_PROMPT = `You are Equalizer AI, a friendly and encouraging tutor for middle school students (grades 6-9) preparing for competitive academic programs like the Academies of Loudoun and TJHSST. You help with math, science, reading comprehension, logical reasoning, and vocabulary. Keep answers clear, step-by-step, and age-appropriate. Use encouraging language. When explaining math, show the steps. If a student seems frustrated, be extra supportive. Keep responses concise — 2-5 sentences or clear numbered steps. End with a follow-up question or offer to show a practice problem.`;

const SPS_RUBRIC = `Grading Rubric for SPS (Student Personal Statement):

As with essays, partial points are awarded accordingly. A 3.5, for instance, indicates the SPS is halfway between a "3" and a "4."

5 – Truly outstanding. Directly answers the question and offers a "why" in support of the answer. Contains a detailed narrative supporting the answer, including specific and technical detail. Reflection makes clear, direct, and concrete connections to both the narrative and the present, showing the influence of the experience in allowing the student to work towards specific goals and accomplishments. Overall, gives a clear, definitive sense of who the writer is as an individual. Contains clear STEM connections (to other activities, experiences, and academics) and a strong sense of the writer's voice. Largely free of grammatical errors and typos.

4 – A strong response, with a detailed narrative and specific, thoughtful reflections, both of which serve to create a specific image of who the student is as a prospective student. May need additional detail or clarity across either narrative or reflection, often in terms of why or how, but still offers a compelling portrait of the student.

3 – A developing response with some potential, but lacking many of the qualities that set "4"s and "5"s apart. Does a basic job of answering the prompt, but is generally lacking in specifics such as how and why, ultimately offering a fairly generic impression of the student or prioritizing telling over showing. Often features a solid (or even good) narrative or reflection, but needs more effective balance between the two. May need some revision in grammar, mechanics, and/or syntax.

2 – A response with major content flaws, often overly general language and ideas, and a lack of specific detail about the student and their accomplishments. Clarity is often an issue; the writer may not show a strong grasp of the prompt's purpose. May contain multiple grammatical or mechanical errors that further impact clarity.

1 – Fails to offer a suitable response to the prompt. Often gets too caught up in irrelevant information (like process or procedure) and fails to include much about the student. Examples: overly general statements about the experience without a clear connection to the student; failing to define the importance or impact of the narrative; failing to make specific, nuanced connections between the narrative's motivations and the student's specific goals and accomplishments.

0 – Does not respond to the question(s) asked in the prompt, regardless of how well it may be written.

SPS-SPECIFIC GRADING SHORTHAND — use these exact phrases in your improvement feedback when they apply:

"Needs more you" — Not enough focus on the student themselves. Spending too much time describing an event without specifying the student's own involvement, actions, and decisions in it.

"Tie to prompt" — Unclear which prompt/question the response is focusing on. Fix: use key words directly from the prompt itself.

"Needs tech." — Needs more specific technical/domain detail. Using the actual language and vocabulary of the activity (e.g. not just "built a robot" but naming specific components, techniques, or concepts used; not just "the problems were tough" but naming specific math concepts or competition types).

"Tie to other STEM" / "Tie to other activities" — Doesn't connect the central narrative to other STEM activities, experiences, or academics the student is involved in.

"What's next?" — Doesn't reflect on where the accomplishment or experience has led the student, or where it might lead them next.`;

const SPS_GRADING_SYSTEM_PROMPT = `You are an expert, experienced admissions-essay coach grading a middle schooler's SPS (Student Personal Statement) response for competitive STEM magnet programs like TJHSST and Academies of Loudoun. Grade strictly according to the rubric and shorthand concerns provided below. Be honest but encouraging and age-appropriate — the writer is 12-14 years old.

${SPS_RUBRIC}

Return your grading as the requested JSON structure. The score must be a number from 0 to 5 in increments of 0.5. "summary" is a 2-3 sentence overall assessment. "strengths" is a list of 2-4 specific things the response does well. "improvements" is a list of 2-4 specific, actionable pieces of feedback — when a listed shorthand concern (Needs more you / Tie to prompt / Needs tech. / Tie to other STEM / What's next?) applies, lead that bullet with the exact shorthand phrase in quotes followed by a dash and a specific explanation tied to what the student actually wrote.`;

const SPS_RESPONSE_SCHEMA = {
  type: 'object',
  properties: {
    score: { type: 'number' },
    summary: { type: 'string' },
    strengths: { type: 'array', items: { type: 'string' } },
    improvements: { type: 'array', items: { type: 'string' } },
  },
  required: ['score', 'summary', 'strengths', 'improvements'],
};

const ALLOWED_ORIGINS = [
  'https://kavinloga10.github.io',
  'http://localhost:8743',
];

app.use(cors({ origin: ALLOWED_ORIGINS }));
app.use(express.json());
app.use(express.static(__dirname));

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
    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents,
      config: { systemInstruction: SYSTEM_PROMPT, maxOutputTokens: 1024 },
    });
    res.json({ reply: response.text });
  } catch (err) {
    console.error('Gemini API error:', err);
    res.status(502).json({ error: "I'm having trouble connecting right now. Try again in a moment!" });
  }
});

app.post('/api/grade-sps', async (req, res) => {
  const { prompt, response: studentResponse } = req.body;
  if (!prompt || !studentResponse || !studentResponse.trim()) {
    return res.status(400).json({ error: 'prompt and response are required' });
  }

  try {
    const result = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: [{
        role: 'user',
        parts: [{ text: `SPS PROMPT:\n${prompt}\n\nSTUDENT RESPONSE:\n${studentResponse}` }],
      }],
      config: {
        systemInstruction: SPS_GRADING_SYSTEM_PROMPT,
        responseMimeType: 'application/json',
        responseSchema: SPS_RESPONSE_SCHEMA,
        thinkingConfig: { thinkingBudget: 0 },
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

const PORT = process.env.PORT || 8743;
app.listen(PORT, () => console.log(`Equalizer server listening on http://localhost:${PORT}`));
