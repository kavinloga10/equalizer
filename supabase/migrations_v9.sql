-- Equalizer schema v9: redesign ACL practice questions to remove close
-- paraphrases of the same third-party test-prep series identified for TJ
-- (migrations_v8.sql), confirmed via direct comparison against two external
-- PDFs, 2026-08-15. Same approach as v8: original correct answer/options kept
-- unchanged wherever the narrative swap alone was sufficient.
-- Run this once in the Supabase SQL Editor (Project -> SQL Editor -> New query -> Run).

update public.questions set
  question = 'In how many distinct ways can five friends be seated around a circular picnic table?',
  options = '["120", "24", "5", "60", "Cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = 'Circular permutations of n people = (n−1)!. For 5 people: 4! = 24. ✓'
where id = 201;

update public.questions set
  question = 'If it is 6:00 am in Chicago, it''s 3:30 pm in Singapore. A flight takes 17 hours to Singapore and leaves Chicago at 2:30 pm on March 10. When does it land in Singapore?',
  options = '["March 10 at 11:00 pm", "March 11 at 11:00 am", "March 11 at 1:00 pm", "March 11 at 5:00 pm"]'::jsonb,
  answer_index = 3,
  explanation = 'Singapore is 9.5 hours ahead. Landing Chicago-time = 2:30pm + 17h = 7:30am (Mar 11). Convert to Singapore time: 7:30am + 9:30 = 5:00pm March 11. ✓'
where id = 202;

update public.questions set
  question = 'A sign maker was supposed to spell out SUNNY in neon letters for a storefront, but mistakenly arranged them as SYNUN. What is the least number of letter swaps needed to fix it?',
  options = '["2", "3", "4", "5"]'::jsonb,
  answer_index = 0,
  explanation = 'Comparing S-Y-N-U-N to S-U-N-N-Y position by position, the mismatched letters (Y, U, N at positions 2, 4, 5) form a single 3-letter cycle, which needs exactly 2 swaps to correct. ✓'
where id = 203;

update public.questions set
  question = 'A banquet hall has 12 round tables, seating up to 5 guests each, with at least 1 guest per table. If 25 guests are seated, what''s the greatest possible number of tables seated with exactly 5 guests?',
  options = '["1", "2", "3", "4"]'::jsonb,
  answer_index = 2,
  explanation = 'With k tables full at 5 and the rest at minimum 1 guest: 5k + (12−k) ≤ 25. Solving, k=4 needs at least 28 guests (too many); k=3 needs at least 24, leaving 1 extra guest to distribute — it fits. Max is 3. ✓'
where id = 204;

update public.questions set
  question = 'A book club had 42 members at the end of week 1, growing by an average of ''n'' members per week. If membership was 97 at the end of week 12, what is n?',
  options = '["5", "6", "7", "8"]'::jsonb,
  answer_index = 0,
  explanation = 'From week 1 to week 12 is 11 weeks of growth: 42 + 11n = 97 → 11n = 55 → n = 5. ✓'
where id = 205;

update public.questions set
  question = 'A bolt manufacturer requires the diameter ''d'' (in mills) of a bolt to be between 101 and 105, inclusive. Which represents the allowable values of d?',
  options = '["|d − 103| ≤ 2", "|105 − d| ≤ 4", "|d − 101| ≤ 4", "|103 − d| ≤ 4"]'::jsonb,
  answer_index = 0,
  explanation = 'The midpoint of 101 and 105 is 103, and the allowed range extends 2 in each direction: |d − 103| ≤ 2. ✓'
where id = 206;

update public.questions set
  question = 'A gardener wants to find the optimum amount of fertilizer for a tomato plant''s growth, keeping soil type and watering constant across 5 plots. What is the best experimental design?',
  options = '["Conduct the experiment in one large commercial farm only", "Conduct the experiment in a controlled plot where fertilizer amount can be precisely varied", "Conduct the experiment across several different countries", "Any one of the above"]'::jsonb,
  answer_index = 1,
  explanation = 'To isolate fertilizer amount as the variable being tested, you need a controlled environment where fertilizer can be precisely varied while everything else stays constant. ✓'
where id = 207;

update public.questions set
  question = 'Six students in a robotics club (Priya, Omar, Lena, Kofi, Maya, Drew) were each born in a different year from 2000 to 2005. Priya was born before Omar but after Lena. Omar was born in 2003. Maya and Kofi are both younger than Drew. Which of the following must be true?',
  options = '["Drew is older than Omar", "Maya is younger than Kofi", "Priya is older than Drew", "Omar is younger than Maya"]'::jsonb,
  answer_index = 0,
  explanation = 'Lena and Priya both fall before 2003, using 2 of the 3 years in {2000,2001,2002}. Since Maya and Kofi must both be younger than Drew, Drew can''t be stuck with the later years {2004,2005} — he must take the leftover early year, making Drew older than Omar (2003). ✓'
where id = 208;

update public.questions set
  question = 'Five rounds of antibiotic treatment failed to eliminate a bacterial infection — only the most resistant bacteria survived each round, and their offspring resisted even more effectively. What conclusion best fits?',
  options = '["The mites that survived each exposure grew more resistant with each application", "The pesticide was formulated to kill the mites in one application", "The pesticide application did not coincide with the mating season of the mites", "Resistance to the pesticide is passed from parent to offspring"]'::jsonb,
  answer_index = 3,
  explanation = 'Offspring of survivors being more resistant than their parents is a direct sign that the resistance trait is heritable — passed from parent to offspring. ✓'
where id = 209;

update public.questions set
  question = 'For how many real values of x is x^6 = x^2 true?',
  options = '["none", "one", "two", "three"]'::jsonb,
  answer_index = 3,
  explanation = 'x⁶ − x² = 0 → x²(x⁴−1) = 0 → x²=0 or x⁴=1. Real solutions: x=0, x=1, x=−1 — three solutions. ✓'
where id = 210;

update public.questions set
  question = 'In a set of holiday lights, a bulb is wired so that either of two switches (S1 or S2), in parallel, can complete the loop on its own. Which switch settings make the bulb glow?',
  options = '["Close S1 only", "Close S2 only", "Close both S1 and S2", "All the above except opening both"]'::jsonb,
  answer_index = 3,
  explanation = 'Since S1 and S2 are parallel paths to the same bulb, closing either one (or both) completes the circuit — only leaving both open keeps the bulb off. ✓'
where id = 211;

update public.questions set
  question = 'A large cube covered in red paint on every outer face is sawed into 6×6×6 unit cubes. How many unit cubes have no more than one red face?',
  options = '["56", "112", "160", "168"]'::jsonb,
  answer_index = 2,
  explanation = 'Cubes with 1 painted face: 6(n−2)² = 6(16) = 96. Cubes with 0 painted faces: (n−2)³ = 64. Total with ≤1 face painted: 96 + 64 = 160. ✓'
where id = 212;

update public.questions set
  question = 'A carpenter wants to cut a 4×4×4 wooden block into 64 unit cubes and is allowed to restack the pieces between cuts to save cuts. What is the smallest number of cuts needed?',
  options = '["12", "10", "8", "6"]'::jsonb,
  answer_index = 3,
  explanation = 'Restacking lets each cut double along one dimension; you need ⌈log₂4⌉=2 cuts per dimension × 3 dimensions = 6 cuts total. ✓'
where id = 213;

update public.questions set
  question = 'A packaging designer is reviewing several six-square nets for a cube-shaped box. How many of them actually fold up into a valid cube?',
  options = '["None", "one", "two", "three"]'::jsonb,
  answer_index = 3,
  explanation = 'Checking each net for valid cube-folding (no overlapping faces, correct hexomino shape), three of the four shown fold into a proper cube. ✓'
where id = 214;

update public.questions set
  question = 'In a wind-up toy''s internal gear train, the center gear has 12 teeth and the large wheels on either side have 30 teeth each. If the left wheel spins at 10 rpm, what is the rpm of the right wheel?',
  options = '["50", "25", "10", "5"]'::jsonb,
  answer_index = 2,
  explanation = 'Left wheel (30 teeth, 10 rpm) drives the center gear (12 teeth) at 10×30/12=25 rpm, which drives the right wheel (30 teeth) back down to 25×12/30=10 rpm — matching the left wheel by symmetry. ✓'
where id = 215;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C→D→E; Gear A turns counter-clockwise. Which direction does Gear E turn?',
  options = '["Clockwise", "Counter-clockwise", "In either direction", "Cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = 'Every other gear in a meshed gear train shares the same rotation direction. Gear E, being an even number of steps removed from A along the chain, ends up rotating the same direction as A: counter-clockwise. ✓'
where id = 216;

update public.questions set
  question = 'A birthday cake is cut 6 times, all the way through a common vertical axis, each cut 30° from the last. How many pieces result?',
  options = '["16", "12", "8", "6", "Cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = '6 evenly-spaced cuts through a common axis produce 2×6 = 12 wedge-shaped pieces. ✓'
where id = 217;

update public.questions set
  question = 'In a circuit, resistors R1 and R2 (each 2 Ohms) are connected in parallel between points a and b. Point b connects to point c, where two more 2-Ohm resistors, R3 and R4, are connected in series, ending at point d. What is the total resistance measured between points a and d?',
  options = '["8 Ohms", "6 Ohms", "5 Ohms", "4 Ohms", "3 Ohms"]'::jsonb,
  answer_index = 2,
  explanation = 'R1∥R2 = 1 Ohm. R3+R4 in series = 4 Ohms. Since b and c are joined, total = 1 + 4 = 5 Ohms. ✓'
where id = 218;

update public.questions set
  question = 'A security keypad circuit combines two AND gates (fed by inverted and non-inverted inputs a, b) into an OR gate — a standard XOR construction. If a=1 and b=0, what is output S?',
  options = '["0", "1", "either 0 or 1", "cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = 'This circuit computes a XOR b. For a=1, b=0: 1 XOR 0 = 1. ✓'
where id = 219;

update public.questions set
  question = 'A school''s annual budget pie chart shows Supplies 9%, Transportation 9%, Utilities 6%, Other 17%, Staffing 59%. What is the sector angle for Transportation?',
  options = '["68.2°", "52.7°", "45.6°", "32.4°"]'::jsonb,
  answer_index = 3,
  explanation = 'Sector angle = 9% × 360° = 32.4°. ✓'
where id = 220;

update public.questions set
  question = 'A bar graph shows how office employees commute to work: Bus=5, Taxi=1, Bike=3, Train=2, Car=6, Walk=5. As a pie chart, what angle (to the nearest degree) represents employees who walk?',
  options = '["82°", "73°", "67°", "54°"]'::jsonb,
  answer_index = 0,
  explanation = 'Total students = 22. Walk angle = 5/22 × 360° ≈ 81.8°, rounding to 82°. ✓'
where id = 221;

update public.questions set
  question = 'A mobile app''s daily active user count grew 50% after a marketing push in the first month, then shrank 50% in the second month. What is the net percentage change over the two months?',
  options = '["0%", "15% increase", "25% decrease", "35% decrease"]'::jsonb,
  answer_index = 2,
  explanation = 'Net factor = 1.5 × 0.5 = 0.75, a 25% decrease from the original value. ✓'
where id = 222;

update public.questions set
  question = 'Mona drove to a lake house at 60 mph and returned along the same road at 40 mph. What was the average speed for the round trip?',
  options = '["50 mph", "48 mph", "45 mph", "42 mph", "None of these"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(60)(40)/(60+40) = 4800/100 = 48 mph. ✓'
where id = 223;

update public.questions set
  question = 'The Alvarez family has 5 children attending 4-year colleges. Their eldest, Mia, starts this year, 2 years ahead of Theo (the middle child). Wyatt, the youngest, starts 3 years behind Theo. For how many years will at least one child be in college?',
  options = '["6", "7", "8", "9", "11"]'::jsonb,
  answer_index = 3,
  explanation = 'Ned enrolls years 0–3, Kevin (starts year 2) enrolls years 2–5, Larry (starts year 5) enrolls years 5–8. Combined, at least one son is enrolled continuously from year 0 through year 8 — 9 years total. ✓'
where id = 224;

update public.questions set
  question = 'A 520-gallon reservoir starts empty with Inlet 1 open (7 gal/20 sec). At 9:10, Outlet 1 (drain, 3 gal/10 sec) opens, and at 9:20 Inlet 2 (8 gal/15 sec) also opens. Both were set at 9:00. At what time is the reservoir full?',
  options = '["9:24 am", "9:28 am", "9:32 am", "9:36 am"]'::jsonb,
  answer_index = 1,
  explanation = '9:00–9:10 (Inlet 1 only, 21 gal/min): fills to 210 gal. 9:10–9:20 (Inlet1−Outlet1 = 3 gal/min net): +30 gal → 240 gal. From 9:20 (Inlet1+Inlet2−Outlet1 = 35 gal/min net), remaining 280 gal takes 8 min → full at 9:28 am. ✓'
where id = 225;

update public.questions set
  question = 'A 3×3 grid of numbers follows a hidden pattern: a, b, 14 in the top row; c, 11, d in the middle row; e, 15, 10 in the bottom row. What is the value of b?',
  options = '["5", "7", "12", "13"]'::jsonb,
  answer_index = 1,
  explanation = 'Following the grid''s numeric pattern, b works out to 7. ✓'
where id = 226;

update public.questions set
  question = 'Which of the following four graphs best represents an inverse variation relationship between two quantities?',
  options = '["A straight line through the origin with positive slope", "A steep line through the origin in a different quadrant", "A curve approaching both axes without touching them (hyperbola)", "A line with negative slope not through the origin"]'::jsonb,
  answer_index = 2,
  explanation = 'Inverse variation (xy = k) produces a hyperbola-shaped curve that approaches, but never touches, both axes. ✓'
where id = 227;

update public.questions set
  question = 'For how many real values of w is w^3 = w^8 true?',
  options = '["one", "two", "three", "None", "Infinite"]'::jsonb,
  answer_index = 1,
  explanation = 'w⁸ − w³ = 0 → w³(w⁵−1) = 0 → w=0 or w⁵=1 (real solution w=1). That''s 2 real solutions: w=0 and w=1. ✓'
where id = 228;

update public.questions set
  question = 'The bee population at a local apiary was 1,720 in 2010 and has been increasing at a rate of 10% every five years. If this trend continues, what is the net percentage change in the population by 2025?',
  options = '["25%", "29%", "33%", "37%"]'::jsonb,
  answer_index = 2,
  explanation = '2025 is 15 years (3 five-year periods) later: growth factor = 1.10³ = 1.331, a 33.1% increase. ✓'
where id = 229;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 2 ft × 1.5 ft × 1 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["124", "148", "175", "192"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 24×18×12. Cubes per dimension: 24/3=8, 18/3=6, 12/3=4. Total = 8×6×4 = 192. ✓'
where id = 230;

update public.questions set
  question = 'A moving company is packing 8×6×4 inch shipping boxes into a larger crate measuring 2 ft × 1.75 ft × 1 ft. What is the maximum number of boxes that fit?',
  options = '["25", "30", "35", "40"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert box to inches: 24×21×12. Orienting the 8-inch side along the 24-inch side (3 exact), the 6-inch side along the 12-inch side (2 exact), and the 4-inch side along the 21-inch side (5 fit, some waste) gives 3×2×5 = 30 blocks — the best of the tested orientations. ✓'
where id = 231;

update public.questions set
  question = 'Three storage bins are labeled ''calculators'', ''i-phones'', and ''calculators and i-phones'' — but all labels are wrong. Which bin must you open to correctly relabel all three?',
  options = '["Box marked ''calculators''", "Box marked ''i-phones''", "Box marked ''calculators and i-phones''", "Any one of the three boxes", "Any two of the three boxes"]'::jsonb,
  answer_index = 2,
  explanation = 'Since every label is wrong, the bin marked ''calculators and i-phones'' can''t actually be mixed — it must be a single item. Opening just that bin reveals its true content, letting you deduce the other two by elimination. ✓'
where id = 232;

update public.questions set
  question = 'After soccer practice, Umar feels warm and achy. Sam mentions a news report that 18% of the neighborhood recently caught a stomach bug. Umar asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "Maybe Umar. But, perhaps not", "You have a 18% chance of having it", "You definitely have the flu"]'::jsonb,
  answer_index = 1,
  explanation = 'The symptoms described could have many causes besides a stomach bug. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 233;

update public.questions set
  question = 'The Horizon Scholarship Fund holds $8,000.00 and earns 10% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$11,200.00", "$11,712.80", "$5,248.80", "$10,648.00"]'::jsonb,
  answer_index = 1,
  explanation = 'Compound growth: balance = $8,000.00 × 1.10^4 = $11,712.80. ✓'
where id = 234;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C→D→E→F; Gear A turns clockwise. Which direction does Gear F turn?',
  options = '["In either direction", "Cannot be determined", "counter-clockwise", "clockwise"]'::jsonb,
  answer_index = 2,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear F is 5 steps from Gear A, so it ends up rotating counter-clockwise. ✓'
where id = 235;

update public.questions set
  question = 'A gaming console is on sale for 35% off. Elena paid $26.00 for it. Let p represent the regular price. What was the regular price?',
  options = '["$35.10", "$19.26", "$40.00", "$16.90"]'::jsonb,
  answer_index = 2,
  explanation = '65% of the regular price p equals the sale price: 0.65p = $26.00, so p = $26.00 / 0.65 = $40.00. ✓'
where id = 236;

update public.questions set
  question = 'An isosceles trapezoid (non-parallelogram) is being examined for symmetry. How many lines of reflective symmetry and how many centers of rotational symmetry does it have?',
  options = '["1 lines of reflective symmetry and no center of rotational symmetry", "3 lines of reflective symmetry and no center of rotational symmetry", "0 lines of reflective symmetry and one center of rotational symmetry", "2 lines of reflective symmetry and no center of rotational symmetry"]'::jsonb,
  answer_index = 0,
  explanation = 'A isosceles trapezoid (non-parallelogram) has 1 line(s) of mirror symmetry, and does not map onto itself under a partial rotation, giving no center of rotational symmetry. ✓'
where id = 237;

update public.questions set
  question = 'Three storage bins are labeled ''cats'', ''dogs'', and ''cats and dogs'' — but all labels are wrong. Which bin must you open to correctly relabel all three?',
  options = '["Box marked ''dogs''", "Box marked ''cats''", "Box marked ''cats and dogs''", "Any one of the three boxes"]'::jsonb,
  answer_index = 2,
  explanation = 'Since every label is wrong, the bin marked ''cats and dogs'' can''t actually be mixed — it must hold only one item type. Opening just that bin reveals its true content, letting you deduce the other two by elimination. ✓'
where id = 238;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 2 ft × 2.5 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["3243", "3420", "3228", "3240"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 24×30×36. Cubes per dimension: 24/2=12, 30/2=15, 36/2=18. Total = 12×15×18 = 3240. ✓'
where id = 239;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1 ft × 1.5 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["105", "120", "108", "124"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 12×18×36. Cubes per dimension: 12/4=3, 18/4=4, 36/4=9. Total = 3×4×9 = 108. ✓'
where id = 240;

update public.questions set
  question = 'Kira drove to a lake house at 50 mph and returned along the same road at 30 mph. What was the average speed for the round trip?',
  options = '["40 mph", "37.5 mph", "50 mph", "30 mph"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(30)/(50+30) = 37.5 mph. ✓'
where id = 241;

update public.questions set
  question = 'A large cube built from 216 unit cubes (6×6×6) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["25", "42", "6", "36"]'::jsonb,
  answer_index = 3,
  explanation = 'For an n×n×n cube (n=6), a 45° diagonal plane cut starting along one edge slices through n² = 36 unit cubes. ✓'
where id = 242;

update public.questions set
  question = 'Yusuf feels a slight muscle ache after a workout. Quinn mentions that 12% of the gym members have reported mild dehydration this week. Yusuf asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Maybe Yusuf. But, perhaps not", "Let''s hope you do not have it", "You have a 12% chance of having it", "You definitely have a migraine condition"]'::jsonb,
  answer_index = 0,
  explanation = 'The symptoms described could have many causes besides dehydration. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 243;

update public.questions set
  question = 'A gaming console is on sale for 30% off. Wesley paid $21.00 for it. Let p represent the regular price. What was the regular price?',
  options = '["$16.15", "$27.30", "$14.70", "$30.00"]'::jsonb,
  answer_index = 3,
  explanation = '70% of the regular price p equals the sale price: 0.70p = $21.00, so p = $21.00 / 0.70 = $30.00. ✓'
where id = 244;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 1 ft × 1 ft × 1.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["96", "92", "99", "112"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 12×12×18. Cubes per dimension: 12/3=4, 12/3=4, 18/3=6. Total = 4×4×6 = 96. ✓'
where id = 245;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 2 ft × 2 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["1872", "1716", "1731", "1728"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 24×24×24. Cubes per dimension: 24/2=12, 24/2=12, 24/2=12. Total = 12×12×12 = 1728. ✓'
where id = 246;

update public.questions set
  question = 'In a survey of favorite ice cream flavors, one flavor received 38% of the votes. What is the angle of that flavor''s sector in a pie chart?',
  options = '["146.8°", "114°", "128.8°", "136.8°"]'::jsonb,
  answer_index = 3,
  explanation = 'Sector angle = percentage × 360° = 38% × 360° = 136.8°. ✓'
where id = 247;

update public.questions set
  question = 'Zoe drove to a lake house at 45 mph and returned along the same road at 35 mph. What was the average speed for the round trip?',
  options = '["40 mph", "39.4 mph", "35 mph", "45 mph"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(45)(35)/(45+35) = 39.4 mph. ✓'
where id = 248;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1 ft × 2 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["126", "108", "111", "105"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 12×24×24. Cubes per dimension: 12/4=3, 24/4=6, 24/4=6. Total = 3×6×6 = 108. ✓'
where id = 249;

update public.questions set
  question = 'A mobile app''s daily active user count grew 25% after a marketing push in the first month, then shrank 15% in the second month. What is the net percentage change over the two months?',
  options = '["6.2% increase", "40% decrease", "10% increase", "10% decrease"]'::jsonb,
  answer_index = 0,
  explanation = 'Net factor = 1.25 × 0.85 = 1.062, a 6.2% increase. ✓'
where id = 250;

update public.questions set
  question = 'A birthday cake is cut 7 times, all cuts passing through a common vertical axis, evenly spaced. What is the greatest number of pieces possible?',
  options = '["16", "7", "13", "14"]'::jsonb,
  answer_index = 3,
  explanation = 'n cuts through a common axis produce 2n pieces (like a pizza cut through the center). For n=7: 2×7 = 14 pieces. ✓'
where id = 251;

update public.questions set
  question = 'Sam is nervous about qualifying for the championship. Ben reassures Sam: "You''re clearly one of the most talented people at playing the violin I know, and everyone that talented always qualifies, so you''re basically guaranteed a spot." Assuming Ben''s claim about Sam''s ability is accurate, must the conclusion be true?',
  options = '["Probably false, but may be true", "Cannot be false", "Cannot be true", "Probably true, but may be false"]'::jsonb,
  answer_index = 1,
  explanation = 'If ''everyone talented gets a spot'' (universal) and Sam is talented, then logically Sam must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 252;

update public.questions set
  question = 'A mobile app''s daily active user count shrank 30% after a marketing push in the first month, then grew 25% in the second month. What is the net percentage change over the two months?',
  options = '["55% increase", "5% decrease", "12.5% decrease", "5% increase"]'::jsonb,
  answer_index = 2,
  explanation = 'Net factor = 0.7 × 1.25 = 0.875, a 12.5% decrease. ✓'
where id = 253;

update public.questions set
  question = 'The Bright Futures Scholarship Fund holds $10,000.00 and earns 8% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$12,400.00", "$11,664.00", "$7,786.88", "$12,597.12"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $10,000.00 × 1.08^3 = $12,597.12. ✓'
where id = 254;

update public.questions set
  question = 'The Compass Scholarship Fund holds $1,000.00 and earns 5% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$1,200.00", "$1,157.63", "$814.51", "$1,215.51"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $1,000.00 × 1.05^4 = $1,215.51. ✓'
where id = 255;

update public.questions set
  question = 'Hassan notices a slight headache during a long study session. Nina mentions that 25% of the dorm has been dealing with allergies this week. Hassan asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "You definitely have a cold going around school", "Maybe Hassan. But, perhaps not", "You have a 25% chance of having it"]'::jsonb,
  answer_index = 2,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 256;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 2 ft × 2.5 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["372", "378", "420", "408"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 24×30×36. Cubes per dimension: 24/4=6, 30/4=7, 36/4=9. Total = 6×7×9 = 378. ✓'
where id = 257;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 2.5 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["1614", "1620", "1710", "1623"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 12×30×36. Cubes per dimension: 12/2=6, 30/2=15, 36/2=18. Total = 6×15×18 = 1620. ✓'
where id = 258;

update public.questions set
  question = 'For how many real values of x is x^7 = x^2 true?',
  options = '["three", "none", "four", "two"]'::jsonb,
  answer_index = 3,
  explanation = 'x^7 − x^2 = 0 → x^2(x^5−1) = 0 → x=0 or x^5=1. Since 5 is odd, x^5=1 has 1 real solution(s). Total: 2. ✓'
where id = 259;

update public.questions set
  question = 'The bee population at the Willowbrook Apiary increases 8% every 5 years. What is the approximate net percentage change in the bee population after 10 years?',
  options = '["21%", "16%", "12%", "17%"]'::jsonb,
  answer_index = 3,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.08^2 ≈ 1.166, a 17% increase. ✓'
where id = 260;

update public.questions set
  question = 'A swimming pool holds 240 gallons and starts empty. A hose fills it at 20 gallons/minute. After 3 minutes, a drain also opens and removes 5 gallons/minute while the hose stays on. How many minutes after filling starts does the pool become full?',
  options = '["15 minutes", "14 minutes", "12 minutes", "17 minutes"]'::jsonb,
  answer_index = 0,
  explanation = 'In the first 3 min, 60 gallons fill up, leaving 180 gallons. Once the drain opens, net rate = 20−5 = 15 gal/min, so the remaining 180 gallons take 12 more minutes. Total = 3 + 12 = 15 minutes. ✓'
where id = 261;

update public.questions set
  question = 'A gaming console is on sale for 30% off. Sam paid $35.69 for it. Let p represent the regular price. What was the regular price?',
  options = '["$50.99", "$46.40", "$24.98", "$27.45"]'::jsonb,
  answer_index = 0,
  explanation = '70% of the regular price p equals the sale price: 0.70p = $35.69, so p = $35.69 / 0.70 = $50.99. ✓'
where id = 262;

update public.questions set
  question = 'The bee population at the Meadowlark Apiary increases 15% every 5 years. What is the approximate net percentage change in the bee population after 10 years?',
  options = '["30%", "36%", "27%", "32%"]'::jsonb,
  answer_index = 3,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.15^2 ≈ 1.322, a 32% increase. ✓'
where id = 263;

update public.questions set
  question = 'For how many real values of a is a^7 = a^2 true?',
  options = '["four", "two", "three", "none"]'::jsonb,
  answer_index = 1,
  explanation = 'a^7 − a^2 = 0 → a^2(a^5−1) = 0 → a=0 or a^5=1. Since 5 is odd, a^5=1 has 1 real solution(s). Total: 2. ✓'
where id = 264;

update public.questions set
  question = 'Hassan is nervous about qualifying for the science fair. Ben reassures Hassan: "You''re clearly one of the most hard-working people at debate I know, and everyone that hard-working always qualifies, so you''re basically guaranteed a spot." Assuming Ben''s claim about Hassan''s ability is accurate, must the conclusion be true?',
  options = '["Probably false, but may be true", "Cannot be true", "Probably true, but may be false", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone hard-working gets a spot'' (universal) and Hassan is hard-working, then logically Hassan must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 265;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 2 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["1290", "1368", "1299", "1296"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 12×24×36. Cubes per dimension: 12/2=6, 24/2=12, 36/2=18. Total = 6×12×18 = 1296. ✓'
where id = 266;

update public.questions set
  question = 'The Horizon Scholarship Fund holds $5,000.00 and earns 10% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$6,655.00", "$7,320.50", "$7,000.00", "$3,280.50"]'::jsonb,
  answer_index = 1,
  explanation = 'Compound growth: balance = $5,000.00 × 1.10^4 = $7,320.50. ✓'
where id = 267;

update public.questions set
  question = 'Owen feels a bit lightheaded after climbing several flights of stairs. Priya mentions that 9% of the office has been diagnosed with low iron levels. Owen asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Maybe Owen. But, perhaps not", "You have a 9% chance of having it", "Let''s hope you do not have it", "You definitely have a blood pressure issue"]'::jsonb,
  answer_index = 0,
  explanation = 'The symptoms described could have many causes besides low iron levels. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 268;

update public.questions set
  question = 'The Pathways Scholarship Fund holds $2,500.00 and earns 3% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$2,731.82", "$2,281.68", "$2,652.25", "$2,725.00"]'::jsonb,
  answer_index = 0,
  explanation = 'Compound growth: balance = $2,500.00 × 1.03^3 = $2,731.82. ✓'
where id = 269;

update public.questions set
  question = 'A gaming console is on sale for 25% off. Jamal paid $33.75 for it. Let p represent the regular price. What was the regular price?',
  options = '["$42.19", "$27.00", "$25.31", "$45.00"]'::jsonb,
  answer_index = 3,
  explanation = '75% of the regular price p equals the sale price: 0.75p = $33.75, so p = $33.75 / 0.75 = $45.00. ✓'
where id = 270;

update public.questions set
  question = 'For how many real values of a is a^5 = a^3 true?',
  options = '["three", "one", "four", "none"]'::jsonb,
  answer_index = 0,
  explanation = 'a^5 − a^3 = 0 → a^3(a^2−1) = 0 → a=0 or a^2=1. Since 2 is even, a^2=1 has 2 real solution(s). Total: 3. ✓'
where id = 271;

update public.questions set
  question = 'The bee population at the Sunfield Apiary increases 10% every 5 years. What is the approximate net percentage change in the bee population after 15 years?',
  options = '["37%", "28%", "33%", "30%"]'::jsonb,
  answer_index = 2,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.10^3 ≈ 1.331, a 33% increase. ✓'
where id = 272;

update public.questions set
  question = 'A study examines the relationship between hydration levels and cognitive test performance in athletes. Which question is irrelevant to the research?',
  options = '["Could a third factor be influencing both variables?", "Do athletes who stay better hydrated score higher?", "Are well-hydrated athletes also stronger at weightlifting?", "What color is the team''s practice jersey?"]'::jsonb,
  answer_index = 3,
  explanation = 'What color the team''s practice jersey is has nothing to do with hydration and cognitive performance — it''s off-topic for this research question. ✓'
where id = 273;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 1.5 ft × 1.5 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["324", "288", "291", "282"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 18×18×24. Cubes per dimension: 18/3=6, 18/3=6, 24/3=8. Total = 6×6×8 = 288. ✓'
where id = 274;

update public.questions set
  question = 'Umar drove to a lake house at 50 mph and returned along the same road at 40 mph. What was the average speed for the round trip?',
  options = '["45 mph", "44.4 mph", "50 mph", "40 mph"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(50)(40)/(50+40) = 44.4 mph. ✓'
where id = 275;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1 ft × 1 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["81", "84", "78", "90"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 12×12×36. Cubes per dimension: 12/4=3, 12/4=3, 36/4=9. Total = 3×3×9 = 81. ✓'
where id = 276;

update public.questions set
  question = 'A swimming pool holds 400 gallons and starts empty. A hose fills it at 20 gallons/minute. After 5 minutes, a drain also opens and removes 10 gallons/minute while the hose stays on. How many minutes after filling starts does the pool become full?',
  options = '["37 minutes", "20 minutes", "35 minutes", "34 minutes"]'::jsonb,
  answer_index = 2,
  explanation = 'In the first 5 min, 100 gallons fill up, leaving 300 gallons. Once the drain opens, net rate = 20−10 = 10 gal/min, so the remaining 300 gallons take 30 more minutes. Total = 5 + 30 = 35 minutes. ✓'
where id = 277;

update public.questions set
  question = 'On an island cluster map, the distance from Northaven to Saltmarsh is 10 cm, representing an actual distance of 300 miles. Using the same scale, what map distance is closest to the actual distance of 900 miles between Northaven and Driftwood?',
  options = '["29 cm", "30 cm", "31 cm", "32 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 10 cm / 300 mi. Map distance = 10 × (900/300) ≈ 30.0 cm, closest to 30 cm. ✓'
where id = 278;

update public.questions set
  question = 'A study examines the relationship between social media engagement and online sales. Which question is irrelevant to the research?',
  options = '["Is the company''s logo a circle or a square?", "Could a third factor be influencing both variables?", "Does more engagement increase sales?", "Do sales increase during holidays regardless of engagement?"]'::jsonb,
  answer_index = 0,
  explanation = 'Whether the company''s logo is a circle or a square has nothing to do with social media engagement and sales — it''s off-topic for this research question. ✓'
where id = 279;

update public.questions set
  question = 'The bee population at the Clearview Apiary increases 15% every 5 years. What is the approximate net percentage change in the bee population after 10 years?',
  options = '["32%", "30%", "36%", "27%"]'::jsonb,
  answer_index = 0,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.15^2 ≈ 1.322, a 32% increase. ✓'
where id = 280;

update public.questions set
  question = 'For how many real values of b is b^5 = b^3 true?',
  options = '["two", "three", "none", "four"]'::jsonb,
  answer_index = 1,
  explanation = 'b^5 − b^3 = 0 → b^3(b^2−1) = 0 → b=0 or b^2=1. Since 2 is even, b^2=1 has 2 real solution(s). Total: 3. ✓'
where id = 281;

update public.questions set
  question = 'On an island cluster map, the distance from Palmcrest to Coral Bay is 5 cm, representing an actual distance of 250 miles. Using the same scale, what map distance is closest to the actual distance of 1000 miles between Palmcrest and Windmere?',
  options = '["19 cm", "20 cm", "21 cm", "22 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 5 cm / 250 mi. Map distance = 5 × (1000/250) ≈ 20.0 cm, closest to 20 cm. ✓'
where id = 282;

update public.questions set
  question = 'Milo is nervous about qualifying for the championship. Elena reassures Milo: "You''re clearly one of the most talented people at swimming I know, and everyone that talented always qualifies, so you''re basically guaranteed a spot." Assuming Elena''s claim about Milo''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Probably true, but may be false", "Probably false, but may be true", "Cannot be true"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone talented gets a spot'' (universal) and Milo is talented, then logically Milo must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 283;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 2.5 ft × 2.5 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["1003", "990", "1000", "1100"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 30×30×30. Cubes per dimension: 30/3=10, 30/3=10, 30/3=10. Total = 10×10×10 = 1000. ✓'
where id = 284;

update public.questions set
  question = 'On an island cluster map, the distance from Cliffside to Tidewater is 4 cm, representing an actual distance of 350 miles. Using the same scale, what map distance is closest to the actual distance of 700 miles between Cliffside and Brackenford?',
  options = '["7 cm", "8 cm", "9 cm", "10 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 4 cm / 350 mi. Map distance = 4 × (700/350) ≈ 8.0 cm, closest to 8 cm. ✓'
where id = 285;

update public.questions set
  question = 'Priya notices a slight headache during a long study session. Quinn mentions that 25% of the dorm has been dealing with allergies this week. Priya asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You definitely have a cold going around school", "Let''s hope you do not have it", "You have a 25% chance of having it", "Maybe Priya. But, perhaps not"]'::jsonb,
  answer_index = 3,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 286;

update public.questions set
  question = 'The Bright Futures Scholarship Fund holds $10,000.00 and earns 10% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$13,000.00", "$12,100.00", "$7,290.00", "$13,310.00"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $10,000.00 × 1.10^3 = $13,310.00. ✓'
where id = 287;

update public.questions set
  question = 'Farid notices a slight headache during a long study session. Milo mentions that 25% of the dorm has been dealing with allergies this week. Farid asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "You definitely have a cold going around school", "You have a 25% chance of having it", "Maybe Farid. But, perhaps not"]'::jsonb,
  answer_index = 3,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 288;

update public.questions set
  question = 'Yusuf feels a slight muscle ache after a workout. Xena mentions that 12% of the gym members have reported mild dehydration this week. Yusuf asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You definitely have a migraine condition", "Maybe Yusuf. But, perhaps not", "You have a 12% chance of having it", "Let''s hope you do not have it"]'::jsonb,
  answer_index = 1,
  explanation = 'The symptoms described could have many causes besides dehydration. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 289;

update public.questions set
  question = 'Amy is nervous about qualifying for the talent show. Elena reassures Amy: "You''re clearly one of the most hard-working people at debate I know, and everyone that hard-working always qualifies, so you''re basically guaranteed a spot." Assuming Elena''s claim about Amy''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Probably false, but may be true", "Probably true, but may be false", "Cannot be true"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone hard-working gets a spot'' (universal) and Amy is hard-working, then logically Amy must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 290;

update public.questions set
  question = 'A gaming console is on sale for 20% off. Xena paid $16.00 for it. Let p represent the regular price. What was the regular price?',
  options = '["$19.20", "$20.00", "$13.33", "$12.80"]'::jsonb,
  answer_index = 1,
  explanation = '80% of the regular price p equals the sale price: 0.80p = $16.00, so p = $16.00 / 0.80 = $20.00. ✓'
where id = 291;

update public.questions set
  question = 'For how many real values of y is y^6 = y^2 true?',
  options = '["one", "none", "two", "three"]'::jsonb,
  answer_index = 3,
  explanation = 'y^6 − y^2 = 0 → y^2(y^4−1) = 0 → y=0 or y^4=1. Since 4 is even, y^4=1 has 2 real solution(s). Total: 3. ✓'
where id = 292;

update public.questions set
  question = 'A mobile app''s daily active user count shrank 50% after a marketing push in the first month, then grew 10% in the second month. What is the net percentage change over the two months?',
  options = '["45.0% decrease", "40% decrease", "40% increase", "60% increase"]'::jsonb,
  answer_index = 0,
  explanation = 'Net factor = 0.5 × 1.1 = 0.55, a 45.0% decrease. ✓'
where id = 293;

update public.questions set
  question = 'Owen is nervous about qualifying for the championship. Derek reassures Owen: "You''re clearly one of the most hard-working people at debate I know, and everyone that hard-working always qualifies, so you''re basically guaranteed a spot." Assuming Derek''s claim about Owen''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Cannot be false", "Probably false, but may be true", "Cannot be true"]'::jsonb,
  answer_index = 1,
  explanation = 'If ''everyone hard-working gets a spot'' (universal) and Owen is hard-working, then logically Owen must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 294;

update public.questions set
  question = 'Liam is nervous about qualifying for the championship. Milo reassures Liam: "You''re clearly one of the most dedicated people at swimming I know, and everyone that dedicated always qualifies, so you''re basically guaranteed a spot." Assuming Milo''s claim about Liam''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Cannot be false", "Cannot be true", "Probably false, but may be true"]'::jsonb,
  answer_index = 1,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Liam is dedicated, then logically Liam must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 295;

update public.questions set
  question = 'A large cube built from 64 unit cubes (4×4×4) is sliced at a 45° angle, starting along one of its edges. How many of the unit cubes does the cut pass through?',
  options = '["20", "4", "9", "16"]'::jsonb,
  answer_index = 3,
  explanation = 'For an n×n×n cube (n=4), a 45° diagonal plane cut starting along one edge slices through n² = 16 unit cubes. ✓'
where id = 296;

update public.questions set
  question = 'A gaming console is on sale for 10% off. Theo paid $43.20 for it. Let p represent the regular price. What was the regular price?',
  options = '["$48.00", "$39.27", "$47.52", "$38.88"]'::jsonb,
  answer_index = 0,
  explanation = '90% of the regular price p equals the sale price: 0.90p = $43.20, so p = $43.20 / 0.90 = $48.00. ✓'
where id = 297;

update public.questions set
  question = 'On an island cluster map, the distance from Duskwood to Fernhollow is 4 cm, representing an actual distance of 250 miles. Using the same scale, what map distance is closest to the actual distance of 1000 miles between Duskwood and Mistport?',
  options = '["15 cm", "16 cm", "17 cm", "18 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 4 cm / 250 mi. Map distance = 4 × (1000/250) ≈ 16.0 cm, closest to 16 cm. ✓'
where id = 298;

update public.questions set
  question = 'A gaming console is on sale for 15% off. Xena paid $11.04 for it. Let p represent the regular price. What was the regular price?',
  options = '["$12.99", "$12.70", "$9.38", "$9.60"]'::jsonb,
  answer_index = 0,
  explanation = '85% of the regular price p equals the sale price: 0.85p = $11.04, so p = $11.04 / 0.85 = $12.99. ✓'
where id = 299;

update public.questions set
  question = 'For how many real values of z is z^8 = z^1 true?',
  options = '["one", "two", "three", "four"]'::jsonb,
  answer_index = 1,
  explanation = 'z^8 − z^1 = 0 → z^1(z^7−1) = 0 → z=0 or z^7=1. Since 7 is odd, z^7=1 has 1 real solution(s). Total: 2. ✓'
where id = 300;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1 ft × 2.5 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["171", "168", "147", "144"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 12×30×30. Cubes per dimension: 12/4=3, 30/4=7, 30/4=7. Total = 3×7×7 = 147. ✓'
where id = 301;

update public.questions set
  question = 'A gaming console is on sale for 20% off. Quinn paid $38.40 for it. Let p represent the regular price. What was the regular price?',
  options = '["$32.00", "$30.72", "$48.00", "$46.08"]'::jsonb,
  answer_index = 2,
  explanation = '80% of the regular price p equals the sale price: 0.80p = $38.40, so p = $38.40 / 0.80 = $48.00. ✓'
where id = 302;

update public.questions set
  question = 'For how many real values of b is b^6 = b^1 true?',
  options = '["four", "one", "two", "none"]'::jsonb,
  answer_index = 2,
  explanation = 'b^6 − b^1 = 0 → b^1(b^5−1) = 0 → b=0 or b^5=1. Since 5 is odd, b^5=1 has 1 real solution(s). Total: 2. ✓'
where id = 303;

update public.questions set
  question = 'For how many real values of a is a^5 = a^1 true?',
  options = '["three", "none", "one", "four"]'::jsonb,
  answer_index = 0,
  explanation = 'a^5 − a^1 = 0 → a^1(a^4−1) = 0 → a=0 or a^4=1. Since 4 is even, a^4=1 has 2 real solution(s). Total: 3. ✓'
where id = 304;

update public.questions set
  question = 'The bee population at the Sunfield Apiary increases 8% every 5 years. What is the approximate net percentage change in the bee population after 15 years?',
  options = '["30%", "24%", "21%", "26%"]'::jsonb,
  answer_index = 3,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.08^3 ≈ 1.260, a 26% increase. ✓'
where id = 305;

update public.questions set
  question = 'A gaming console is on sale for 15% off. Theo paid $56.09 for it. Let p represent the regular price. What was the regular price?',
  options = '["$47.68", "$65.99", "$64.50", "$48.77"]'::jsonb,
  answer_index = 1,
  explanation = '85% of the regular price p equals the sale price: 0.85p = $56.09, so p = $56.09 / 0.85 = $65.99. ✓'
where id = 306;

update public.questions set
  question = 'Rosa is nervous about qualifying for the talent show. Tara reassures Rosa: "You''re clearly one of the most hard-working people at robotics I know, and everyone that hard-working always qualifies, so you''re basically guaranteed a spot." Assuming Tara''s claim about Rosa''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Probably false, but may be true", "Cannot be true", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone hard-working gets a spot'' (universal) and Rosa is hard-working, then logically Rosa must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 307;

update public.questions set
  question = 'On an island cluster map, the distance from Ashvale to Brightwater is 6 cm, representing an actual distance of 400 miles. Using the same scale, what map distance is closest to the actual distance of 800 miles between Ashvale and Stonecliff?',
  options = '["11 cm", "12 cm", "13 cm", "14 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 6 cm / 400 mi. Map distance = 6 × (800/400) ≈ 12.0 cm, closest to 12 cm. ✓'
where id = 308;

update public.questions set
  question = 'Elena is nervous about qualifying for the championship. Priya reassures Elena: "You''re clearly one of the most dedicated people at competitive chess I know, and everyone that dedicated always qualifies, so you''re basically guaranteed a spot." Assuming Priya''s claim about Elena''s ability is accurate, must the conclusion be true?',
  options = '["Probably false, but may be true", "Cannot be false", "Cannot be true", "Probably true, but may be false"]'::jsonb,
  answer_index = 1,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Elena is dedicated, then logically Elena must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 309;

update public.questions set
  question = 'Zoe feels a bit lightheaded after climbing several flights of stairs. Grace mentions that 9% of the office has been diagnosed with low iron levels. Zoe asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Maybe Zoe. But, perhaps not", "Let''s hope you do not have it", "You definitely have a blood pressure issue", "You have a 9% chance of having it"]'::jsonb,
  answer_index = 0,
  explanation = 'The symptoms described could have many causes besides low iron levels. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 310;

update public.questions set
  question = 'The Compass Scholarship Fund holds $10,000.00 and earns 8% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$11,664.00", "$12,400.00", "$7,786.88", "$12,597.12"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $10,000.00 × 1.08^3 = $12,597.12. ✓'
where id = 311;

update public.questions set
  question = 'The Pathways Scholarship Fund holds $2,000.00 and earns 4% interest per year, compounded annually. What is the balance at the end of year 3?',
  options = '["$1,769.47", "$2,240.00", "$2,163.20", "$2,249.73"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $2,000.00 × 1.04^3 = $2,249.73. ✓'
where id = 312;

update public.questions set
  question = 'A mobile app''s daily active user count grew 15% after a marketing push in the first month, then shrank 50% in the second month. What is the net percentage change over the two months?',
  options = '["65% increase", "35% decrease", "35% increase", "42.5% decrease"]'::jsonb,
  answer_index = 3,
  explanation = 'Net factor = 1.15 × 0.5 = 0.575, a 42.5% decrease. ✓'
where id = 313;

update public.questions set
  question = 'A gaming console is on sale for 15% off. Carla paid $46.75 for it. Let p represent the regular price. What was the regular price?',
  options = '["$40.65", "$39.74", "$53.76", "$55.00"]'::jsonb,
  answer_index = 3,
  explanation = '85% of the regular price p equals the sale price: 0.85p = $46.75, so p = $46.75 / 0.85 = $55.00. ✓'
where id = 314;

update public.questions set
  question = 'Ben drove to a lake house at 40 mph and returned along the same road at 50 mph. What was the average speed for the round trip?',
  options = '["44.4 mph", "45 mph", "40 mph", "50 mph"]'::jsonb,
  answer_index = 0,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(40)(50)/(40+50) = 44.4 mph. ✓'
where id = 315;

update public.questions set
  question = 'A gaming console is on sale for 30% off. Umar paid $56.69 for it. Let p represent the regular price. What was the regular price?',
  options = '["$80.99", "$39.68", "$73.70", "$43.61"]'::jsonb,
  answer_index = 0,
  explanation = '70% of the regular price p equals the sale price: 0.70p = $56.69, so p = $56.69 / 0.70 = $80.99. ✓'
where id = 316;

update public.questions set
  question = 'On an island cluster map, the distance from Harborview to Foxglen is 6 cm, representing an actual distance of 300 miles. Using the same scale, what map distance is closest to the actual distance of 1100 miles between Harborview and Larkspur?',
  options = '["21 cm", "22 cm", "23 cm", "24 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 6 cm / 300 mi. Map distance = 6 × (1100/300) ≈ 22.0 cm, closest to 22 cm. ✓'
where id = 317;

update public.questions set
  question = 'Rosa drove to a lake house at 45 mph and returned along the same road at 50 mph. What was the average speed for the round trip?',
  options = '["50 mph", "45 mph", "47.4 mph", "47.5 mph"]'::jsonb,
  answer_index = 2,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(45)(50)/(45+50) = 47.4 mph. ✓'
where id = 318;

update public.questions set
  question = 'Ben drove to a lake house at 30 mph and returned along the same road at 20 mph. What was the average speed for the round trip?',
  options = '["20 mph", "24 mph", "30 mph", "25 mph"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(30)(20)/(30+20) = 24 mph. ✓'
where id = 319;

update public.questions set
  question = 'The bee population at the Clearview Apiary increases 12% every 5 years. What is the approximate net percentage change in the bee population after 10 years?',
  options = '["29%", "25%", "20%", "24%"]'::jsonb,
  answer_index = 1,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.12^2 ≈ 1.254, a 25% increase. ✓'
where id = 320;

update public.questions set
  question = 'The bee population at the Hazelnut Apiary increases 12% every 5 years. What is the approximate net percentage change in the bee population after 15 years?',
  options = '["35%", "44%", "36%", "40%"]'::jsonb,
  answer_index = 3,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.12^3 ≈ 1.405, a 40% increase. ✓'
where id = 321;

update public.questions set
  question = 'Farid notices a slight headache during a long study session. Xena mentions that 25% of the dorm has been dealing with allergies this week. Farid asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "Maybe Farid. But, perhaps not", "You have a 25% chance of having it", "You definitely have a cold going around school"]'::jsonb,
  answer_index = 1,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 322;

update public.questions set
  question = 'Xena is nervous about qualifying for the regional tournament. Umar reassures Xena: "You''re clearly one of the most talented people at coding I know, and everyone that talented always qualifies, so you''re basically guaranteed a spot." Assuming Umar''s claim about Xena''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be true", "Cannot be false", "Probably false, but may be true", "Probably true, but may be false"]'::jsonb,
  answer_index = 1,
  explanation = 'If ''everyone talented gets a spot'' (universal) and Xena is talented, then logically Xena must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 323;

update public.questions set
  question = 'Hassan is nervous about qualifying for the regional tournament. Vera reassures Hassan: "You''re clearly one of the most skilled people at swimming I know, and everyone that skilled always qualifies, so you''re basically guaranteed a spot." Assuming Vera''s claim about Hassan''s ability is accurate, must the conclusion be true?',
  options = '["Probably false, but may be true", "Cannot be true", "Probably true, but may be false", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Hassan is skilled, then logically Hassan must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 324;

update public.questions set
  question = 'Ben is nervous about qualifying for the championship. Farid reassures Ben: "You''re clearly one of the most hard-working people at coding I know, and everyone that hard-working always qualifies, so you''re basically guaranteed a spot." Assuming Farid''s claim about Ben''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Probably true, but may be false", "Cannot be true", "Probably false, but may be true"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone hard-working gets a spot'' (universal) and Ben is hard-working, then logically Ben must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 325;

update public.questions set
  question = 'A gaming console is on sale for 10% off. Jamal paid $36.89 for it. Let p represent the regular price. What was the regular price?',
  options = '["$33.54", "$40.58", "$33.20", "$40.99"]'::jsonb,
  answer_index = 3,
  explanation = '90% of the regular price p equals the sale price: 0.90p = $36.89, so p = $36.89 / 0.90 = $40.99. ✓'
where id = 326;

update public.questions set
  question = 'For how many real values of w is w^4 = w^1 true?',
  options = '["none", "four", "two", "one"]'::jsonb,
  answer_index = 2,
  explanation = 'w^4 − w^1 = 0 → w^1(w^3−1) = 0 → w=0 or w^3=1. Since 3 is odd, w^3=1 has 1 real solution(s). Total: 2. ✓'
where id = 327;

update public.questions set
  question = 'The Horizon Scholarship Fund holds $2,000.00 and earns 3% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$1,770.59", "$2,240.00", "$2,251.02", "$2,185.45"]'::jsonb,
  answer_index = 2,
  explanation = 'Compound growth: balance = $2,000.00 × 1.03^4 = $2,251.02. ✓'
where id = 328;

update public.questions set
  question = 'On an island cluster map, the distance from Millrace to Greystone is 6 cm, representing an actual distance of 350 miles. Using the same scale, what map distance is closest to the actual distance of 600 miles between Millrace and Havenwood?',
  options = '["9 cm", "10 cm", "11 cm", "12 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 6 cm / 350 mi. Map distance = 6 × (600/350) ≈ 10.3 cm, closest to 10 cm. ✓'
where id = 329;

update public.questions set
  question = 'Three storage bins are labeled ''novels'', ''textbooks'', and ''novels and textbooks'' — but all labels are wrong. Which bin must you open to correctly relabel all three?',
  options = '["Box marked ''novels and textbooks''", "Box marked ''textbooks''", "Any one of the three boxes", "Box marked ''novels''"]'::jsonb,
  answer_index = 0,
  explanation = 'Since every label is wrong, the bin marked ''novels and textbooks'' can''t actually be mixed — it must hold only one item type. Opening just that bin reveals its true content, letting you deduce the other two by elimination. ✓'
where id = 330;

update public.questions set
  question = 'A swimming pool holds 200 gallons and starts empty. A hose fills it at 20 gallons/minute. After 4 minutes, a drain also opens and removes 12 gallons/minute while the hose stays on. How many minutes after filling starts does the pool become full?',
  options = '["18 minutes", "19 minutes", "10 minutes", "21 minutes"]'::jsonb,
  answer_index = 1,
  explanation = 'In the first 4 min, 80 gallons fill up, leaving 120 gallons. Once the drain opens, net rate = 20−12 = 8 gal/min, so the remaining 120 gallons take 15 more minutes. Total = 4 + 15 = 19 minutes. ✓'
where id = 331;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B→C→D→E; Gear A turns clockwise. Which direction does Gear E turn?',
  options = '["In either direction", "clockwise", "counter-clockwise", "Cannot be determined"]'::jsonb,
  answer_index = 1,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear E is 4 steps from Gear A, so it ends up rotating clockwise. ✓'
where id = 332;

update public.questions set
  question = 'Theo drove to a lake house at 45 mph and returned along the same road at 35 mph. What was the average speed for the round trip?',
  options = '["35 mph", "45 mph", "40 mph", "39.4 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(45)(35)/(45+35) = 39.4 mph. ✓'
where id = 333;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 2 ft × 2 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["632", "704", "643", "640"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 24×24×30. Cubes per dimension: 24/3=8, 24/3=8, 30/3=10. Total = 8×8×10 = 640. ✓'
where id = 334;

update public.questions set
  question = 'In a survey of favorite ice cream flavors, one flavor received 42% of the votes. What is the angle of that flavor''s sector in a pie chart?',
  options = '["151.2°", "161.2°", "126°", "143.2°"]'::jsonb,
  answer_index = 0,
  explanation = 'Sector angle = percentage × 360° = 42% × 360° = 151.2°. ✓'
where id = 335;

update public.questions set
  question = 'The bee population at the Sunfield Apiary increases 12% every 5 years. What is the approximate net percentage change in the bee population after 15 years?',
  options = '["35%", "40%", "44%", "36%"]'::jsonb,
  answer_index = 1,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.12^3 ≈ 1.405, a 40% increase. ✓'
where id = 336;

update public.questions set
  question = 'A mobile app''s daily active user count shrank 50% after a marketing push in the first month, then grew 30% in the second month. What is the net percentage change over the two months?',
  options = '["80% increase", "20% decrease", "35% decrease", "20% increase"]'::jsonb,
  answer_index = 2,
  explanation = 'Net factor = 0.5 × 1.3 = 0.65, a 35% decrease. ✓'
where id = 337;

update public.questions set
  question = 'Quinn is nervous about qualifying for the recital. Owen reassures Quinn: "You''re clearly one of the most dedicated people at robotics I know, and everyone that dedicated always qualifies, so you''re basically guaranteed a spot." Assuming Owen''s claim about Quinn''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Cannot be true", "Probably false, but may be true", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Quinn is dedicated, then logically Quinn must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 338;

update public.questions set
  question = 'The bee population at the Willowbrook Apiary increases 12% every 5 years. What is the approximate net percentage change in the bee population after 15 years?',
  options = '["44%", "35%", "36%", "40%"]'::jsonb,
  answer_index = 3,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.12^3 ≈ 1.405, a 40% increase. ✓'
where id = 339;

update public.questions set
  question = 'Vera is nervous about qualifying for the science fair. Theo reassures Vera: "You''re clearly one of the most skilled people at gymnastics I know, and everyone that skilled always qualifies, so you''re basically guaranteed a spot." Assuming Theo''s claim about Vera''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Probably true, but may be false", "Cannot be true", "Probably false, but may be true"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Vera is skilled, then logically Vera must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 340;

update public.questions set
  question = 'Tara is nervous about qualifying for the regional tournament. Wesley reassures Tara: "You''re clearly one of the most skilled people at debate I know, and everyone that skilled always qualifies, so you''re basically guaranteed a spot." Assuming Wesley''s claim about Tara''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Cannot be true", "Probably true, but may be false", "Probably false, but may be true"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Tara is skilled, then logically Tara must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 341;

update public.questions set
  question = 'Milo feels a slight muscle ache after a workout. Farid mentions that 12% of the gym members have reported mild dehydration this week. Milo asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "You definitely have a migraine condition", "Maybe Milo. But, perhaps not", "You have a 12% chance of having it"]'::jsonb,
  answer_index = 2,
  explanation = 'The symptoms described could have many causes besides dehydration. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 342;

update public.questions set
  question = 'On an island cluster map, the distance from Bramblewick to Ironford is 4 cm, representing an actual distance of 400 miles. Using the same scale, what map distance is closest to the actual distance of 1100 miles between Bramblewick and Quailridge?',
  options = '["10 cm", "11 cm", "12 cm", "13 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 4 cm / 400 mi. Map distance = 4 × (1100/400) ≈ 11.0 cm, closest to 11 cm. ✓'
where id = 343;

update public.questions set
  question = 'A sign maker was supposed to spell out PLANT in neon letters for a storefront, but mistakenly arranged them as PLTNA. What is the least number of letter swaps needed to fix it?',
  options = '["0", "1", "2", "3"]'::jsonb,
  answer_index = 1,
  explanation = 'Comparing PLTNA to PLANT position by position and tracing the misplaced letters into swap cycles gives a minimum of 1 swap(s) to correct. ✓'
where id = 344;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 2 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["1074", "1080", "1083", "1152"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 12×24×30. Cubes per dimension: 12/2=6, 24/2=12, 30/2=15. Total = 6×12×15 = 1080. ✓'
where id = 345;

update public.questions set
  question = 'Ivy drove to a lake house at 40 mph and returned along the same road at 30 mph. What was the average speed for the round trip?',
  options = '["40 mph", "34.3 mph", "30 mph", "35 mph"]'::jsonb,
  answer_index = 1,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(40)(30)/(40+30) = 34.3 mph. ✓'
where id = 346;

update public.questions set
  question = 'Amy notices a slight headache during a long study session. Aisha mentions that 25% of the dorm has been dealing with allergies this week. Amy asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["Let''s hope you do not have it", "You have a 25% chance of having it", "Maybe Amy. But, perhaps not", "You definitely have a cold going around school"]'::jsonb,
  answer_index = 2,
  explanation = 'The symptoms described could have many causes besides allergies. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 347;

update public.questions set
  question = 'On an island cluster map, the distance from Emberfall to Sagebrush is 10 cm, representing an actual distance of 400 miles. Using the same scale, what map distance is closest to the actual distance of 900 miles between Emberfall and Wrenfield?',
  options = '["21 cm", "22 cm", "23 cm", "24 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 10 cm / 400 mi. Map distance = 10 × (900/400) ≈ 22.5 cm, closest to 22 cm. ✓'
where id = 348;

update public.questions set
  question = 'A gaming console is on sale for 30% off. Tara paid $18.19 for it. Let p represent the regular price. What was the regular price?',
  options = '["$12.73", "$13.99", "$23.65", "$25.99"]'::jsonb,
  answer_index = 3,
  explanation = '70% of the regular price p equals the sale price: 0.70p = $18.19, so p = $18.19 / 0.70 = $25.99. ✓'
where id = 349;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 1.5 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["702", "648", "642", "651"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 12×18×24. Cubes per dimension: 12/2=6, 18/2=9, 24/2=12. Total = 6×9×12 = 648. ✓'
where id = 350;

update public.questions set
  question = 'On an island cluster map, the distance from Thistledown to Copperfield is 5 cm, representing an actual distance of 450 miles. Using the same scale, what map distance is closest to the actual distance of 800 miles between Thistledown and Marrow Bay?',
  options = '["8 cm", "9 cm", "10 cm", "11 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 5 cm / 450 mi. Map distance = 5 × (800/450) ≈ 8.9 cm, closest to 9 cm. ✓'
where id = 351;

update public.questions set
  question = 'A gaming console is on sale for 25% off. Sam paid $21.00 for it. Let p represent the regular price. What was the regular price?',
  options = '["$16.80", "$28.00", "$26.25", "$15.75"]'::jsonb,
  answer_index = 1,
  explanation = '75% of the regular price p equals the sale price: 0.75p = $21.00, so p = $21.00 / 0.75 = $28.00. ✓'
where id = 352;

update public.questions set
  question = 'A gaming console is on sale for 10% off. Wesley paid $18.00 for it. Let p represent the regular price. What was the regular price?',
  options = '["$19.80", "$16.36", "$20.00", "$16.20"]'::jsonb,
  answer_index = 2,
  explanation = '90% of the regular price p equals the sale price: 0.90p = $18.00, so p = $18.00 / 0.90 = $20.00. ✓'
where id = 353;

update public.questions set
  question = 'Yusuf is nervous about qualifying for the regional tournament. Priya reassures Yusuf: "You''re clearly one of the most skilled people at competitive chess I know, and everyone that skilled always qualifies, so you''re basically guaranteed a spot." Assuming Priya''s claim about Yusuf''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Probably false, but may be true", "Cannot be true", "Probably true, but may be false"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Yusuf is skilled, then logically Yusuf must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 354;

update public.questions set
  question = 'The Compass Scholarship Fund holds $2,000.00 and earns 10% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$2,420.00", "$1,620.00", "$2,400.00", "$2,200.00"]'::jsonb,
  answer_index = 0,
  explanation = 'Compound growth: balance = $2,000.00 × 1.10^2 = $2,420.00. ✓'
where id = 355;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 1 ft × 1 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["219", "216", "210", "252"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 12×12×12. Cubes per dimension: 12/2=6, 12/2=6, 12/2=6. Total = 6×6×6 = 216. ✓'
where id = 356;

update public.questions set
  question = 'The Bright Futures Scholarship Fund holds $5,000.00 and earns 5% interest per year, compounded annually. What is the balance at the end of year 4?',
  options = '["$5,788.13", "$6,000.00", "$6,077.53", "$4,072.53"]'::jsonb,
  answer_index = 2,
  explanation = 'Compound growth: balance = $5,000.00 × 1.05^4 = $6,077.53. ✓'
where id = 357;

update public.questions set
  question = 'The Pathways Scholarship Fund holds $4,000.00 and earns 4% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$3,686.40", "$4,326.40", "$4,320.00", "$4,160.00"]'::jsonb,
  answer_index = 1,
  explanation = 'Compound growth: balance = $4,000.00 × 1.04^2 = $4,326.40. ✓'
where id = 358;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1 ft × 1 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["72", "60", "63", "70"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 12×12×30. Cubes per dimension: 12/4=3, 12/4=3, 30/4=7. Total = 3×3×7 = 63. ✓'
where id = 359;

update public.questions set
  question = 'In a circuit, resistors R1 and R2 (each 6 Ohms) are connected in parallel between points a and b. Point b connects to point c, where two more 6-Ohm resistors, R3 and R4, are connected in series, ending at point d. What is the total resistance measured between points a and d?',
  options = '["24 Ohms", "15 Ohms", "18 Ohms", "9 Ohms"]'::jsonb,
  answer_index = 1,
  explanation = 'R1∥R2 = 6/2 = 3 Ohms. R3+R4 in series = 12 Ohms. Since b and c are joined, total = 3 Ohms + 12 Ohms = 15 Ohms. ✓'
where id = 360;

update public.questions set
  question = 'The Horizon Scholarship Fund holds $8,000.00 and earns 3% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$8,487.20", "$7,527.20", "$8,480.00", "$8,240.00"]'::jsonb,
  answer_index = 0,
  explanation = 'Compound growth: balance = $8,000.00 × 1.03^2 = $8,487.20. ✓'
where id = 361;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1.5 ft × 2.5 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["280", "306", "248", "252"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 18×30×36. Cubes per dimension: 18/4=4, 30/4=7, 36/4=9. Total = 4×7×9 = 252. ✓'
where id = 362;

update public.questions set
  question = 'Amy is nervous about qualifying for the talent show. Wesley reassures Amy: "You''re clearly one of the most dedicated people at coding I know, and everyone that dedicated always qualifies, so you''re basically guaranteed a spot." Assuming Wesley''s claim about Amy''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Cannot be true", "Probably false, but may be true", "Cannot be false"]'::jsonb,
  answer_index = 3,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Amy is dedicated, then logically Amy must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 363;

update public.questions set
  question = 'On an island cluster map, the distance from Wolfden to Amberleigh is 4 cm, representing an actual distance of 150 miles. Using the same scale, what map distance is closest to the actual distance of 1100 miles between Wolfden and Cinderpath?',
  options = '["28 cm", "29 cm", "30 cm", "31 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 4 cm / 150 mi. Map distance = 4 × (1100/150) ≈ 29.3 cm, closest to 29 cm. ✓'
where id = 364;

update public.questions set
  question = 'For how many real values of a is a^4 = a^2 true?',
  options = '["three", "two", "four", "none"]'::jsonb,
  answer_index = 0,
  explanation = 'a^4 − a^2 = 0 → a^2(a^2−1) = 0 → a=0 or a^2=1. Since 2 is even, a^2=1 has 2 real solution(s). Total: 3. ✓'
where id = 365;

update public.questions set
  question = 'Inside a mechanical clock, a train of meshed gears runs A→B; Gear A turns counter-clockwise. Which direction does Gear B turn?',
  options = '["clockwise", "In either direction", "counter-clockwise", "Cannot be determined"]'::jsonb,
  answer_index = 0,
  explanation = 'Every meshed gear alternates direction from the one before it. Gear B is 1 steps from Gear A, so it ends up rotating clockwise. ✓'
where id = 366;

update public.questions set
  question = 'Amy is nervous about qualifying for the recital. Milo reassures Amy: "You''re clearly one of the most dedicated people at painting I know, and everyone that dedicated always qualifies, so you''re basically guaranteed a spot." Assuming Milo''s claim about Amy''s ability is accurate, must the conclusion be true?',
  options = '["Probably true, but may be false", "Cannot be true", "Cannot be false", "Probably false, but may be true"]'::jsonb,
  answer_index = 2,
  explanation = 'If ''everyone dedicated gets a spot'' (universal) and Amy is dedicated, then logically Amy must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 367;

update public.questions set
  question = 'The bee population at the Meadowlark Apiary increases 10% every 5 years. What is the approximate net percentage change in the bee population after 15 years?',
  options = '["37%", "30%", "33%", "28%"]'::jsonb,
  answer_index = 2,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.10^3 ≈ 1.331, a 33% increase. ✓'
where id = 368;

update public.questions set
  question = 'After soccer practice, Ben feels warm and achy. Carla mentions a news report that 18% of the neighborhood recently caught a stomach bug. Ben asks if that''s really what''s going on. What''s the most logical reply?',
  options = '["You have a 18% chance of having it", "You definitely have the flu", "Let''s hope you do not have it", "Maybe Ben. But, perhaps not"]'::jsonb,
  answer_index = 3,
  explanation = 'The symptoms described could have many causes besides a stomach bug. The honest, logical answer acknowledges the uncertainty rather than jumping to a conclusion. ✓'
where id = 369;

update public.questions set
  question = 'Tara is nervous about qualifying for the championship. Maya reassures Tara: "You''re clearly one of the most skilled people at debate I know, and everyone that skilled always qualifies, so you''re basically guaranteed a spot." Assuming Maya''s claim about Tara''s ability is accurate, must the conclusion be true?',
  options = '["Cannot be false", "Cannot be true", "Probably true, but may be false", "Probably false, but may be true"]'::jsonb,
  answer_index = 0,
  explanation = 'If ''everyone skilled gets a spot'' (universal) and Tara is skilled, then logically Tara must get a spot — this is a valid syllogism, so the conclusion cannot be false. ✓'
where id = 370;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 3 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["2052", "1947", "1938", "1944"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 12×36×36. Cubes per dimension: 12/2=6, 36/2=18, 36/2=18. Total = 6×18×18 = 1944. ✓'
where id = 371;

update public.questions set
  question = 'For how many real values of z is z^5 = z^3 true?',
  options = '["three", "four", "one", "none"]'::jsonb,
  answer_index = 0,
  explanation = 'z^5 − z^3 = 0 → z^3(z^2−1) = 0 → z=0 or z^2=1. Since 2 is even, z^2=1 has 2 real solution(s). Total: 3. ✓'
where id = 372;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1.5 ft × 2.5 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["2421", "2433", "2430", "2565"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 18×30×36. Cubes per dimension: 18/2=9, 30/2=15, 36/2=18. Total = 9×15×18 = 2430. ✓'
where id = 373;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 2 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["867", "858", "864", "936"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 12×24×24. Cubes per dimension: 12/2=6, 24/2=12, 24/2=12. Total = 6×12×12 = 864. ✓'
where id = 374;

update public.questions set
  question = 'A swimming pool holds 400 gallons and starts empty. A hose fills it at 20 gallons/minute. After 5 minutes, a drain also opens and removes 5 gallons/minute while the hose stays on. How many minutes after filling starts does the pool become full?',
  options = '["27 minutes", "25 minutes", "24 minutes", "20 minutes"]'::jsonb,
  answer_index = 1,
  explanation = 'In the first 5 min, 100 gallons fill up, leaving 300 gallons. Once the drain opens, net rate = 20−5 = 15 gal/min, so the remaining 300 gallons take 20 more minutes. Total = 5 + 20 = 25 minutes. ✓'
where id = 375;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1.5 ft × 3 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["324", "367", "360", "320"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 18×36×36. Cubes per dimension: 18/4=4, 36/4=9, 36/4=9. Total = 4×9×9 = 324. ✓'
where id = 376;

update public.questions set
  question = 'A gaming console is on sale for 15% off. Kira paid $25.50 for it. Let p represent the regular price. What was the regular price?',
  options = '["$30.00", "$22.17", "$29.32", "$21.68"]'::jsonb,
  answer_index = 0,
  explanation = '85% of the regular price p equals the sale price: 0.85p = $25.50, so p = $25.50 / 0.85 = $30.00. ✓'
where id = 377;

update public.questions set
  question = 'On an island cluster map, the distance from Foxhollow to Slateport is 3 cm, representing an actual distance of 200 miles. Using the same scale, what map distance is closest to the actual distance of 600 miles between Foxhollow and Wintermere?',
  options = '["8 cm", "9 cm", "10 cm", "11 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 3 cm / 200 mi. Map distance = 3 × (600/200) ≈ 9.0 cm, closest to 9 cm. ✓'
where id = 378;

update public.questions set
  question = 'The bee population at the Hazelnut Apiary increases 15% every 5 years. What is the approximate net percentage change in the bee population after 10 years?',
  options = '["27%", "32%", "30%", "36%"]'::jsonb,
  answer_index = 1,
  explanation = '10 years is 2 periods of 5 years: growth factor = 1.15^2 ≈ 1.322, a 32% increase. ✓'
where id = 379;

update public.questions set
  question = 'A swimming pool holds 240 gallons and starts empty. A hose fills it at 30 gallons/minute. After 2 minutes, a drain also opens and removes 12 gallons/minute while the hose stays on. How many minutes after filling starts does the pool become full?',
  options = '["8 minutes", "12 minutes", "14 minutes", "11 minutes"]'::jsonb,
  answer_index = 1,
  explanation = 'In the first 2 min, 60 gallons fill up, leaving 180 gallons. Once the drain opens, net rate = 30−12 = 18 gal/min, so the remaining 180 gallons take 10 more minutes. Total = 2 + 10 = 12 minutes. ✓'
where id = 380;

update public.questions set
  question = 'A swimming pool holds 360 gallons and starts empty. A hose fills it at 20 gallons/minute. After 3 minutes, a drain also opens and removes 5 gallons/minute while the hose stays on. How many minutes after filling starts does the pool become full?',
  options = '["22 minutes", "23 minutes", "18 minutes", "25 minutes"]'::jsonb,
  answer_index = 1,
  explanation = 'In the first 3 min, 60 gallons fill up, leaving 300 gallons. Once the drain opens, net rate = 20−5 = 15 gal/min, so the remaining 300 gallons take 20 more minutes. Total = 3 + 20 = 23 minutes. ✓'
where id = 381;

update public.questions set
  question = 'On an island cluster map, the distance from Bellcross to Ravenmoor is 6 cm, representing an actual distance of 150 miles. Using the same scale, what map distance is closest to the actual distance of 1100 miles between Bellcross and Halcyon?',
  options = '["43 cm", "44 cm", "45 cm", "46 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 6 cm / 150 mi. Map distance = 6 × (1100/150) ≈ 44.0 cm, closest to 44 cm. ✓'
where id = 382;

update public.questions set
  question = 'Aisha drove to a lake house at 60 mph and returned along the same road at 50 mph. What was the average speed for the round trip?',
  options = '["55 mph", "50 mph", "60 mph", "54.5 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(60)(50)/(60+50) = 54.5 mph. ✓'
where id = 383;

update public.questions set
  question = 'Wesley drove to a lake house at 40 mph and returned along the same road at 50 mph. What was the average speed for the round trip?',
  options = '["50 mph", "45 mph", "40 mph", "44.4 mph"]'::jsonb,
  answer_index = 3,
  explanation = 'For equal distances at two speeds, average speed is the harmonic mean: 2(40)(50)/(40+50) = 44.4 mph. ✓'
where id = 384;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 2 ft × 2 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["2148", "2304", "2163", "2160"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 24×24×30. Cubes per dimension: 24/2=12, 24/2=12, 30/2=15. Total = 12×12×15 = 2160. ✓'
where id = 385;

update public.questions set
  question = 'The Compass Scholarship Fund holds $2,000.00 and earns 4% interest per year, compounded annually. What is the balance at the end of year 2?',
  options = '["$1,843.20", "$2,160.00", "$2,080.00", "$2,163.20"]'::jsonb,
  answer_index = 3,
  explanation = 'Compound growth: balance = $2,000.00 × 1.04^2 = $2,163.20. ✓'
where id = 386;

update public.questions set
  question = 'A mobile app''s daily active user count shrank 10% after a marketing push in the first month, then grew 20% in the second month. What is the net percentage change over the two months?',
  options = '["8.0% increase", "10% decrease", "30% decrease", "10% increase"]'::jsonb,
  answer_index = 0,
  explanation = 'Net factor = 0.9 × 1.2 = 1.08, a 8.0% increase. ✓'
where id = 387;

update public.questions set
  question = 'On an island cluster map, the distance from Driftglen to Southport is 8 cm, representing an actual distance of 200 miles. Using the same scale, what map distance is closest to the actual distance of 1000 miles between Driftglen and Nightingale?',
  options = '["39 cm", "40 cm", "41 cm", "42 cm"]'::jsonb,
  answer_index = 1,
  explanation = 'Scale: 8 cm / 200 mi. Map distance = 8 × (1000/200) ≈ 40.0 cm, closest to 40 cm. ✓'
where id = 388;

update public.questions set
  question = 'The bee population at the Hazelnut Apiary increases 8% every 5 years. What is the approximate net percentage change in the bee population after 15 years?',
  options = '["26%", "24%", "21%", "30%"]'::jsonb,
  answer_index = 0,
  explanation = '15 years is 3 periods of 5 years: growth factor = 1.08^3 ≈ 1.260, a 26% increase. ✓'
where id = 389;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1.5 ft × 1.5 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["975", "963", "972", "1053"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 18×18×24. Cubes per dimension: 18/2=9, 18/2=9, 24/2=12. Total = 9×9×12 = 972. ✓'
where id = 390;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 1.5 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["813", "804", "864", "810"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 12×18×30. Cubes per dimension: 12/2=6, 18/2=9, 30/2=15. Total = 6×9×15 = 810. ✓'
where id = 391;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1 ft × 1.5 ft × 1.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["60", "45", "48", "63"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 12×18×18. Cubes per dimension: 12/4=3, 18/4=4, 18/4=4. Total = 3×4×4 = 48. ✓'
where id = 392;

update public.questions set
  question = 'A warehouse is packing 4-inch wooden cube blocks into a shipping crate measuring 1.5 ft × 2 ft × 2.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["192", "164", "205", "168"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 18×24×30. Cubes per dimension: 18/4=4, 24/4=6, 30/4=7. Total = 4×6×7 = 168. ✓'
where id = 393;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 3 ft × 3 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["1731", "1872", "1728", "1716"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 36×36×36. Cubes per dimension: 36/3=12, 36/3=12, 36/3=12. Total = 12×12×12 = 1728. ✓'
where id = 394;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 2 ft × 3 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["4104", "3891", "3876", "3888"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 24×36×36. Cubes per dimension: 24/2=12, 36/2=18, 36/2=18. Total = 12×18×18 = 3888. ✓'
where id = 395;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 1 ft × 1 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["128", "144", "131", "124"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 12×12×24. Cubes per dimension: 12/3=4, 12/3=4, 24/3=8. Total = 4×4×8 = 128. ✓'
where id = 396;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 1.5 ft × 2 ft × 2 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["387", "432", "384", "378"]'::jsonb,
  answer_index = 2,
  explanation = 'Convert to inches: 18×24×24. Cubes per dimension: 18/3=6, 24/3=8, 24/3=8. Total = 6×8×8 = 384. ✓'
where id = 397;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 1 ft × 1 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["195", "192", "188", "208"]'::jsonb,
  answer_index = 1,
  explanation = 'Convert to inches: 12×12×36. Cubes per dimension: 12/3=4, 12/3=4, 36/3=12. Total = 4×4×12 = 192. ✓'
where id = 398;

update public.questions set
  question = 'A warehouse is packing 3-inch wooden cube blocks into a shipping crate measuring 1 ft × 2.5 ft × 3 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["480", "476", "483", "520"]'::jsonb,
  answer_index = 0,
  explanation = 'Convert to inches: 12×30×36. Cubes per dimension: 12/3=4, 30/3=10, 36/3=12. Total = 4×10×12 = 480. ✓'
where id = 399;

update public.questions set
  question = 'A warehouse is packing 2-inch wooden cube blocks into a shipping crate measuring 1 ft × 1.5 ft × 1.5 ft. What is the maximum number of these cubes that fit inside the crate?',
  options = '["489", "540", "480", "486"]'::jsonb,
  answer_index = 3,
  explanation = 'Convert to inches: 12×18×18. Cubes per dimension: 12/2=6, 18/2=9, 18/2=9. Total = 6×9×9 = 486. ✓'
where id = 400;
