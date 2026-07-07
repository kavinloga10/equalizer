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

const PORT = process.env.PORT || 8743;
app.listen(PORT, () => console.log(`Equalizer server listening on http://localhost:${PORT}`));
