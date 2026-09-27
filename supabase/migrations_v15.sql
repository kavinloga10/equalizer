-- Equalizer schema v15: adds 12 original questions (2 each) covering 6
-- question types that did not exist anywhere in the bank: probability of
-- a number divisible by two given factors, probability of "neither of two
-- categories," probability of rolling/landing on a perfect square,
-- solving a linear equation for x, simplifying a linear expression, and
-- finding a rectangle's missing side from its perimeter. Each pair uses
-- different scenarios and numbers from one another, not just swapped
-- names -- every correct answer and distractor was computed by hand from
-- the actual numbers in the question (shown in this comment for review),
-- not copied from any source.
--
-- To keep the total question count unchanged, deletes 12 more rows from
-- the "warehouse cube blocks" template (35 near-identical copies
-- originally; migrations_v13.sql and migrations_v14.sql already removed
-- 7 of them; this removes 12 more, leaving 16 -- still a healthy number
-- of variants).

delete from public.questions where id in (249, 257, 258, 266, 274, 276, 284, 301, 334, 345, 350, 356);

insert into public.questions (subject, category, question, options, answer_index, explanation) values

-- Probability: divisible by both of two given factors (i.e. divisible by
-- their LCM). Distractors: divisible by only one factor (two ways), and
-- divisible by either factor (an "or" vs "and" mix-up).

('acl', 'Math/Quant', 'The numbers 1 through 30 are written on identical cards and placed in a bag. What is the probability of randomly drawing a card with a number divisible by both 3 and 4?',
 '["1/3", "7/30", "1/15", "1/2"]'::jsonb,
 2, 'A number divisible by both 3 and 4 must be divisible by their least common multiple, 12. Between 1 and 30, only 12 and 24 qualify -- 2 out of 30 cards, so the probability is 2/30 = 1/15. (1/3 only checks divisibility by 3 alone; 7/30 only checks divisibility by 4 alone; 1/2 mistakenly combines "divisible by 3 or 4" instead of "both.")'),

('acl', 'Math/Quant', 'The numbers 1 through 40 are written on tiles and placed in a jar. What is the probability of randomly selecting a tile with a number divisible by both 2 and 5?',
 '["1/2", "1/5", "3/5", "1/10"]'::jsonb,
 3, 'A number divisible by both 2 and 5 must be divisible by their least common multiple, 10. Between 1 and 40, only 10, 20, 30, and 40 qualify -- 4 out of 40 tiles, so the probability is 4/40 = 1/10. (1/2 only checks divisibility by 2 alone; 1/5 only checks divisibility by 5 alone; 3/5 mistakenly combines "divisible by 2 or 5" instead of "both.")'),

-- Probability: "neither of two categories" (i.e. the remaining category).
-- Distractors: the excluded categories'' own probability, a wrong total,
-- and excluding only one of the two named categories.

('acl', 'Math/Quant', 'A jar contains 6 blue marbles, 5 green marbles, and 4 yellow marbles. What is the probability that a randomly picked marble is neither blue nor green?',
 '["11/15", "4/15", "4/11", "3/5"]'::jsonb,
 1, 'There are 6 + 5 + 4 = 15 marbles total. "Neither blue nor green" leaves only yellow: 4 marbles, so the probability is 4/15. (11/15 is the probability of the excluded colors, not the remaining one; 4/11 uses a wrong total; 3/5 mistakenly excludes only blue, leaving green and yellow.)'),

('acl', 'Math/Quant', 'A basket has 7 orange golf balls, 5 pink golf balls, and 8 white golf balls. What is the probability that a randomly picked ball is neither orange nor pink?',
 '["3/5", "8/15", "13/20", "2/5"]'::jsonb,
 3, 'There are 7 + 5 + 8 = 20 balls total. "Neither orange nor pink" leaves only white: 8 balls, so the probability is 8/20 = 2/5. (3/5 is the probability of the excluded colors, not the remaining one; 8/15 uses a wrong total; 13/20 mistakenly excludes only orange, leaving pink and white.)'),

-- Probability: rolling/landing on a perfect square. Distractors: forgetting
-- that 1 counts as a perfect square, overcounting a non-square, and using
-- the wrong total number of outcomes.

('acl', 'Math/Quant', 'You roll a fair eight-sided die, numbered 1 to 8, once. What is the probability of rolling a number that is a perfect square?',
 '["1/8", "1/4", "3/8", "1/3"]'::jsonb,
 1, 'The perfect squares from 1 to 8 are 1 (1^2) and 4 (2^2) -- 2 out of 8 outcomes, so the probability is 2/8 = 1/4. (1/8 forgets that 1 itself is a perfect square; 3/8 mistakenly counts an extra non-square number; 1/3 uses 6 as the total instead of 8.)'),

('acl', 'Math/Quant', 'A spinner is divided into 12 equal sections numbered 1 to 12. What is the probability that the spinner lands on a perfect square?',
 '["1/6", "1/3", "1/4", "3/10"]'::jsonb,
 2, 'The perfect squares from 1 to 12 are 1 (1^2), 4 (2^2), and 9 (3^2) -- 3 out of 12 outcomes, so the probability is 3/12 = 1/4. (1/6 forgets that 1 itself is a perfect square; 1/3 mistakenly counts an extra non-square number; 3/10 uses 10 as the total instead of 12.)'),

-- Solve a linear equation for x. Distractors: undoing the operations in
-- the wrong order, a sign error, and forgetting the final division.

('acl', 'Math/Quant', 'If 5x + 8 = 33, what is x?',
 '["8.2", "5", "-5", "25"]'::jsonb,
 1, 'Subtract 8 from both sides: 5x = 25. Divide both sides by 5: x = 5. (8.2 comes from adding 8 instead of subtracting before dividing; -5 comes from a sign error; 25 stops after subtracting 8 and forgets to divide by 5.)'),

('acl', 'Math/Quant', 'If 6x - 12 = 24, what is x?',
 '["16", "6", "-6", "36"]'::jsonb,
 1, 'Add 12 to both sides: 6x = 36. Divide both sides by 6: x = 6. (16 comes from dividing before adding, doing the steps in the wrong order; -6 comes from a sign error; 36 stops after adding 12 and forgets to divide by 6.)'),

-- Simplify a linear expression via the distributive property. Distractors:
-- distributing to only one term, a sign error while distributing, and
-- incorrectly combining unlike terms.

('acl', 'Math/Quant', 'Simplify: 3(4x - 2) + 5x',
 '["17x-2", "17x-6", "17x+6", "7x-6"]'::jsonb,
 1, 'Distribute: 3(4x - 2) = 12x - 6. Combine with 5x: 12x - 6 + 5x = 17x - 6. (17x-2 only distributes the 3 into the 4x term, not the -2; 17x+6 flips the sign while distributing; 7x-6 incorrectly subtracts the x-coefficients, 12 and 5, instead of adding them.)'),

('acl', 'Math/Quant', 'Simplify: 6(x + 4) - 2x',
 '["4x+4", "4x-24", "8x+24", "4x+24"]'::jsonb,
 3, 'Distribute: 6(x + 4) = 6x + 24. Combine with -2x: 6x + 24 - 2x = 4x + 24. (4x+4 only distributes the 6 into the x term, not the +4; 4x-24 flips the sign while distributing; 8x+24 incorrectly adds 6x and 2x instead of subtracting.)'),

-- Rectangle: given perimeter and length, find the width. Distractors:
-- forgetting to halve the perimeter, an area-formula mix-up, and adding
-- instead of subtracting.

('acl', 'Math/Quant', 'A rectangle has a perimeter of 64 units and a length of 20 units. What is its width?',
 '["44", "12", "3.2", "52"]'::jsonb,
 1, 'Perimeter = 2(length + width), so length + width = 64 / 2 = 32. Width = 32 - 20 = 12. (44 forgets to halve the perimeter before subtracting the length; 3.2 mixes up the perimeter formula with the area formula (64 / 20); 52 mistakenly adds the half-perimeter and length instead of subtracting.)'),

('acl', 'Math/Quant', 'A rectangular garden has a perimeter of 90 meters and a length of 28 meters. What is its width?',
 '["62", "3.21", "73", "17"]'::jsonb,
 3, 'Perimeter = 2(length + width), so length + width = 90 / 2 = 45. Width = 45 - 28 = 17. (62 forgets to halve the perimeter before subtracting the length; 3.21 mixes up the perimeter formula with the area formula (90 / 28); 73 mistakenly adds the half-perimeter and length instead of subtracting.)');
