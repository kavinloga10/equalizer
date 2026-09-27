-- Equalizer schema v17: adds 5 original "real-world linear model, plug in
-- x and solve for y, round to the nearest whole number" questions -- a
-- type confirmed missing from the bank (no existing question used a
-- "y = mx + b" model with a plug-in-and-evaluate word problem). Each uses
-- a different scenario, slope, intercept, and x-value than the sample
-- this was modeled on and than each other. Every correct answer and
-- distractor was computed programmatically and checked to confirm all
-- four options are distinct for every question. Distractors mirror real
-- errors: forgetting to add the intercept, adding the intercept to x
-- before multiplying by the slope (an order-of-operations slip), and
-- truncating instead of rounding.
--
-- Per instruction, this migration does NOT remove any duplicate
-- questions -- it only adds, bringing the total question count from 215
-- to 220.

insert into public.questions (subject, category, question, options, answer_index, explanation) values

('acl', 'Math/Quant', 'An ice cream shop''s daily sales depend heavily on the temperature outside: this can be modeled by the equation y = 2.15x - 12.4, where x is the high temperature in degrees Fahrenheit and y is the shop''s sales in dollars that day. Using the model, how much would the shop sell if the high temperature was 75 degrees Fahrenheit? Round your answer to the nearest dollar.',
 '["$161", "$149", "$135", "$148"]'::jsonb,
 1, 'Substitute x = 75 into the model: y = 2.15(75) - 12.4 = 161.25 - 12.4 = 148.85, which rounds to $149. ($161 forgets to subtract 12.4; $135 mistakenly adds 75 and -12.4 before multiplying by 2.15; $148 truncates 148.85 instead of rounding it.)'),

('acl', 'Math/Quant', 'A tutoring center found that a student''s test score depends on how many hours they studied that week: this can be modeled by the equation y = 3.2x + 45.5, where x is the number of hours studied and y is the student''s predicted test score. Using the model, what score would a student who studied 6 hours be predicted to earn? Round your answer to the nearest point.',
 '["19", "165", "65", "64"]'::jsonb,
 2, 'Substitute x = 6 into the model: y = 3.2(6) + 45.5 = 19.2 + 45.5 = 64.7, which rounds to 65. (19 forgets to add 45.5; 165 mistakenly adds 6 and 45.5 before multiplying by 3.2; 64 truncates 64.7 instead of rounding it.)'),

('acl', 'Math/Quant', 'A car''s highway fuel efficiency drops as its speed increases: this can be modeled by the equation y = -0.18x + 42.6, where x is the car''s speed in miles per hour and y is its fuel efficiency in miles per gallon. Using the model, what fuel efficiency would the car get at a speed of 65 miles per hour? Round your answer to the nearest mile per gallon.',
 '["-12", "-19", "30", "31"]'::jsonb,
 3, 'Substitute x = 65 into the model: y = -0.18(65) + 42.6 = -11.7 + 42.6 = 30.9, which rounds to 31. (-12 forgets to add 42.6; -19 mistakenly adds 65 and 42.6 before multiplying by -0.18; 30 truncates 30.9 instead of rounding it.)'),

('acl', 'Math/Quant', 'A greenhouse tracks how a seedling''s height depends on its daily sunlight exposure: this can be modeled by the equation y = 1.35x + 2.1, where x is hours of sunlight per day and y is the seedling''s height in centimeters after one week. Using the model, how tall would a seedling be after a week of 8 hours of daily sunlight? Round your answer to the nearest centimeter.',
 '["13", "11", "14", "12"]'::jsonb,
 0, 'Substitute x = 8 into the model: y = 1.35(8) + 2.1 = 10.8 + 2.1 = 12.9, which rounds to 13. (11 forgets to add 2.1; 14 mistakenly adds 8 and 2.1 before multiplying by 1.35; 12 truncates 12.9 instead of rounding it.)'),

('acl', 'Math/Quant', 'A gym found that the number of new memberships each month depends on how many ads it runs: this can be modeled by the equation y = 4.25x + 19.1, where x is the number of ads run and y is the number of new signups that month. Using the model, how many new signups would be predicted if the gym ran 22 ads? Round your answer to the nearest signup.',
 '["112", "113", "94", "175"]'::jsonb,
 1, 'Substitute x = 22 into the model: y = 4.25(22) + 19.1 = 93.5 + 19.1 = 112.6, which rounds to 113. (112 truncates 112.6 instead of rounding it; 94 forgets to add 19.1; 175 mistakenly adds 22 and 19.1 before multiplying by 4.25.)');
