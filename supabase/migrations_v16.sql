-- Equalizer schema v16: adds 10 original "solve (ax+b)^4 = c for all
-- possible values of x" questions -- a type that did not exist anywhere
-- in the bank (confirmed: the only existing even-power questions ask
-- "for how many real values..." not "solve for x"). Every equation uses
-- different coefficients from each other and from the sample this was
-- modeled on, and every correct answer and distractor was computed
-- programmatically from the actual coefficients (not eyeballed), then
-- checked pairwise to confirm no distractor accidentally equals the
-- correct pair. Distractors mirror real errors: a sign mistake while
-- isolating x, taking the square root of c instead of the fourth root,
-- and forgetting the negative root entirely.
--
-- To keep the total question count unchanged, deletes 10 more rows from
-- the "warehouse cube blocks" template (35 near-identical copies
-- originally; migrations_v13/v14/v15.sql already removed 19 of them;
-- this removes 10 more, leaving 6).

delete from public.questions where id in (359, 362, 371, 373, 374, 376, 385, 390, 391, 392);

insert into public.questions (subject, category, question, options, answer_index, explanation) values

('acl', 'Math/Quant', 'If (x + 3)^4 = 16, what are all possible values of x?',
 '["-1, -5", "5, 1", "1, -7", "-1, -3"]'::jsonb,
 0, 'Take the fourth root of both sides: x + 3 = 2 or x + 3 = -2 (since 2^4 = 16). Solving each: x = -1 or x = -5. (5, 1 comes from a sign error while isolating x; 1, -7 comes from taking the square root of 16 instead of the fourth root; -1, -3 keeps the correct positive-root answer but forgets to negate 3 for the second case.)'),

('acl', 'Math/Quant', 'If (x - 4)^4 = 81, what are all possible values of x?',
 '["-1, -7", "7, 1", "13, -5", "7, 4"]'::jsonb,
 1, 'Take the fourth root of both sides: x - 4 = 3 or x - 4 = -3 (since 3^4 = 81). Solving each: x = 7 or x = 1. (-1, -7 comes from a sign error while isolating x; 13, -5 comes from taking the square root of 81 instead of the fourth root; 7, 4 keeps the correct positive-root answer but mishandles the second case.)'),

('acl', 'Math/Quant', 'If (x + 5)^4 = 625, what are all possible values of x?',
 '["10, 0", "20, -30", "0, -10", "0, -5"]'::jsonb,
 2, 'Take the fourth root of both sides: x + 5 = 5 or x + 5 = -5 (since 5^4 = 625). Solving each: x = 0 or x = -10. (10, 0 comes from a sign error while isolating x; 20, -30 comes from taking the square root of 625 instead of the fourth root; 0, -5 keeps the correct first solution but forgets to fully negate for the second.)'),

('acl', 'Math/Quant', 'If (2x - 6)^4 = 16, what are all possible values of x?',
 '["-2, -4", "5, 1", "4, 3", "4, 2"]'::jsonb,
 3, 'Take the fourth root of both sides: 2x - 6 = 2 or 2x - 6 = -2 (since 2^4 = 16). Solving each: x = 4 or x = 2. (-2, -4 comes from a sign error while isolating x; 5, 1 comes from taking the square root of 16 instead of the fourth root; 4, 3 keeps the correct first solution but miscalculates the second.)'),

('acl', 'Math/Quant', 'If (2x + 2)^4 = 256, what are all possible values of x?',
 '["1, -3", "3, -1", "7, -9", "1, -1"]'::jsonb,
 0, 'Take the fourth root of both sides: 2x + 2 = 4 or 2x + 2 = -4 (since 4^4 = 256). Solving each: x = 1 or x = -3. (3, -1 comes from a sign error while isolating x; 7, -9 comes from taking the square root of 256 instead of the fourth root; 1, -1 keeps the correct first solution but forgets the negative root gives a different value.)'),

('acl', 'Math/Quant', 'If (3x - 3)^4 = 81, what are all possible values of x?',
 '["0, -2", "2, 0", "4, -2", "2, 1"]'::jsonb,
 1, 'Take the fourth root of both sides: 3x - 3 = 3 or 3x - 3 = -3 (since 3^4 = 81). Solving each: x = 2 or x = 0. (0, -2 comes from a sign error while isolating x; 4, -2 comes from taking the square root of 81 instead of the fourth root; 2, 1 keeps the correct first solution but miscalculates the second.)'),

('acl', 'Math/Quant', 'If (3x + 6)^4 = 1296, what are all possible values of x?',
 '["4, 0", "10, -14", "0, -4", "0, -2"]'::jsonb,
 2, 'Take the fourth root of both sides: 3x + 6 = 6 or 3x + 6 = -6 (since 6^4 = 1296). Solving each: x = 0 or x = -4. (4, 0 comes from a sign error while isolating x; 10, -14 comes from taking the square root of 1296 instead of the fourth root; 0, -2 keeps the correct first solution but forgets to fully negate for the second.)'),

('acl', 'Math/Quant', 'If (4x - 4)^4 = 256, what are all possible values of x?',
 '["0, -2", "5, -3", "2, 1", "2, 0"]'::jsonb,
 3, 'Take the fourth root of both sides: 4x - 4 = 4 or 4x - 4 = -4 (since 4^4 = 256). Solving each: x = 2 or x = 0. (0, -2 comes from a sign error while isolating x; 5, -3 comes from taking the square root of 256 instead of the fourth root; 2, 1 keeps the correct first solution but miscalculates the second.)'),

('acl', 'Math/Quant', 'If (5x + 5)^4 = 625, what are all possible values of x?',
 '["0, -2", "2, 0", "4, -6", "0, -1"]'::jsonb,
 0, 'Take the fourth root of both sides: 5x + 5 = 5 or 5x + 5 = -5 (since 5^4 = 625). Solving each: x = 0 or x = -2. (2, 0 comes from a sign error while isolating x; 4, -6 comes from taking the square root of 625 instead of the fourth root; 0, -1 keeps the correct first solution but miscalculates the second.)'),

('acl', 'Math/Quant', 'If (2x + 8)^4 = 1296, what are all possible values of x?',
 '["7, 1", "-1, -7", "14, -22", "-1, -4"]'::jsonb,
 1, 'Take the fourth root of both sides: 2x + 8 = 6 or 2x + 8 = -6 (since 6^4 = 1296). Solving each: x = -1 or x = -7. (7, 1 comes from a sign error while isolating x; 14, -22 comes from taking the square root of 1296 instead of the fourth root; -1, -4 keeps the correct first solution but miscalculates the second.)');
