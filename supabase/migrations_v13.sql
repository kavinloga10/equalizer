-- Equalizer schema v13: adds 8 original Math/Quant questions covering two
-- gaps found in the bank -- probability (equally-likely-category matching)
-- and rate/unit-conversion "which expression computes this" questions --
-- neither of which existed anywhere in the bank before this migration.
--
-- To keep the total question count unchanged, this also deletes 8 rows
-- from four heavily over-duplicated templates (the same word problem
-- reworded with swapped names/numbers, 12-35 times each): 2 each from the
-- "warehouse cube blocks" (35 copies), "gaming console sale" (16 copies),
-- "island cluster map distance" (13 copies), and "bee population growth"
-- (12 copies) templates. Each still keeps a large number of variants after
-- this trim -- this only removes the most excessive redundancy.

delete from public.questions where id in (399, 400, 353, 377, 382, 388, 379, 389);

insert into public.questions (subject, category, question, options, answer_index, explanation) values

-- Probability: matching on n equally-likely categories (probability = 1/n).
-- Distractors mirror common student errors: halving (1/2n), a permutation
-- slip (1/(n(n-1))), and forgetting to sum across all n matching cases
-- (1/n^2) -- the same error pattern as the "same day of the week" sample.

('acl', 'Math/Quant', 'A survey asks students which month of the year they were born in. What is the probability that two randomly selected students from the survey were born in the same month? Assume all 12 months are equally likely and that the two students'' birth months are independent.',
 '["1/24", "1/12", "1/144", "1/132"]'::jsonb,
 1, 'Once the first student''s birth month is fixed, the second student matches only if they share that one specific month out of 12 equally likely months, so the probability is 1/12. (Equivalently: summing over all 12 ways they could match, 12 × (1/12) × (1/12) = 1/12.)'),

('acl', 'Math/Quant', 'Two people each roll a fair six-sided die at the same time. What is the probability that both dice show the same number?',
 '["1/6", "1/36", "1/12", "1/30"]'::jsonb,
 0, 'Once the first die''s result is fixed, the second die matches only if it lands on that one specific number out of 6 equally likely outcomes, so the probability is 1/6.'),

('acl', 'Math/Quant', 'Two people each draw one card from their own separate, full standard deck of playing cards. What is the probability that both drawn cards are the same suit (hearts, diamonds, clubs, or spades)?',
 '["1/16", "1/8", "1/4", "1/12"]'::jsonb,
 2, 'A standard deck has 4 equally likely suits. Once the first card''s suit is fixed, the second card matches only if it shares that one specific suit out of 4, so the probability is 1/4.'),

('acl', 'Math/Quant', 'Two people are each asked to silently think of a random single digit from 0 to 9. What is the probability that they both think of the same digit?',
 '["1/90", "1/20", "1/100", "1/10"]'::jsonb,
 3, 'There are 10 equally likely digits (0 through 9). Once the first person''s digit is fixed, the second person matches only if they pick that one specific digit out of 10, so the probability is 1/10.'),

-- Rate / unit-conversion "which expression computes this" questions.
-- Distractors mirror the sample''s error pattern: forgetting the final
-- unit-conversion factor, and inverting the time-conversion factor
-- (dividing instead of multiplying), with or without the unit fix.

('acl', 'Math/Quant', 'A conveyor belt moves items at a constant speed of 0.5 meters per second. Which of the expressions below could be used to compute the distance in kilometers that an item travels while on the belt for 45 minutes?',
 '["0.5×(1/60)×45×(1/1000)", "0.5×60×45×(1/1000)", "0.5×60×45", "0.5×(1/60)×45"]'::jsonb,
 1, '45 minutes must first be converted to seconds by multiplying by 60, since the rate is in meters per second. Multiplying by the rate gives the distance in meters, and dividing by 1000 converts meters to kilometers: 0.5 × 60 × 45 × (1/1000).'),

('acl', 'Math/Quant', 'A printer prints pages at a constant rate of 8 pages per minute, and paper comes in boxes of 500 sheets. Which of the expressions below could be used to compute the number of boxes of paper the printer uses if it runs continuously for 3 hours?',
 '["8×60×3×(1/500)", "8×60×3", "8×(1/60)×3×(1/500)", "8×(1/60)×3"]'::jsonb,
 0, '3 hours must first be converted to minutes by multiplying by 60, since the rate is in pages per minute. Multiplying by the rate gives the total pages printed, and dividing by 500 converts pages to boxes: 8 × 60 × 3 × (1/500).'),

('acl', 'Math/Quant', 'Water flows through a pipe at a constant rate of 2 liters per second. Which of the expressions below could be used to compute the volume in kiloliters (1 kiloliter = 1000 liters) that flows through the pipe in 2 hours?',
 '["2×3600×2", "2×(1/3600)×2×(1/1000)", "2×3600×2×(1/1000)", "2×(1/3600)×2"]'::jsonb,
 2, '2 hours must first be converted to seconds by multiplying by 3600, since the rate is in liters per second. Multiplying by the rate gives the volume in liters, and dividing by 1000 converts liters to kiloliters: 2 × 3600 × 2 × (1/1000).'),

('acl', 'Math/Quant', 'A car travels at a constant speed of 24 meters per second. Which of the expressions below is closest to computing the distance in miles (1 mile is approximately 1609 meters) the car travels in 15 minutes?',
 '["24×(1/60)×15×(1/1609)", "24×(1/60)×15", "24×60×15", "24×60×15×(1/1609)"]'::jsonb,
 3, '15 minutes must first be converted to seconds by multiplying by 60, since the speed is in meters per second. Multiplying by the speed gives the distance in meters, and dividing by 1609 converts meters to miles: 24 × 60 × 15 × (1/1609).');
