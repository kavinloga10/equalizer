-- Equalizer schema v8: redesign TJ practice questions to remove close
-- paraphrases of a third-party test-prep series (confirmed via direct
-- comparison against two external PDFs, 2026-08-15). Each row below keeps
-- the original correct answer/options (verified unchanged, only the
-- narrative scenario changed) except where the answer set itself needed
-- reformatting for the new scenario.
-- Run this once in the Supabase SQL Editor (Project -> SQL Editor -> New query -> Run).

update public.questions set
  question = 'If n is an integer, which of the following expressions must also be an integer?',
  options = '["−n", "n/2", "2/n", "√n"]'::jsonb,
  answer_index = 0,
  explanation = 'The negative of any integer is always an integer. The other options fail for many integers (e.g. n=3: n/2=1.5, 2/n=0.67, √n isn''t whole). ✓'
where id = 1;

update public.questions set
  question = 'A blogger claimed a large country''s total annual coffee consumption was about 14 trillion cups, and with a population of about 300 million, estimated that averages to about 5,000 cups per person per year. How reasonable is this estimate?',
  options = '["It is too low by a factor of 10", "It is too low by a factor of 100", "It is too high by a factor of 10", "It is too high by a factor of 100"]'::jsonb,
  answer_index = 0,
  explanation = 'Actual = 14,000,000,000,000 ÷ 300,000,000 ≈ 46,667 cups per person. That''s about 9-10× more than the 5,000-cup estimate, so the estimate is too low by roughly a factor of 10. ✓'
where id = 2;

update public.questions set
  question = 'A vending machine randomly dispenses one of 7 different flavors of gum, with each equally likely. If two students each buy one item from the machine, what is the probability they get the same one?',
  options = '["1/7", "1/14", "1/42", "1/49"]'::jsonb,
  answer_index = 0,
  explanation = 'The first student''s item doesn''t matter. The second student just needs to match it: probability = 1/7. ✓'
where id = 3;

update public.questions set
  question = 'A streaming service is offering 20% off annual plans. Marcus was charged $8.73 after the discount. Let p represent the regular price. Which equation is correct?',
  options = '["0.8p = $8.73", "$8.73 + 0.2×$8.73 = p", "1.2×$8.73 = p", "p − 0.2×$8.73 = p"]'::jsonb,
  answer_index = 0,
  explanation = '20% off means he paid 80% of the regular price: 0.8p = $8.73. ✓'
where id = 4;

update public.questions set
  question = 'A (non-rectangular, non-rhombus) parallelogram is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["2 lines of reflective symmetry and one center of rotational symmetry", "0 lines of reflective symmetry and one center of rotational symmetry", "4 lines of reflective symmetry and one center of rotational symmetry", "2 lines of reflective symmetry and no center of rotational symmetry"]'::jsonb,
  answer_index = 1,
  explanation = 'A generic parallelogram has no mirror-symmetry lines, but rotating it 180° about its center maps it onto itself — one center of rotational symmetry. ✓'
where id = 5;

update public.questions set
  question = 'A garden path design uses a row of gray pavers surrounded by a 1-paver-thick white border (forming a 3-row rectangle). How many white pavers would surround a row of 157 gray pavers?',
  options = '["320", "324", "327", "336"]'::jsonb,
  answer_index = 0,
  explanation = 'For n gray pavers, the whole shape is 3 rows × (n+2) columns, all white except the n gray pavers in the middle row: white = 3(n+2) − n = 2n + 6. For n=157: 2(157)+6 = 320. ✓'
where id = 6;

update public.questions set
  question = 'A school district building a new wheelchair ramp must follow ADA regulations: slope ≤ 1:12 (preferably 1:16–1:20) and max rise of 30 inches. Based on the graph of rise vs. run for four candidate ramp designs (B, C, D), which design complies?',
  options = '["B", "C", "D", "None of these"]'::jsonb,
  answer_index = 0,
  explanation = 'Ramp B (~22 ft run, ~1.8 ft rise) gives a slope of about 1:12.2 — within the 1:12 max — and a rise of about 21.6 in, under the 30 in cap. Ramp C is far too steep (~1:7), failing the slope requirement. ✓'
where id = 7;

update public.questions set
  question = 'Sound travels through dry air at 68°F at 343.2 meters per second. Which expression below computes how many kilometers a sound wave would travel in 10 minutes at that speed?',
  options = '["343.2×60×10", "343.2×60×10×(1/1000)", "343.2×(1/60)×10", "343.2×(1/60)×10×(1/1000)"]'::jsonb,
  answer_index = 1,
  explanation = '10 minutes = 600 seconds = 60×10. Meters traveled = 343.2 × 60 × 10. Divide by 1000 to convert to kilometers. ✓'
where id = 8;

update public.questions set
  question = 'On a regional map, the distance from Ashcroft to Millbrook is 6 cm, representing an actual distance of 702 miles. Using the same scale, what map distance is closest to the actual distance of 2,708 miles between Ashcroft and Dunwood?',
  options = '["21 cm", "22 cm", "23 cm", "25 cm"]'::jsonb,
  answer_index = 2,
  explanation = 'Scale: 6 cm / 702 mi. Map distance = 6 × (2708/702) ≈ 23.1 cm, closest to 23 cm. ✓'
where id = 9;

update public.questions set
  question = 'Which combination of transformations maps the leftmost L-shaped figure onto the rightmost L-shaped figure shown below?',
  options = '["A 90° clockwise rotation about (2,1) followed by a translation of two units to the right", "A translation 3 units up, followed by a reflection about the line y = x", "A 90° clockwise rotation about (5,1), followed by a translation of 2 units up", "A 90° clockwise rotation about (2,1) followed by a translation of 2 units to the right"]'::jsonb,
  answer_index = 0,
  explanation = 'Rotating the shape 90° clockwise about the point (2,1) and then sliding it two units right lands it exactly on the target figure. ✓'
where id = 10;

update public.questions set
  question = 'A study examines the relationship between sleep duration and academic performance in high schoolers. Which of the following questions is irrelevant to the research?',
  options = '["Do students who sleep more report feeling more alert in class?", "Are there more students enrolled at the school now than before?", "Is pizza a popular lunch choice at the school cafeteria?", "Are students taught healthy sleep habits in health class?"]'::jsonb,
  answer_index = 2,
  explanation = 'Whether pizza is popular at the cafeteria has nothing to do with sleep duration or academic performance — it''s off-topic for this research question. ✓'
where id = 11;

update public.questions set
  question = 'After basketball practice, Amy feels warm and achy. Bianca mentions a news report that 18% of the neighborhood recently caught a stomach bug. Amy asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You definitely have the flu", "Maybe Amy. But, perhaps not", "You have an 18% chance of having flu", "Let''s hope you do not have the flu"]'::jsonb,
  answer_index = 1,
  explanation = 'Tiredness and cold could be a stomach bug or something else entirely (exertion, weather). The honest, logical answer acknowledges the uncertainty. ✓'
where id = 12;

update public.questions set
  question = 'For a triangle where the sum of its base (B) and height (H) is fixed, what relationship between B and H produces the maximum possible area?',
  options = '["B = H", "B = 2H", "B = 0.5H", "B = 0.3H"]'::jsonb,
  answer_index = 0,
  explanation = 'For a fixed sum, the product of two numbers is maximized when they''re equal (basic optimization result) — so B = H maximizes Area = ½BH. ✓'
where id = 13;

update public.questions set
  question = 'A school cafeteria tracked how many students chose pizza, salad, and pasta at lunch. Pizza=60, Salad=285, Pasta=387. A pie chart shows Pasta=210°, Pizza=30°, Salad=120°. Does this pie chart correctly represent the data?',
  options = '["Yes", "No", "May be", "Cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = 'Total = 732. Expected angles: buses ≈30° (matches), cars ≈285/732×360≈140° (chart shows 120° — wrong), motorcycles ≈387/732×360≈190° (chart shows 210° — wrong). The chart is inaccurate. ✓'
where id = 14;

update public.questions set
  question = 'A table shows the percentage of students who ride each bus route: Route A=20%, Route B=35%, Route C=30%, Route D=15%. If shown in a pie chart, what is the sector angle for Route D?',
  options = '["60°", "72°", "45°", "54°"]'::jsonb,
  answer_index = 3,
  explanation = 'Sector angle = percentage × 360°. For D: 0.15 × 360 = 54°. ✓'
where id = 15;

update public.questions set
  question = 'A large cube built from 216 unit cubes (6×6×6) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["24", "36", "48", "60", "72"]'::jsonb,
  answer_index = 1,
  explanation = 'For an n×n×n cube (n=6), a 45° diagonal plane cut starting along one edge slices through n² = 36 unit cubes. ✓'
where id = 16;

update public.questions set
  question = 'A large cube built from 125 unit cubes (5×5×5) is sliced at a 45° angle, starting from one of its corners. How many of the unit cubes does the cut pass through?',
  options = '["30", "25", "20", "15", "10"]'::jsonb,
  answer_index = 1,
  explanation = 'For an n×n×n cube (n=5), the diagonal cutting plane passes through n² = 25 unit cubes. ✓'
where id = 17;

update public.questions set
  question = 'Consider the sequence of shapes triangle, square, pentagon, hexagon, and so on, each adding one more side than the last. As this sequence continues indefinitely, what shape does it approach?',
  options = '["A cube", "A point", "A circle", "Cannot be determined"]'::jsonb,
  answer_index = 2,
  explanation = 'As the number of sides of a regular polygon increases without bound, the shape approaches a circle. ✓'
where id = 18;

update public.questions set
  question = 'The Chess Club''s savings account holds $10,000 and earns 2% interest per year, compounded annually. What is the balance at the end of the second year?',
  options = '["$10,240", "$10,400", "$10,404", "$10,440"]'::jsonb,
  answer_index = 2,
  explanation = 'Balance = $10,000 × 1.02² = $10,000 × 1.0404 = $10,404. ✓'
where id = 19;

update public.questions set
  question = 'A city park''s monthly visitor count grew 10% in the first month of a new season, then shrank 20% in the second month. What is the net percentage change over the two months?',
  options = '["6% decrease", "8% decrease", "10% decrease", "12% decrease"]'::jsonb,
  answer_index = 3,
  explanation = 'Net factor = 1.10 × 0.80 = 0.88, which is a 12% decrease from the original value. ✓'
where id = 20;

update public.questions set
  question = 'A cube with all outer faces painted red is disassembled into 125 unit cubes (5×5×5). How many of these unit cubes have exactly two red faces?',
  options = '["27", "36", "44", "54"]'::jsonb,
  answer_index = 1,
  explanation = 'Edge cubes (excluding corners) have exactly 2 painted faces: 12 edges × (n−2) = 12 × 3 = 36 for n=5. ✓'
where id = 21;

update public.questions set
  question = 'A rain barrel holds 21 gallons. A garden hose adds 1 gallon every 20 seconds. Once the barrel reaches 18 gallons, a small crack also lets out 1 gallon every 40 seconds. Mateo turns on the hose (barrel starts empty) and leaves. How many minutes until the barrel overflows?',
  options = '["8", "7", "6", "5.5"]'::jsonb,
  answer_index = 0,
  explanation = 'Filling to 18 gal at 3 gal/min takes 6 min. From 18 to 21 gal (3 more gallons), net rate = 3 − 1.5 = 1.5 gal/min, taking 2 more minutes. Total = 6 + 2 = 8 minutes. ✓'
where id = 22;

update public.questions set
  question = 'In a string of holiday lights, bulb L1 is wired directly into the main circuit, while bulbs L2 and L3 each sit on their own switch (S1, S2) in separate parallel branches. Which switch positions make bulb L1 light up?',
  options = '["Close S1 only", "Close S2 only", "Close both S1 and S2", "All of these"]'::jsonb,
  answer_index = 3,
  explanation = 'Since L1''s branch has no switch and is always connected to the power source, it lights up regardless of what S1 and S2 are doing. ✓'
where id = 23;

update public.questions set
  question = 'An orange is sliced 6 times, with every cut passing through the same central axis and the cuts evenly spaced apart. What is the greatest number of pieces this can produce?',
  options = '["6", "8", "10", "12"]'::jsonb,
  answer_index = 3,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=6: 2×6 = 12 pieces. ✓'
where id = 24;

update public.questions set
  question = 'Nina is nervous about qualifying for the school concert. Valarie reassures Nina: "You''re clearly one of the best musicians I know, and everyone that good always gets a chance to perform, so you''re basically guaranteed a spot." Assuming Valarie''s claim about Nina''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Cannot be true", "Probably true, but may be false", "Probably false, but may be true"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone good gets a chance'' (universal) and Nina is good, then logically Nina must get a chance — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 25;

update public.questions set
  question = 'A hexagonal garden planter, 1 m tall, holds 75 cubic meters of soil. A second planter has the same hexagonal shape but with sides twice as long, and is also 1 m tall. How much soil does it hold?',
  options = '["75 cubic meters", "150 cubic meters", "300 cubic meters", "600 cubic meters"]'::jsonb,
  answer_index = 2,
  explanation = 'Doubling the side length of a 2D shape quadruples its area. Volume = new area × height = 4 × 75 × 1 = 300 m³. ✓'
where id = 26;

update public.questions set
  question = 'Coffee beans normally cost $4.99/lb. Malik wants 3 pounds. Store A: buy 2, get the 3rd half price. Store B: 15% off per pound. Store C: 1/4 off of three pounds. Store D: $1 off per pound. Which store is cheapest?',
  options = '["Store A", "Store B", "Store C", "Store D"]'::jsonb,
  answer_index = 2,
  explanation = 'A: 2(4.99)+0.5(4.99) = $12.48. B: 3(4.99)(0.85) = $12.72. C: 3(4.99)(0.75) = $11.23. D: 3(4.99−1) = $11.97. Store C is cheapest. ✓'
where id = 27;

update public.questions set
  question = 'Two classmates ordered pizza using a buy-one-get-one-free coupon, plus tax and a fixed 15% tip on the food charges. What was their percentage savings on the whole transaction (compared to paying full price for both pizzas)?',
  options = '["30%", "40%", "50%", "Cannot be determined"]'::jsonb,
  answer_index = 2,
  explanation = 'Paying for one meal instead of two — with tax and tip scaling proportionally with the food charge — works out to exactly half the total bill either way, so savings = 50%. ✓'
where id = 29;

update public.questions set
  question = 'The Falcons finished a basketball season winning 10 more games than they lost. What was their winning percentage?',
  options = '["70%", "65%", "60%", "Cannot be determined"]'::jsonb,
  answer_index = 3,
  explanation = 'Without knowing the total number of games played, a fixed margin of 10 wins over losses doesn''t pin down a winning percentage (11-1 and 20-10 both fit ''won 10 more'' but give very different percentages). ✓'
where id = 30;

update public.questions set
  question = 'Every student in a class plays at least one sport. 24 students play at least one team sport, 18 play at least one individual sport, and 4 play both. How many students are in the class?',
  options = '["46", "38", "22", "Cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = 'By inclusion-exclusion, students playing at least one sport = 24 + 18 − 4 = 38, and since every student plays a sport, that''s the total. ✓'
where id = 31;

update public.questions set
  question = 'Amy is nervous about qualifying for the regional tournament. Elena reassures Amy: "You''re clearly one of the most dedicated people at painting I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Elena''s claim about Amy''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be true", "Probably false, but may be true", "Probably true, but may be false", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Amy is dedicated, then logically Amy must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 32;

update public.questions set
  question = 'The Robotics Club''s savings account holds $2,000.00 and earns 6% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$2,480.00", "$1,561.50", "$2,382.03", "$2,524.95"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $2,000.00 × 1.06^4 = $2,524.95. ✓'
where id = 33;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C→D→E→F; Gear A turns counter-clockwise. Which direction does Gear F turn?',
  options = '["clockwise", "In either direction", "Cannot be determined", "counter-clockwise"]'::jsonb,
  answer_index = 0,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear F is 5 steps from Gear A, so it ends up rotating clockwise. ✓'
where id = 34;

update public.questions set
  question = 'A city park''s monthly visitor count grew 40% in the first month of a new season, then shrank 25% in the second month. What is the net percentage change over the two months?',
  options = '["15% decrease", "65% decrease", "5.0% increase", "15% increase"]'::jsonb,
  answer_index = 2,
  explanation = 'Net factor = 1.4 × 0.75 = 1.05, a 5.0% increase. ✓'
where id = 35;

update public.questions set
  question = 'The Debate Club''s savings account holds $1,000.00 and earns 4% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$884.74", "$1,120.00", "$1,124.86", "$1,081.60"]'::jsonb,
  answer_index = 2,
  explanation = 'Compound growth: balance = $1,000.00 × 1.04^3 = $1,124.86. ✓'
where id = 36;

update public.questions set
  question = 'Theo is nervous about qualifying for the recital. Jamal reassures Theo: "You''re clearly one of the most talented people at coding I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Jamal''s claim about Theo''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be true", "Cannot be false", "Probably false, but may be true", "Probably true, but may be false"]'::jsonb,
  answer_index = 1,
  explanation = 'If ''everyone talented gets a spot'' (universal) and Theo is talented, then logically Theo must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 37;

update public.questions set
  question = 'Ben is nervous about qualifying for the talent show. Milo reassures Ben: "You''re clearly one of the most skilled people at debate I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Milo''s claim about Ben''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Probably false, but may be true", "Cannot be false", "Cannot be true"]'::jsonb,
  answer_index = 2,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Ben is skilled, then logically Ben must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 38;

update public.questions set
  question = 'An orange is sliced 8 times, with every cut passing through the same central axis and the cuts evenly spaced apart. What is the greatest number of pieces this can produce?',
  options = '["18", "8", "16", "15"]'::jsonb,
  answer_index = 2,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=8: 2×8 = 16 pieces. ✓'
where id = 39;

update public.questions set
  question = 'A cube with all outer faces painted red is disassembled into 729 unit cubes (9×9×9). How many of these unit cubes have exactly two red faces?',
  options = '["8", "84", "343", "294"]'::jsonb,
  answer_index = 1,
  explanation = 'Edge cubes (excluding corners) have exactly 2 painted faces: 12 edges × (n−2) = 12 × 7 = 84 for n=9. ✓'
where id = 40;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C; Gear A turns clockwise. Which direction does Gear C turn?',
  options = '["clockwise", "In either direction", "Cannot be determined", "counter-clockwise"]'::jsonb,
  answer_index = 0,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear C is 2 steps from Gear A, so it ends up rotating clockwise. ✓'
where id = 41;

update public.questions set
  question = 'Storage crates are being packed with 4-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 1.5 ft × 2 ft × 3 ft?',
  options = '["240", "212", "246", "216"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 18×24×36. Cubes per dimension: 18/4=4, 24/4=6, 36/4=9. Total = 4×6×9 = 216. ✓'
where id = 42;

update public.questions set
  question = 'An orange is sliced 5 times, with every cut passing through the same central axis and the cuts evenly spaced apart. What is the greatest number of pieces this can produce?',
  options = '["9", "5", "12", "10"]'::jsonb,
  answer_index = 3,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=5: 2×5 = 10 pieces. ✓'
where id = 43;

update public.questions set
  question = 'A cube with all outer faces painted red is disassembled into 125 unit cubes (5×5×5). How many of these unit cubes have exactly two red faces?',
  options = '["36", "8", "27", "54"]'::jsonb,
  answer_index = 0,
  explanation = 'Edge cubes (excluding corners) have exactly 2 painted faces: 12 edges × (n−2) = 12 × 3 = 36 for n=5. ✓'
where id = 44;

update public.questions set
  question = 'A sign maker was supposed to spell out STONE in neon letters for a storefront, but mistakenly arranged them as SETNO. What is the least number of letter swaps needed to fix it?',
  options = '["1", "2", "3", "4"]'::jsonb,
  answer_index = 1,
  explanation = 'Comparing SETNO to STONE position by position and tracing the misplaced letters into swap cycles gives a minimum of 2 swap(s) to correct. ✓'
where id = 45;

update public.questions set
  question = 'A city park''s monthly visitor count grew 30% in the first month of a new season, then shrank 25% in the second month. What is the net percentage change over the two months?',
  options = '["5% increase", "5% decrease", "55% increase", "2.5% decrease"]'::jsonb,
  answer_index = 3,
  explanation = 'Net factor = 1.3 × 0.75 = 0.975, a 2.5% decrease. ✓'
where id = 46;

update public.questions set
  question = 'A study examines the relationship between fertilizer amount and crop yield. Which question is irrelevant to the research?',
  options = '["Could a third factor be influencing both variables?", "Is the soil pH consistent across the field?", "Does more fertilizer increase yield?", "What brand of tractor is used on the farm?"]'::jsonb,
  answer_index = 3,
  explanation = 'What brand of tractor is used on the farm has nothing to do with fertilizer amount and crop yield — it''s off-topic for this research question. ✓'
where id = 47;

update public.questions set
  question = 'A sign maker was supposed to spell out BRAVE in neon letters for a storefront, but mistakenly arranged them as BRVAE. What is the least number of letter swaps needed to fix it?',
  options = '["0", "1", "2", "3"]'::jsonb,
  answer_index = 1,
  explanation = 'Comparing BRVAE to BRAVE position by position and tracing the misplaced letters into swap cycles gives a minimum of 1 swap(s) to correct. ✓'
where id = 48;

update public.questions set
  question = 'Derek feels a bit lightheaded after climbing several flights of stairs. Jamal mentions that 9% of the office has been diagnosed with low iron levels. Derek asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You have a 9% chance of having it", "Maybe Derek. But, perhaps not", "Let''s hope you do not have it", "You definitely have a blood pressure issue"]'::jsonb,
  answer_index = 1,
  explanation = 'The symptoms described could have many causes besides low iron levels. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 49;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C→D; Gear A turns clockwise. Which direction does Gear D turn?',
  options = '["Cannot be determined", "clockwise", "In either direction", "counter-clockwise"]'::jsonb,
  answer_index = 3,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear D is 3 steps from Gear A, so it ends up rotating counter-clockwise. ✓'
where id = 50;

update public.questions set
  question = 'Three storage bins are labeled ''sneakers'', ''sandals'', and ''sneakers and sandals'' — but all labels are wrong. Which bin must you open to correctly relabel all three?',
  options = '["Box marked ''sandals''", "Any one of the three boxes", "Box marked ''sneakers and sandals''", "Box marked ''sneakers''"]'::jsonb,
  answer_index = 2,
  explanation = 'Since every label is wrong, the bin marked ''sneakers and sandals'' can''t actually be mixed — it must hold only one item type. Opening just that bin reveals its true content, letting you deduce the other two by elimination. ✓'
where id = 51;

update public.questions set
  question = 'The deer population at the Timber Ridge Wildlife Sanctuary increases 12% every 5 years. What is the approximate net percentage change in the deer population after 15 years?',
  options = '["44%", "36%", "35%", "40%"]'::jsonb,
  answer_index = 3,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.12^3 ≈ 1.405, a 40% increase. ✓'
where id = 52;

update public.questions set
  question = 'In a circuit, resistors R1 and R2 (each 2 Ohms) are connected in parallel between points a and b. Point b connects to point c, where two more 2-Ohm resistors, R3 and R4, are connected in series, ending at point d. What is the total resistance measured between points a and d?',
  options = '["6 Ohms", "8 Ohms", "3 Ohms", "5 Ohms"]'::jsonb,
  answer_index = 3,
  explanation = 'R1∥R2 = 2/2 = 1 Ohms. R3+R4 in series = 4 Ohms. Since b and c are joined, total = 1 Ohms + 4 Ohms = 5 Ohms. ✓'
where id = 53;

update public.questions set
  question = 'The deer population at the Elk Hollow Wildlife Sanctuary increases 15% every 5 years. What is the approximate net percentage change in the deer population after 10 years?',
  options = '["32%", "30%", "27%", "36%"]'::jsonb,
  answer_index = 0,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.15^2 ≈ 1.322, a 32% increase. ✓'
where id = 54;

update public.questions set
  question = 'The deer population at the Cedar Point Wildlife Sanctuary increases 10% every 5 years. What is the approximate net percentage change in the deer population after 15 years?',
  options = '["33%", "30%", "37%", "28%"]'::jsonb,
  answer_index = 0,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.10^3 ≈ 1.331, a 33% increase. ✓'
where id = 55;

update public.questions set
  question = 'A non-rectangular rhombus is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["0 lines of reflective symmetry and no center of rotational symmetry", "2 lines of reflective symmetry and one center of rotational symmetry", "3 lines of reflective symmetry and one center of rotational symmetry", "1 lines of reflective symmetry and one center of rotational symmetry"]'::jsonb,
  answer_index = 1,
  explanation = 'A non-rectangular rhombus has 2 line(s) of mirror symmetry, and does map onto itself under a partial rotation, giving one center of rotational symmetry. ✓'
where id = 56;

update public.questions set
  question = 'The Art Club''s savings account holds $8,000.00 and earns 2% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$8,160.00", "$8,320.00", "$7,683.20", "$8,323.20"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $8,000.00 × 1.02^2 = $8,323.20. ✓'
where id = 57;

update public.questions set
  question = 'Owen drove to a county fair at 50 mph and returned along the same highway at 30 mph. What was the average speed for the round trip?',
  options = '["50 mph", "40 mph", "30 mph", "37.5 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(30)/(50+30) = 37.5 mph. ✓'
where id = 58;

update public.questions set
  question = 'An orange is sliced 6 times, with every cut passing through the same central axis and the cuts evenly spaced apart. What is the greatest number of pieces this can produce?',
  options = '["6", "12", "11", "14"]'::jsonb,
  answer_index = 1,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=6: 2×6 = 12 pieces. ✓'
where id = 59;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B; Gear A turns clockwise. Which direction does Gear B turn?',
  options = '["counter-clockwise", "clockwise", "In either direction", "Cannot be determined"]'::jsonb,
  answer_index = 0,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear B is 1 steps from Gear A, so it ends up rotating counter-clockwise. ✓'
where id = 60;

update public.questions set
  question = 'A vending machine randomly dispenses one of 12 different keychain designs, with each equally likely. If two students each buy one item from the machine, what is the probability they get the same one?',
  options = '["1/12", "11/12", "1/144", "1/11"]'::jsonb,
  answer_index = 0,
  explanation = 'The first student''s item doesn''t matter. The second student just needs to match it: probability = 1/12. ✓'
where id = 61;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 12% of the votes. What is the angle of that club''s sector?',
  options = '["35.2°", "43.2°", "53.2°", "36°"]'::jsonb,
  answer_index = 1,
  explanation = 'Sector angle = percentage × 360° = 12% × 360° = 43.2°. ✓'
where id = 62;

update public.questions set
  question = 'Owen drove to a county fair at 60 mph and returned along the same highway at 20 mph. What was the average speed for the round trip?',
  options = '["40 mph", "20 mph", "60 mph", "30 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(60)(20)/(60+20) = 30 mph. ✓'
where id = 63;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 5% of the votes. What is the angle of that club''s sector?',
  options = '["15°", "18°", "10°", "28°"]'::jsonb,
  answer_index = 1,
  explanation = 'Sector angle = percentage × 360° = 5% × 360° = 18°. ✓'
where id = 64;

update public.questions set
  question = 'A wooden cube with all outer faces painted red is cut into 7×7×7 unit cubes. How many of these unit cubes have no more than one red face?',
  options = '["275", "60", "150", "125"]'::jsonb,
  answer_index = 0,
  explanation = 'Cubes with 1 painted face: 6(n−2)² = 6(25) = 150. Cubes with 0 painted faces: (n−2)³ = 125. Total with ≤1 face painted: 150 + 125 = 275. ✓'
where id = 65;

update public.questions set
  question = 'A vending machine randomly dispenses one of 6 different sticker designs, with each equally likely. If two students each buy one item from the machine, what is the probability they get the same one?',
  options = '["5/6", "1/36", "1/6", "1/5"]'::jsonb,
  answer_index = 2,
  explanation = 'The first student''s item doesn''t matter. The second student just needs to match it: probability = 1/6. ✓'
where id = 66;

update public.questions set
  question = 'Ben feels a bit lightheaded after climbing several flights of stairs. Tara mentions that 9% of the office has been diagnosed with low iron levels. Ben asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "You have a 9% chance of having it", "Maybe Ben. But, perhaps not", "You definitely have a blood pressure issue"]'::jsonb,
  answer_index = 2,
  explanation = 'The symptoms described could have many causes besides low iron levels. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 67;

update public.questions set
  question = 'The Drama Club''s savings account holds $1,000.00 and earns 8% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$1,160.00", "$1,080.00", "$1,166.40", "$846.40"]'::jsonb,
  answer_index = 2,
  explanation = 'Compound growth: balance = $1,000.00 × 1.08^2 = $1,166.40. ✓'
where id = 68;

update public.questions set
  question = 'Three storage bins are labeled ''pens'', ''markers'', and ''pens and markers'' — but all labels are wrong. Which bin must you open to correctly relabel all three?',
  options = '["Any one of the three boxes", "Box marked ''markers''", "Box marked ''pens''", "Box marked ''pens and markers''"]'::jsonb,
  answer_index = 3,
  explanation = 'Since every label is wrong, the bin marked ''pens and markers'' can''t actually be mixed — it must hold only one item type. Opening just that bin reveals its true content, letting you deduce the other two by elimination. ✓'
where id = 69;

update public.questions set
  question = 'A streaming service is offering 30% off annual plans. Priya signed up and was charged $52.50 after the discount. Let p represent the regular price. What was the regular price?',
  options = '["$68.25", "$36.75", "$40.38", "$75.00"]'::jsonb,
  answer_index = 3,
  explanation = '70% of the regular price p equals the discounted price: 0.70p = $52.50, so p = $52.50 / 0.70 = $75.00. ✓'
where id = 70;

update public.questions set
  question = 'Elena notices a slight headache during a long study session. Theo mentions that 25% of the dorm has been dealing with allergies this week. Elena asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You have a 25% chance of having it", "You definitely have a cold going around school", "Let''s hope you do not have it", "Maybe Elena. But, perhaps not"]'::jsonb,
  answer_index = 3,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 71;

update public.questions set
  question = 'A cube with all outer faces painted red is disassembled into 343 unit cubes (7×7×7). How many of these unit cubes have exactly two red faces?',
  options = '["8", "60", "125", "150"]'::jsonb,
  answer_index = 1,
  explanation = 'Edge cubes (excluding corners) have exactly 2 painted faces: 12 edges × (n−2) = 12 × 5 = 60 for n=7. ✓'
where id = 72;

update public.questions set
  question = 'In a security system, an alarm light is wired in series with two sensors S1 and S2, so both must be triggered (closed) to complete the loop. Which sensor settings turn the alarm light on?',
  options = '["Close S2 only", "Close S1 only", "Any single switch closed", "Close both S1 and S2"]'::jsonb,
  answer_index = 3,
  explanation = 'In a series circuit, the current has only one path, so both S1 and S2 must be closed for the bulb to glow — a single closed switch isn''t enough. ✓'
where id = 73;

update public.questions set
  question = 'The Science Club''s savings account holds $5,000.00 and earns 3% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$5,450.00", "$5,463.64", "$4,563.36", "$5,304.50"]'::jsonb,
  answer_index = 1,
  explanation = 'Compound growth: balance = $5,000.00 × 1.03^3 = $5,463.64. ✓'
where id = 74;

update public.questions set
  question = 'Grace notices a slight headache during a long study session. Wesley mentions that 25% of the dorm has been dealing with allergies this week. Grace asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You have a 25% chance of having it", "Maybe Grace. But, perhaps not", "You definitely have a cold going around school", "Let''s hope you do not have it"]'::jsonb,
  answer_index = 1,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 75;

update public.questions set
  question = 'An aquarium holds 360 gallons and starts empty. A pump fills it at 30 gallons/minute. After 2 minutes, a drain valve also opens and removes 5 gallons/minute while the pump stays on. How many minutes after filling starts does the aquarium become full?',
  options = '["13 minutes", "16 minutes", "14 minutes", "12 minutes"]'::jsonb,
  answer_index = 2,
  explanation = 'In the first 2 min, 60 gallons fill up, leaving 300 gallons. Once the drain valve opens, net rate = 30−5 = 25 gal/min, so the remaining 300 gallons take 12 more minutes. Total = 2 + 12 = 14 minutes. ✓'
where id = 76;

update public.questions set
  question = 'Sam drove to a county fair at 70 mph and returned along the same highway at 40 mph. What was the average speed for the round trip?',
  options = '["55 mph", "70 mph", "40 mph", "50.9 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(70)(40)/(70+40) = 50.9 mph. ✓'
where id = 77;

update public.questions set
  question = 'A study examines the relationship between exercise frequency and reported stress levels in adults. Which question is irrelevant to the research?',
  options = '["Are more frequent exercisers correlated with lower stress?", "Do people earn more income at larger companies?", "Could a third factor be influencing both variables?", "Is the local library well-stocked with books?"]'::jsonb,
  answer_index = 1,
  explanation = 'Whether people earn more income at larger companies has nothing to do with exercise frequency and stress levels — it''s off-topic for this research question. ✓'
where id = 78;

update public.questions set
  question = 'A scalene triangle is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["1 lines of reflective symmetry and one center of rotational symmetry", "0 lines of reflective symmetry and no center of rotational symmetry", "3 lines of reflective symmetry and one center of rotational symmetry", "2 lines of reflective symmetry and no center of rotational symmetry"]'::jsonb,
  answer_index = 1,
  explanation = 'A scalene triangle has 0 line(s) of mirror symmetry, and does not map onto itself under a partial rotation, giving no center of rotational symmetry. ✓'
where id = 79;

update public.questions set
  question = 'For how many real values of b is b^9 = b^2 true?',
  options = '["none", "four", "three", "two"]'::jsonb,
  answer_index = 3,
  explanation = 'b^9 − b^2 = 0 → b^2(b^7−1) = 0 → b=0 or b^7=1. Since 7 is odd, b^7=1 has 1 real solution(s). Total: 2. ✓'
where id = 80;

update public.questions set
  question = 'A vending machine randomly dispenses one of 7 different wrapping-paper patterns, with each equally likely. If two students each buy one item from the machine, what is the probability they get the same one?',
  options = '["1/7", "1/49", "6/7", "1/6"]'::jsonb,
  answer_index = 0,
  explanation = 'The first student''s item doesn''t matter. The second student just needs to match it: probability = 1/7. ✓'
where id = 81;

update public.questions set
  question = 'A large cube built from 1000 unit cubes (10×10×10) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["100", "81", "10", "110"]'::jsonb,
  answer_index = 0,
  explanation = 'For an n×n×n cube (n=10), a 45° diagonal plane cut starting along one edge slices through n² = 100 unit cubes. ✓'
where id = 82;

update public.questions set
  question = 'In a circuit, resistors R1 and R2 (each 4 Ohms) are connected in parallel between points a and b. Point b connects to point c, where two more 4-Ohm resistors, R3 and R4, are connected in series, ending at point d. What is the total resistance measured between points a and d?',
  options = '["6 Ohms", "16 Ohms", "12 Ohms", "10 Ohms"]'::jsonb,
  answer_index = 3,
  explanation = 'R1∥R2 = 4/2 = 2 Ohms. R3+R4 in series = 8 Ohms. Since b and c are joined, total = 2 Ohms + 8 Ohms = 10 Ohms. ✓'
where id = 83;

update public.questions set
  question = 'Storage crates are being packed with 3-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 2.5 ft × 3 ft × 3 ft?',
  options = '["1430", "1443", "1560", "1440"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 30×36×36. Cubes per dimension: 30/3=10, 36/3=12, 36/3=12. Total = 10×12×12 = 1440. ✓'
where id = 84;

update public.questions set
  question = 'A large cube built from 729 unit cubes (9×9×9) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["9", "90", "81", "64"]'::jsonb,
  answer_index = 2,
  explanation = 'For an n×n×n cube (n=9), a 45° diagonal plane cut starting along one edge slices through n² = 81 unit cubes. ✓'
where id = 85;

update public.questions set
  question = 'An orange is sliced 3 times, with every cut passing through the same central axis and the cuts evenly spaced apart. What is the greatest number of pieces this can produce?',
  options = '["6", "3", "8", "5"]'::jsonb,
  answer_index = 0,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=3: 2×3 = 6 pieces. ✓'
where id = 86;

update public.questions set
  question = 'Storage crates are being packed with 3-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 1.5 ft × 1.5 ft × 3 ft?',
  options = '["432", "468", "426", "435"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 18×18×36. Cubes per dimension: 18/3=6, 18/3=6, 36/3=12. Total = 6×6×12 = 432. ✓'
where id = 87;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C; Gear A turns counter-clockwise. Which direction does Gear C turn?',
  options = '["clockwise", "counter-clockwise", "In either direction", "Cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear C is 2 steps from Gear A, so it ends up rotating counter-clockwise. ✓'
where id = 88;

update public.questions set
  question = 'A wooden cube with all outer faces painted red is cut into 5×5×5 unit cubes. How many of these unit cubes have no more than one red face?',
  options = '["81", "54", "27", "36"]'::jsonb,
  answer_index = 0,
  explanation = 'Cubes with 1 painted face: 6(n−2)² = 6(9) = 54. Cubes with 0 painted faces: (n−2)³ = 27. Total with ≤1 face painted: 54 + 27 = 81. ✓'
where id = 89;

update public.questions set
  question = 'A streaming service is offering 25% off annual plans. Hassan signed up and was charged $60.00 after the discount. Let p represent the regular price. What was the regular price?',
  options = '["$45.00", "$48.00", "$75.00", "$80.00"]'::jsonb,
  answer_index = 3,
  explanation = '75% of the regular price p equals the discounted price: 0.75p = $60.00, so p = $60.00 / 0.75 = $80.00. ✓'
where id = 90;

update public.questions set
  question = 'Three storage bins are labeled ''apples'', ''oranges'', and ''apples and oranges'' — but all labels are wrong. Which bin must you open to correctly relabel all three?',
  options = '["Box marked ''apples and oranges''", "Box marked ''oranges''", "Box marked ''apples''", "Any one of the three boxes"]'::jsonb,
  answer_index = 0,
  explanation = 'Since every label is wrong, the bin marked ''apples and oranges'' can''t actually be mixed — it must hold only one item type. Opening just that bin reveals its true content, letting you deduce the other two by elimination. ✓'
where id = 91;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 15% of the votes. What is the angle of that club''s sector?',
  options = '["54°", "46°", "45°", "64°"]'::jsonb,
  answer_index = 0,
  explanation = 'Sector angle = percentage × 360° = 15% × 360° = 54°. ✓'
where id = 92;

update public.questions set
  question = 'A generic (non-square) rectangle is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["1 lines of reflective symmetry and one center of rotational symmetry", "0 lines of reflective symmetry and no center of rotational symmetry", "2 lines of reflective symmetry and one center of rotational symmetry", "3 lines of reflective symmetry and no center of rotational symmetry"]'::jsonb,
  answer_index = 2,
  explanation = 'A generic (non-square) rectangle has 2 line(s) of mirror symmetry, and does map onto itself under a partial rotation, giving one center of rotational symmetry. ✓'
where id = 93;

update public.questions set
  question = 'A sign maker was supposed to spell out CLOUD in neon letters for a storefront, but mistakenly arranged them as CLDUO. What is the least number of letter swaps needed to fix it?',
  options = '["0", "1", "2", "3"]'::jsonb,
  answer_index = 1,
  explanation = 'Comparing CLDUO to CLOUD position by position and tracing the misplaced letters into swap cycles gives a minimum of 1 swap(s) to correct. ✓'
where id = 94;

update public.questions set
  question = 'A sign maker was supposed to spell out RIVER in neon letters for a storefront, but mistakenly arranged them as RIEVR. What is the least number of letter swaps needed to fix it?',
  options = '["0", "1", "2", "3"]'::jsonb,
  answer_index = 1,
  explanation = 'Comparing RIEVR to RIVER position by position and tracing the misplaced letters into swap cycles gives a minimum of 1 swap(s) to correct. ✓'
where id = 95;

update public.questions set
  question = 'A vending machine randomly dispenses one of 4 different ice cream flavors, with each equally likely. If two students each buy one item from the machine, what is the probability they get the same one?',
  options = '["1/3", "1/4", "1/16", "3/4"]'::jsonb,
  answer_index = 1,
  explanation = 'The first student''s item doesn''t matter. The second student just needs to match it: probability = 1/4. ✓'
where id = 96;

update public.questions set
  question = 'A sign maker was supposed to spell out MAPLE in neon letters for a storefront, but mistakenly arranged them as MALPE. What is the least number of letter swaps needed to fix it?',
  options = '["0", "1", "2", "3"]'::jsonb,
  answer_index = 1,
  explanation = 'Comparing MALPE to MAPLE position by position and tracing the misplaced letters into swap cycles gives a minimum of 1 swap(s) to correct. ✓'
where id = 97;

update public.questions set
  question = 'For how many real values of w is w^7 = w^2 true?',
  options = '["two", "four", "three", "none"]'::jsonb,
  answer_index = 0,
  explanation = 'w^7 − w^2 = 0 → w^2(w^5−1) = 0 → w=0 or w^5=1. Since 5 is odd, w^5=1 has 1 real solution(s). Total: 2. ✓'
where id = 98;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 22% of the votes. What is the angle of that club''s sector?',
  options = '["89.2°", "79.2°", "66°", "71.2°"]'::jsonb,
  answer_index = 1,
  explanation = 'Sector angle = percentage × 360° = 22% × 360° = 79.2°. ✓'
where id = 99;

update public.questions set
  question = 'Theo is nervous about qualifying for the talent show. Vera reassures Theo: "You''re clearly one of the most talented people at coding I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Vera''s claim about Theo''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Cannot be true", "Cannot be false", "Probably false, but may be true"]'::jsonb,
  answer_index = 2,
  explanation = 'If ''everyone talented gets a spot'' (universal) and Theo is talented, then logically Theo must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 100;

update public.questions set
  question = 'A streaming service is offering 25% off annual plans. Ivy signed up and was charged $30.74 after the discount. Let p represent the regular price. What was the regular price?',
  options = '["$40.99", "$23.05", "$38.42", "$24.59"]'::jsonb,
  answer_index = 0,
  explanation = '75% of the regular price p equals the discounted price: 0.75p = $30.74, so p = $30.74 / 0.75 = $40.99. ✓'
where id = 101;

update public.questions set
  question = 'Zoe is nervous about qualifying for the regional tournament. Nina reassures Zoe: "You''re clearly one of the most dedicated people at playing the violin I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Nina''s claim about Zoe''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be true", "Probably false, but may be true", "Probably true, but may be false", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Zoe is dedicated, then logically Zoe must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 102;

update public.questions set
  question = 'A city park''s monthly visitor count grew 25% in the first month of a new season, then shrank 40% in the second month. What is the net percentage change over the two months?',
  options = '["25% decrease", "15% increase", "65% increase", "15% decrease"]'::jsonb,
  answer_index = 0,
  explanation = 'Net factor = 1.25 × 0.6 = 0.75, a 25% decrease. ✓'
where id = 103;

update public.questions set
  question = 'Carla notices a slight headache during a long study session. Rosa mentions that 25% of the dorm has been dealing with allergies this week. Carla asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "You have a 25% chance of having it", "You definitely have a cold going around school", "Maybe Carla. But, perhaps not"]'::jsonb,
  answer_index = 3,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 104;

update public.questions set
  question = 'An orange is sliced 9 times, with every cut passing through the same central axis and the cuts evenly spaced apart. What is the greatest number of pieces this can produce?',
  options = '["20", "18", "9", "17"]'::jsonb,
  answer_index = 1,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=9: 2×9 = 18 pieces. ✓'
where id = 105;

update public.questions set
  question = 'On a regional map, the distance from Bellmont to Fairhaven is 6 cm, representing an actual distance of 450 miles. Using the same scale, what map distance is closest to the actual distance of 800 miles between Bellmont and Rosedale?',
  options = '["10 cm", "11 cm", "12 cm", "13 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 6 cm / 450 mi. Map distance = 6 × (800/450) ≈ 10.7 cm, closest to 11 cm. ✓'
where id = 106;

update public.questions set
  question = 'Milo drove to a county fair at 45 mph and returned along the same highway at 30 mph. What was the average speed for the round trip?',
  options = '["45 mph", "37.5 mph", "36 mph", "30 mph"]'::jsonb,
  answer_index = 2,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(45)(30)/(45+30) = 36 mph. ✓'
where id = 107;

update public.questions set
  question = 'A wooden cube with all outer faces painted red is cut into 6×6×6 unit cubes. How many of these unit cubes have no more than one red face?',
  options = '["96", "160", "48", "64"]'::jsonb,
  answer_index = 1,
  explanation = 'Cubes with 1 painted face: 6(n−2)² = 6(16) = 96. Cubes with 0 painted faces: (n−2)³ = 64. Total with ≤1 face painted: 96 + 64 = 160. ✓'
where id = 108;

update public.questions set
  question = 'A regular octagon is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["1 lines of reflective symmetry and one center of rotational symmetry", "2 lines of reflective symmetry and no center of rotational symmetry", "0 lines of reflective symmetry and no center of rotational symmetry", "8 lines of reflective symmetry and one center of rotational symmetry"]'::jsonb,
  answer_index = 3,
  explanation = 'A regular octagon has 8 line(s) of mirror symmetry, and does map onto itself under a partial rotation, giving one center of rotational symmetry. ✓'
where id = 109;

update public.questions set
  question = 'Storage crates are being packed with 2-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 2 ft × 2 ft × 3 ft?',
  options = '["2592", "2736", "2580", "2595"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 24×24×36. Cubes per dimension: 24/2=12, 24/2=12, 36/2=18. Total = 12×12×18 = 2592. ✓'
where id = 110;

update public.questions set
  question = 'Storage crates are being packed with 4-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 2 ft × 2 ft × 2.5 ft?',
  options = '["252", "273", "288", "246"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 24×24×30. Cubes per dimension: 24/4=6, 24/4=6, 30/4=7. Total = 6×6×7 = 252. ✓'
where id = 111;

update public.questions set
  question = 'The Yearbook Club''s savings account holds $2,000.00 and earns 4% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$1,843.20", "$2,080.00", "$2,163.20", "$2,160.00"]'::jsonb,
  answer_index = 2,
  explanation = 'Compound growth: balance = $2,000.00 × 1.04^2 = $2,163.20. ✓'
where id = 112;

update public.questions set
  question = 'A cube with all outer faces painted red is disassembled into 216 unit cubes (6×6×6). How many of these unit cubes have exactly two red faces?',
  options = '["96", "48", "64", "8"]'::jsonb,
  answer_index = 1,
  explanation = 'Edge cubes (excluding corners) have exactly 2 painted faces: 12 edges × (n−2) = 12 × 4 = 48 for n=6. ✓'
where id = 113;

update public.questions set
  question = 'Xena feels a bit lightheaded after climbing several flights of stairs. Elena mentions that 9% of the office has been diagnosed with low iron levels. Xena asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You have a 9% chance of having it", "You definitely have a blood pressure issue", "Let''s hope you do not have it", "Maybe Xena. But, perhaps not"]'::jsonb,
  answer_index = 3,
  explanation = 'The symptoms described could have many causes besides low iron levels. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 114;

update public.questions set
  question = 'Umar is nervous about qualifying for the regional tournament. Ivy reassures Umar: "You''re clearly one of the most dedicated people at competitive chess I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Ivy''s claim about Umar''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be true", "Probably true, but may be false", "Probably false, but may be true", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Umar is dedicated, then logically Umar must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 115;

update public.questions set
  question = 'The deer population at the Bear Creek Wildlife Sanctuary increases 8% every 5 years. What is the approximate net percentage change in the deer population after 15 years?',
  options = '["26%", "24%", "30%", "21%"]'::jsonb,
  answer_index = 0,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.08^3 ≈ 1.260, a 26% increase. ✓'
where id = 116;

update public.questions set
  question = 'A large cube built from 125 unit cubes (5×5×5) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["25", "5", "16", "30"]'::jsonb,
  answer_index = 0,
  explanation = 'For an n×n×n cube (n=5), a 45° diagonal plane cut starting along one edge slices through n² = 25 unit cubes. ✓'
where id = 117;

update public.questions set
  question = 'Storage crates are being packed with 4-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 1 ft × 1.5 ft × 2.5 ft?',
  options = '["104", "84", "81", "96"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 12×18×30. Cubes per dimension: 12/4=3, 18/4=4, 30/4=7. Total = 3×4×7 = 84. ✓'
where id = 118;

update public.questions set
  question = 'A city park''s monthly visitor count shrank 50% in the first month of a new season, then grew 20% in the second month. What is the net percentage change over the two months?',
  options = '["70% increase", "40% decrease", "30% increase", "30% decrease"]'::jsonb,
  answer_index = 1,
  explanation = 'Net factor = 0.5 × 1.2 = 0.6, a 40% decrease. ✓'
where id = 119;

update public.questions set
  question = 'Storage crates are being packed with 3-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 2 ft × 2.5 ft × 3 ft?',
  options = '["952", "960", "1040", "963"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 24×30×36. Cubes per dimension: 24/3=8, 30/3=10, 36/3=12. Total = 8×10×12 = 960. ✓'
where id = 120;

update public.questions set
  question = 'Aisha is nervous about qualifying for the recital. Ivy reassures Aisha: "You''re clearly one of the most skilled people at coding I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Ivy''s claim about Aisha''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be true", "Probably true, but may be false", "Probably false, but may be true", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Aisha is skilled, then logically Aisha must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 121;

update public.questions set
  question = 'Rosa drove to a county fair at 70 mph and returned along the same highway at 40 mph. What was the average speed for the round trip?',
  options = '["40 mph", "55 mph", "50.9 mph", "70 mph"]'::jsonb,
  answer_index = 2,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(70)(40)/(70+40) = 50.9 mph. ✓'
where id = 122;

update public.questions set
  question = 'Umar feels a bit lightheaded after climbing several flights of stairs. Zoe mentions that 9% of the office has been diagnosed with low iron levels. Umar asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You definitely have a blood pressure issue", "You have a 9% chance of having it", "Maybe Umar. But, perhaps not", "Let''s hope you do not have it"]'::jsonb,
  answer_index = 2,
  explanation = 'The symptoms described could have many causes besides low iron levels. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 123;

update public.questions set
  question = 'A regular hexagon is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["1 lines of reflective symmetry and one center of rotational symmetry", "6 lines of reflective symmetry and one center of rotational symmetry", "2 lines of reflective symmetry and one center of rotational symmetry", "0 lines of reflective symmetry and no center of rotational symmetry"]'::jsonb,
  answer_index = 1,
  explanation = 'A regular hexagon has 6 line(s) of mirror symmetry, and does map onto itself under a partial rotation, giving one center of rotational symmetry. ✓'
where id = 124;

update public.questions set
  question = 'A square is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["0 lines of reflective symmetry and one center of rotational symmetry", "1 lines of reflective symmetry and no center of rotational symmetry", "4 lines of reflective symmetry and one center of rotational symmetry", "2 lines of reflective symmetry and no center of rotational symmetry"]'::jsonb,
  answer_index = 2,
  explanation = 'A square has 4 line(s) of mirror symmetry, and does map onto itself under a partial rotation, giving one center of rotational symmetry. ✓'
where id = 125;

update public.questions set
  question = 'A equilateral triangle is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["1 lines of reflective symmetry and no center of rotational symmetry", "2 lines of reflective symmetry and no center of rotational symmetry", "3 lines of reflective symmetry and one center of rotational symmetry", "0 lines of reflective symmetry and no center of rotational symmetry"]'::jsonb,
  answer_index = 2,
  explanation = 'A equilateral triangle has 3 line(s) of mirror symmetry, and does map onto itself under a partial rotation, giving one center of rotational symmetry. ✓'
where id = 126;

update public.questions set
  question = 'The deer population at the Wolf Bend Wildlife Sanctuary increases 10% every 5 years. What is the approximate net percentage change in the deer population after 15 years?',
  options = '["37%", "28%", "33%", "30%"]'::jsonb,
  answer_index = 2,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.10^3 ≈ 1.331, a 33% increase. ✓'
where id = 127;

update public.questions set
  question = 'A sign maker was supposed to spell out TIGER in neon letters for a storefront, but mistakenly arranged them as TIRGE. What is the least number of letter swaps needed to fix it?',
  options = '["1", "2", "3", "4"]'::jsonb,
  answer_index = 1,
  explanation = 'Comparing TIRGE to TIGER position by position and tracing the misplaced letters into swap cycles gives a minimum of 2 swap(s) to correct. ✓'
where id = 128;

update public.questions set
  question = 'Storage crates are being packed with 4-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 2 ft × 2.5 ft × 2.5 ft?',
  options = '["336", "340", "288", "294"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 24×30×30. Cubes per dimension: 24/4=6, 30/4=7, 30/4=7. Total = 6×7×7 = 294. ✓'
where id = 129;

update public.questions set
  question = 'After basketball practice, Aisha feels warm and achy. Amy mentions a news report that 18% of the neighborhood recently caught a stomach bug. Aisha asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "You definitely have the flu", "Maybe Aisha. But, perhaps not", "You have a 18% chance of having it"]'::jsonb,
  answer_index = 2,
  explanation = 'The symptoms described could have many causes besides a stomach bug. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 130;

update public.questions set
  question = 'After basketball practice, Priya feels warm and achy. Ivy mentions a news report that 18% of the neighborhood recently caught a stomach bug. Priya asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You have a 18% chance of having it", "Maybe Priya. But, perhaps not", "You definitely have the flu", "Let''s hope you do not have it"]'::jsonb,
  answer_index = 1,
  explanation = 'The symptoms described could have many causes besides a stomach bug. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 131;

update public.questions set
  question = 'Liam drove to a county fair at 60 mph and returned along the same highway at 35 mph. What was the average speed for the round trip?',
  options = '["44.2 mph", "47.5 mph", "60 mph", "35 mph"]'::jsonb,
  answer_index = 0,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(60)(35)/(60+35) = 44.2 mph. ✓'
where id = 132;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 35% of the votes. What is the angle of that club''s sector?',
  options = '["126°", "136°", "118°", "105°"]'::jsonb,
  answer_index = 0,
  explanation = 'Sector angle = percentage × 360° = 35% × 360° = 126°. ✓'
where id = 133;

update public.questions set
  question = 'Amy feels a bit lightheaded after climbing several flights of stairs. Nina mentions that 9% of the office has been diagnosed with low iron levels. Amy asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You definitely have a blood pressure issue", "Let''s hope you do not have it", "Maybe Amy. But, perhaps not", "You have a 9% chance of having it"]'::jsonb,
  answer_index = 2,
  explanation = 'The symptoms described could have many causes besides low iron levels. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 134;

update public.questions set
  question = 'Aisha is nervous about qualifying for the championship. Ben reassures Aisha: "You''re clearly one of the most skilled people at playing the violin I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Ben''s claim about Aisha''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be true", "Cannot be false", "Probably false, but may be true", "Probably true, but may be false"]'::jsonb,
  answer_index = 1,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Aisha is skilled, then logically Aisha must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 135;

update public.questions set
  question = 'On a regional map, the distance from Elmsworth to Northgate is 6 cm, representing an actual distance of 250 miles. Using the same scale, what map distance is closest to the actual distance of 700 miles between Elmsworth and Silverlake?',
  options = '["16 cm", "17 cm", "18 cm", "19 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 6 cm / 250 mi. Map distance = 6 × (700/250) ≈ 16.8 cm, closest to 17 cm. ✓'
where id = 136;

update public.questions set
  question = 'The deer population at the Timber Ridge Wildlife Sanctuary increases 12% every 5 years. What is the approximate net percentage change in the deer population after 10 years?',
  options = '["25%", "20%", "24%", "29%"]'::jsonb,
  answer_index = 0,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.12^2 ≈ 1.254, a 25% increase. ✓'
where id = 137;

update public.questions set
  question = 'On a regional map, the distance from Kingswell to Oakridge is 6 cm, representing an actual distance of 400 miles. Using the same scale, what map distance is closest to the actual distance of 1100 miles between Kingswell and Pinehurst?',
  options = '["15 cm", "16 cm", "17 cm", "18 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 6 cm / 400 mi. Map distance = 6 × (1100/400) ≈ 16.5 cm, closest to 16 cm. ✓'
where id = 138;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C→D; Gear A turns counter-clockwise. Which direction does Gear D turn?',
  options = '["counter-clockwise", "Cannot be determined", "clockwise", "In either direction"]'::jsonb,
  answer_index = 2,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear D is 3 steps from Gear A, so it ends up rotating clockwise. ✓'
where id = 139;

update public.questions set
  question = 'A large cube built from 512 unit cubes (8×8×8) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["8", "64", "49", "72"]'::jsonb,
  answer_index = 1,
  explanation = 'For an n×n×n cube (n=8), a 45° diagonal plane cut starting along one edge slices through n² = 64 unit cubes. ✓'
where id = 140;

update public.questions set
  question = 'Vera is nervous about qualifying for the championship. Derek reassures Vera: "You''re clearly one of the most skilled people at gymnastics I know, and everyone that good always qualifies, so you''re basically guaranteed a spot." Assuming Derek''s claim about Vera''s ability is accurate, must the conclusion be true?',
  options = '["Probably false, but may be true", "Probably true, but may be false", "Cannot be false", "Cannot be true"]'::jsonb,
  answer_index = 2,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Vera is skilled, then logically Vera must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 141;

update public.questions set
  question = 'Storage crates are being packed with 2-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 2.5 ft × 2.5 ft × 3 ft?',
  options = '["4053", "4275", "4050", "4035"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 30×30×36. Cubes per dimension: 30/2=15, 30/2=15, 36/2=18. Total = 15×15×18 = 4050. ✓'
where id = 142;

update public.questions set
  question = 'Priya drove to a county fair at 40 mph and returned along the same highway at 35 mph. What was the average speed for the round trip?',
  options = '["35 mph", "37.5 mph", "40 mph", "37.3 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(40)(35)/(40+35) = 37.3 mph. ✓'
where id = 143;

update public.questions set
  question = 'Carla drove to a county fair at 70 mph and returned along the same highway at 30 mph. What was the average speed for the round trip?',
  options = '["70 mph", "50 mph", "30 mph", "42 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(70)(30)/(70+30) = 42 mph. ✓'
where id = 144;

update public.questions set
  question = 'A city park''s monthly visitor count grew 50% in the first month of a new season, then shrank 30% in the second month. What is the net percentage change over the two months?',
  options = '["80% decrease", "5.0% increase", "20% decrease", "20% increase"]'::jsonb,
  answer_index = 1,
  explanation = 'Net factor = 1.5 × 0.7 = 1.05, a 5.0% increase. ✓'
where id = 145;

update public.questions set
  question = 'For how many real values of x is x^7 = x^1 true?',
  options = '["one", "none", "three", "four"]'::jsonb,
  answer_index = 2,
  explanation = 'x^7 − x^1 = 0 → x^1(x^6−1) = 0 → x=0 or x^6=1. Since 6 is even, x^6=1 has 2 real solution(s). Total: 3. ✓'
where id = 146;

update public.questions set
  question = 'A city park''s monthly visitor count shrank 40% in the first month of a new season, then grew 25% in the second month. What is the net percentage change over the two months?',
  options = '["65% increase", "15% decrease", "15% increase", "25% decrease"]'::jsonb,
  answer_index = 3,
  explanation = 'Net factor = 0.6 × 1.25 = 0.75, a 25% decrease. ✓'
where id = 147;

update public.questions set
  question = 'A regular pentagon is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["1 lines of reflective symmetry and no center of rotational symmetry", "5 lines of reflective symmetry and one center of rotational symmetry", "2 lines of reflective symmetry and no center of rotational symmetry", "0 lines of reflective symmetry and one center of rotational symmetry"]'::jsonb,
  answer_index = 1,
  explanation = 'A regular pentagon has 5 line(s) of mirror symmetry, and does map onto itself under a partial rotation, giving one center of rotational symmetry. ✓'
where id = 148;

update public.questions set
  question = 'Milo drove to a county fair at 50 mph and returned along the same highway at 40 mph. What was the average speed for the round trip?',
  options = '["40 mph", "50 mph", "45 mph", "44.4 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(40)/(50+40) = 44.4 mph. ✓'
where id = 149;

update public.questions set
  question = 'The Music Club''s savings account holds $5,000.00 and earns 3% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$5,304.50", "$5,150.00", "$4,704.50", "$5,300.00"]'::jsonb,
  answer_index = 0,
  explanation = 'Compound growth: balance = $5,000.00 × 1.03^2 = $5,304.50. ✓'
where id = 150;

update public.questions set
  question = 'An orange is sliced 4 times, with every cut passing through the same central axis and the cuts evenly spaced apart. What is the greatest number of pieces this can produce?',
  options = '["8", "7", "4", "10"]'::jsonb,
  answer_index = 0,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=4: 2×4 = 8 pieces. ✓'
where id = 151;

update public.questions set
  question = 'Storage crates are being packed with 3-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 1.5 ft × 2 ft × 2.5 ft?',
  options = '["528", "474", "483", "480"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 18×24×30. Cubes per dimension: 18/3=6, 24/3=8, 30/3=10. Total = 6×8×10 = 480. ✓'
where id = 152;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 8% of the votes. What is the angle of that club''s sector?',
  options = '["38.8°", "20.8°", "28.8°", "24°"]'::jsonb,
  answer_index = 2,
  explanation = 'Sector angle = percentage × 360° = 8% × 360° = 28.8°. ✓'
where id = 153;

update public.questions set
  question = 'A wooden cube with all outer faces painted red is cut into 9×9×9 unit cubes. How many of these unit cubes have no more than one red face?',
  options = '["294", "637", "343", "84"]'::jsonb,
  answer_index = 1,
  explanation = 'Cubes with 1 painted face: 6(n−2)² = 6(49) = 294. Cubes with 0 painted faces: (n−2)³ = 343. Total with ≤1 face painted: 294 + 343 = 637. ✓'
where id = 154;

update public.questions set
  question = 'Derek notices a slight headache during a long study session. Zoe mentions that 25% of the dorm has been dealing with allergies this week. Derek asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You have a 25% chance of having it", "Maybe Derek. But, perhaps not", "Let''s hope you do not have it", "You definitely have a cold going around school"]'::jsonb,
  answer_index = 1,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 155;

update public.questions set
  question = 'A city park''s monthly visitor count grew 30% in the first month of a new season, then shrank 40% in the second month. What is the net percentage change over the two months?',
  options = '["70% increase", "22.0% decrease", "10% increase", "10% decrease"]'::jsonb,
  answer_index = 1,
  explanation = 'Net factor = 1.3 × 0.6 = 0.78, a 22.0% decrease. ✓'
where id = 156;

update public.questions set
  question = 'The deer population at the Elk Hollow Wildlife Sanctuary increases 15% every 5 years. What is the approximate net percentage change in the deer population after 15 years?',
  options = '["47%", "45%", "52%", "56%"]'::jsonb,
  answer_index = 2,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.15^3 ≈ 1.521, a 52% increase. ✓'
where id = 157;

update public.questions set
  question = 'Storage crates are being packed with 3-inch wooden cube blocks. What is the maximum number of these cubes that fit inside a crate measuring 1 ft × 3 ft × 3 ft?',
  options = '["624", "572", "579", "576"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 12×36×36. Cubes per dimension: 12/3=4, 36/3=12, 36/3=12. Total = 4×12×12 = 576. ✓'
where id = 158;

update public.questions set
  question = 'On a regional map, the distance from Thornbury to Westfield is 8 cm, representing an actual distance of 500 miles. Using the same scale, what map distance is closest to the actual distance of 1000 miles between Thornbury and Glenmoor?',
  options = '["15 cm", "16 cm", "17 cm", "18 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 8 cm / 500 mi. Map distance = 8 × (1000/500) ≈ 16.0 cm, closest to 16 cm. ✓'
where id = 159;

update public.questions set
  question = 'Yusuf drove to a county fair at 50 mph and returned along the same highway at 30 mph. What was the average speed for the round trip?',
  options = '["50 mph", "37.5 mph", "30 mph", "40 mph"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(30)/(50+30) = 37.5 mph. ✓'
where id = 160;

update public.questions set
  question = 'A large cube built from 343 unit cubes (7×7×7) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["56", "36", "7", "49"]'::jsonb,
  answer_index = 3,
  explanation = 'For an n×n×n cube (n=7), a 45° diagonal plane cut starting along one edge slices through n² = 49 unit cubes. ✓'
where id = 161;

update public.questions set
  question = 'For how many real values of a is a^8 = a^3 true?',
  options = '["three", "none", "two", "one"]'::jsonb,
  answer_index = 2,
  explanation = 'a^8 − a^3 = 0 → a^3(a^5−1) = 0 → a=0 or a^5=1. Since 5 is odd, a^5=1 has 1 real solution(s). Total: 2. ✓'
where id = 162;

update public.questions set
  question = 'For how many real values of w is w^7 = w^1 true?',
  options = '["one", "four", "none", "three"]'::jsonb,
  answer_index = 3,
  explanation = 'w^7 − w^1 = 0 → w^1(w^6−1) = 0 → w=0 or w^6=1. Since 6 is even, w^6=1 has 2 real solution(s). Total: 3. ✓'
where id = 163;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 18% of the votes. What is the angle of that club''s sector?',
  options = '["56.8°", "74.8°", "64.8°", "54°"]'::jsonb,
  answer_index = 2,
  explanation = 'Sector angle = percentage × 360° = 18% × 360° = 64.8°. ✓'
where id = 164;

update public.questions set
  question = 'The Coding Club''s savings account holds $8,000.00 and earns 2% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$8,659.46", "$8,489.66", "$7,378.95", "$8,640.00"]'::jsonb,
  answer_index = 0,
  explanation = 'Compound growth: balance = $8,000.00 × 1.02^4 = $8,659.46. ✓'
where id = 165;

update public.questions set
  question = 'In a circuit, resistors R1 and R2 (each 3 Ohms) are connected in parallel between points a and b. Point b connects to point c, where two more 3-Ohm resistors, R3 and R4, are connected in series, ending at point d. What is the total resistance measured between points a and d?',
  options = '["4.5 Ohms", "12 Ohms", "9 Ohms", "7.5 Ohms"]'::jsonb,
  answer_index = 3,
  explanation = 'R1∥R2 = 3/2 = 1.5 Ohms. R3+R4 in series = 6 Ohms. Since b and c are joined, total = 1.5 Ohms + 6 Ohms = 7.5 Ohms. ✓'
where id = 166;

update public.questions set
  question = 'Carla drove to a county fair at 50 mph and returned along the same highway at 40 mph. What was the average speed for the round trip?',
  options = '["40 mph", "44.4 mph", "45 mph", "50 mph"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(40)/(50+40) = 44.4 mph. ✓'
where id = 167;

update public.questions set
  question = 'On a regional map, the distance from Ravenswood to Cedarville is 3 cm, representing an actual distance of 150 miles. Using the same scale, what map distance is closest to the actual distance of 800 miles between Ravenswood and Brookhaven?',
  options = '["15 cm", "16 cm", "17 cm", "18 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 3 cm / 150 mi. Map distance = 3 × (800/150) ≈ 16.0 cm, closest to 16 cm. ✓'
where id = 168;

update public.questions set
  question = 'Theo drove to a county fair at 60 mph and returned along the same highway at 55 mph. What was the average speed for the round trip?',
  options = '["57.4 mph", "60 mph", "55 mph", "57.5 mph"]'::jsonb,
  answer_index = 0,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(60)(55)/(60+55) = 57.4 mph. ✓'
where id = 169;

update public.questions set
  question = 'A streaming service is offering 10% off annual plans. Priya signed up and was charged $36.00 after the discount. Let p represent the regular price. What was the regular price?',
  options = '["$39.60", "$32.40", "$32.73", "$40.00"]'::jsonb,
  answer_index = 3,
  explanation = '90% of the regular price p equals the discounted price: 0.90p = $36.00, so p = $36.00 / 0.90 = $40.00. ✓'
where id = 170;

update public.questions set
  question = 'An aquarium holds 480 gallons and starts empty. A pump fills it at 30 gallons/minute. After 2 minutes, a drain valve also opens and removes 10 gallons/minute while the pump stays on. How many minutes after filling starts does the aquarium become full?',
  options = '["22 minutes", "25 minutes", "16 minutes", "23 minutes"]'::jsonb,
  answer_index = 3,
  explanation = 'In the first 2 min, 60 gallons fill up, leaving 420 gallons. Once the drain valve opens, net rate = 30−10 = 20 gal/min, so the remaining 420 gallons take 21 more minutes. Total = 2 + 21 = 23 minutes. ✓'
where id = 171;

update public.questions set
  question = 'For how many real values of b is b^7 = b^1 true?',
  options = '["none", "two", "three", "four"]'::jsonb,
  answer_index = 2,
  explanation = 'b^7 − b^1 = 0 → b^1(b^6−1) = 0 → b=0 or b^6=1. Since 6 is even, b^6=1 has 2 real solution(s). Total: 3. ✓'
where id = 172;

update public.questions set
  question = 'For how many real values of y is y^5 = y^2 true?',
  options = '["one", "none", "two", "four"]'::jsonb,
  answer_index = 2,
  explanation = 'y^5 − y^2 = 0 → y^2(y^3−1) = 0 → y=0 or y^3=1. Since 3 is odd, y^3=1 has 1 real solution(s). Total: 2. ✓'
where id = 173;

update public.questions set
  question = 'On a regional map, the distance from Hollowmere to Sunnyvale is 8 cm, representing an actual distance of 150 miles. Using the same scale, what map distance is closest to the actual distance of 1100 miles between Hollowmere and Greenfield?',
  options = '["58 cm", "59 cm", "60 cm", "61 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 8 cm / 150 mi. Map distance = 8 × (1100/150) ≈ 58.7 cm, closest to 59 cm. ✓'
where id = 174;

update public.questions set
  question = 'In a circuit, resistors R1 and R2 (each 5 Ohms) are connected in parallel between points a and b. Point b connects to point c, where two more 5-Ohm resistors, R3 and R4, are connected in series, ending at point d. What is the total resistance measured between points a and d?',
  options = '["15 Ohms", "7.5 Ohms", "12.5 Ohms", "20 Ohms"]'::jsonb,
  answer_index = 2,
  explanation = 'R1∥R2 = 5/2 = 2.5 Ohms. R3+R4 in series = 10 Ohms. Since b and c are joined, total = 2.5 Ohms + 10 Ohms = 12.5 Ohms. ✓'
where id = 175;

update public.questions set
  question = 'Ben drove to a county fair at 50 mph and returned along the same highway at 35 mph. What was the average speed for the round trip?',
  options = '["41.2 mph", "50 mph", "35 mph", "42.5 mph"]'::jsonb,
  answer_index = 0,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(35)/(50+35) = 41.2 mph. ✓'
where id = 176;

update public.questions set
  question = 'The deer population at the Bear Creek Wildlife Sanctuary increases 8% every 5 years. What is the approximate net percentage change in the deer population after 10 years?',
  options = '["12%", "17%", "16%", "21%"]'::jsonb,
  answer_index = 1,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.08^2 ≈ 1.166, a 17% increase. ✓'
where id = 177;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 32% of the votes. What is the angle of that club''s sector?',
  options = '["107.2°", "125.2°", "115.2°", "96°"]'::jsonb,
  answer_index = 2,
  explanation = 'Sector angle = percentage × 360° = 32% × 360° = 115.2°. ✓'
where id = 178;

update public.questions set
  question = 'For how many real values of z is z^3 = z^1 true?',
  options = '["two", "one", "three", "four"]'::jsonb,
  answer_index = 2,
  explanation = 'z^3 − z^1 = 0 → z^1(z^2−1) = 0 → z=0 or z^2=1. Since 2 is even, z^2=1 has 2 real solution(s). Total: 3. ✓'
where id = 179;

update public.questions set
  question = 'Priya drove to a county fair at 60 mph and returned along the same highway at 20 mph. What was the average speed for the round trip?',
  options = '["60 mph", "40 mph", "20 mph", "30 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(60)(20)/(60+20) = 30 mph. ✓'
where id = 180;

update public.questions set
  question = 'A city park''s monthly visitor count shrank 30% in the first month of a new season, then grew 40% in the second month. What is the net percentage change over the two months?',
  options = '["10% increase", "10% decrease", "2.0% decrease", "70% increase"]'::jsonb,
  answer_index = 2,
  explanation = 'Net factor = 0.7 × 1.4 = 0.98, a 2.0% decrease. ✓'
where id = 181;

update public.questions set
  question = 'On a regional map, the distance from Ashford to Maplewood is 4 cm, representing an actual distance of 450 miles. Using the same scale, what map distance is closest to the actual distance of 1100 miles between Ashford and Windermere?',
  options = '["9 cm", "10 cm", "11 cm", "12 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 4 cm / 450 mi. Map distance = 4 × (1100/450) ≈ 9.8 cm, closest to 10 cm. ✓'
where id = 182;

update public.questions set
  question = 'The Garden Club''s savings account holds $4,000.00 and earns 6% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$4,960.00", "$3,123.00", "$4,764.06", "$5,049.91"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $4,000.00 × 1.06^4 = $5,049.91. ✓'
where id = 183;

update public.questions set
  question = 'On a regional map, the distance from Fallowfield to Eastport is 8 cm, representing an actual distance of 400 miles. Using the same scale, what map distance is closest to the actual distance of 700 miles between Fallowfield and Stonebridge?',
  options = '["13 cm", "14 cm", "15 cm", "16 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 8 cm / 400 mi. Map distance = 8 × (700/400) ≈ 14.0 cm, closest to 14 cm. ✓'
where id = 184;

update public.questions set
  question = 'In a pie chart showing how a class voted for their favorite school club, one club received 28% of the votes. What is the angle of that club''s sector?',
  options = '["92.8°", "110.8°", "84°", "100.8°"]'::jsonb,
  answer_index = 3,
  explanation = 'Sector angle = percentage × 360° = 28% × 360° = 100.8°. ✓'
where id = 185;

update public.questions set
  question = 'For how many real values of y is y^5 = y^1 true?',
  options = '["one", "two", "three", "four"]'::jsonb,
  answer_index = 2,
  explanation = 'y^5 − y^1 = 0 → y^1(y^4−1) = 0 → y=0 or y^4=1. Since 4 is even, y^4=1 has 2 real solution(s). Total: 3. ✓'
where id = 186;

update public.questions set
  question = 'An aquarium holds 360 gallons and starts empty. A pump fills it at 36 gallons/minute. After 3 minutes, a drain valve also opens and removes 8 gallons/minute while the pump stays on. How many minutes after filling starts does the aquarium become full?',
  options = '["11 minutes", "14 minutes", "10 minutes", "12 minutes"]'::jsonb,
  answer_index = 3,
  explanation = 'In the first 3 min, 108 gallons fill up, leaving 252 gallons. Once the drain valve opens, net rate = 36−8 = 28 gal/min, so the remaining 252 gallons take 9 more minutes. Total = 3 + 9 = 12 minutes. ✓'
where id = 187;

update public.questions set
  question = 'On a regional map, the distance from Grayson to Lakecrest is 4 cm, representing an actual distance of 150 miles. Using the same scale, what map distance is closest to the actual distance of 800 miles between Grayson and Amberton?',
  options = '["20 cm", "21 cm", "22 cm", "23 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 4 cm / 150 mi. Map distance = 4 × (800/150) ≈ 21.3 cm, closest to 21 cm. ✓'
where id = 188;

update public.questions set
  question = 'For how many real values of b is b^7 = b^2 true?',
  options = '["two", "three", "one", "none"]'::jsonb,
  answer_index = 0,
  explanation = 'b^7 − b^2 = 0 → b^2(b^5−1) = 0 → b=0 or b^5=1. Since 5 is odd, b^5=1 has 1 real solution(s). Total: 2. ✓'
where id = 189;

update public.questions set
  question = 'The Photography Club''s savings account holds $8,000.00 and earns 4% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$8,998.91", "$8,960.00", "$8,652.80", "$7,077.89"]'::jsonb,
  answer_index = 0,
  explanation = 'Compound growth: balance = $8,000.00 × 1.04^3 = $8,998.91. ✓'
where id = 190;

update public.questions set
  question = 'Liam drove to a county fair at 50 mph and returned along the same highway at 20 mph. What was the average speed for the round trip?',
  options = '["28.6 mph", "35 mph", "20 mph", "50 mph"]'::jsonb,
  answer_index = 0,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(20)/(50+20) = 28.6 mph. ✓'
where id = 191;

update public.questions set
  question = 'The Film Club''s savings account holds $8,000.00 and earns 5% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$6,859.00", "$8,820.00", "$9,261.00", "$9,200.00"]'::jsonb,
  answer_index = 2,
  explanation = 'Compound growth: balance = $8,000.00 × 1.05^3 = $9,261.00. ✓'
where id = 192;

update public.questions set
  question = 'A city park''s monthly visitor count shrank 10% in the first month of a new season, then grew 15% in the second month. What is the net percentage change over the two months?',
  options = '["3.5% increase", "25% decrease", "5% decrease", "5% increase"]'::jsonb,
  answer_index = 0,
  explanation = 'Net factor = 0.9 × 1.15 = 1.035, a 3.5% increase. ✓'
where id = 193;

update public.questions set
  question = 'The Chess Club''s savings account holds $8,000.00 and earns 3% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$8,720.00", "$8,741.82", "$8,487.20", "$7,301.38"]'::jsonb,
  answer_index = 1,
  explanation = 'Compound growth: balance = $8,000.00 × 1.03^3 = $8,741.82. ✓'
where id = 194;

update public.questions set
  question = 'The Book Club''s savings account holds $2,000.00 and earns 8% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$1,557.38", "$2,480.00", "$2,332.80", "$2,519.42"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $2,000.00 × 1.08^3 = $2,519.42. ✓'
where id = 195;

update public.questions set
  question = 'The deer population at the Timber Ridge Wildlife Sanctuary increases 12% every 5 years. What is the approximate net percentage change in the deer population after 10 years?',
  options = '["29%", "25%", "20%", "24%"]'::jsonb,
  answer_index = 1,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.12^2 ≈ 1.254, a 25% increase. ✓'
where id = 196;

update public.questions set
  question = 'A city park''s monthly visitor count grew 20% in the first month of a new season, then shrank 40% in the second month. What is the net percentage change over the two months?',
  options = '["28.0% decrease", "20% decrease", "20% increase", "60% increase"]'::jsonb,
  answer_index = 0,
  explanation = 'Net factor = 1.2 × 0.6 = 0.72, a 28.0% decrease. ✓'
where id = 197;

update public.questions set
  question = 'The deer population at the Cedar Point Wildlife Sanctuary increases 10% every 5 years. What is the approximate net percentage change in the deer population after 10 years?',
  options = '["20%", "21%", "25%", "16%"]'::jsonb,
  answer_index = 1,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.10^2 ≈ 1.210, a 21% increase. ✓'
where id = 198;

update public.questions set
  question = 'The deer population at the Elk Hollow Wildlife Sanctuary increases 10% every 5 years. What is the approximate net percentage change in the deer population after 10 years?',
  options = '["20%", "21%", "16%", "25%"]'::jsonb,
  answer_index = 1,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.10^2 ≈ 1.210, a 21% increase. ✓'
where id = 199;

update public.questions set
  question = 'On a regional map, the distance from Ridgemont to Clearwater is 8 cm, representing an actual distance of 350 miles. Using the same scale, what map distance is closest to the actual distance of 700 miles between Ridgemont and Woodhaven?',
  options = '["15 cm", "16 cm", "17 cm", "18 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 8 cm / 350 mi. Map distance = 8 × (700/350) ≈ 16.0 cm, closest to 16 cm. ✓'
where id = 200;
