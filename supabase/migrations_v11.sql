-- Equalizer schema v11: adds 15 original circuit-logic questions to the
-- ACL (AOS/AET) bank, tagged Logic/Reasoning. These describe each circuit
-- fully in text (series/parallel switch and bulb wiring) rather than as a
-- diagram, since the app's question schema and practice UI don't currently
-- support images -- adding that would be a separate feature, not a content
-- change. Written from scratch, not copied from any source.
insert into public.questions (subject, category, question, options, answer_index, explanation) values

('acl', 'Logic/Reasoning', 'A circuit has a battery connected to a light bulb through two switches, Switch X and Switch Y, wired one after another along the same single path (in series) -- meaning current must pass through both switches to complete the loop. Which of the following actions will make the light glow?',
 '["Open both Switch X and Switch Y", "Close Switch X and open Switch Y", "Open Switch X and close Switch Y", "Close both Switch X and Switch Y", "All of the above except the first option", "None of the above"]'::jsonb,
 3, 'In a series circuit, current has only one path, so every switch along that path must be closed for current to flow. With Switch X or Switch Y open, the loop is broken. Only closing both completes the circuit.'),

('acl', 'Logic/Reasoning', 'A battery is connected to a light bulb. Two switches, Switch M and Switch N, are wired as two separate parallel branches between the battery and the bulb -- current can complete the circuit by passing through either switch independently. Which of the following actions will make the light glow?',
 '["Open both Switch M and Switch N", "Close Switch M and open Switch N", "Open Switch M and close Switch N", "Close both Switch M and Switch N", "All of the above except the first option", "None of the above"]'::jsonb,
 4, 'In a parallel circuit, each branch offers its own complete path to the battery. Closing either switch alone -- or both -- completes at least one path, so the light glows in every case except when both are open.'),

('acl', 'Logic/Reasoning', 'A circuit connects a battery to a light bulb through three switches -- Switch 1, Switch 2, and Switch 3 -- all wired in series along a single path. Which combination of switch positions will make the light glow?',
 '["Switch 1 closed, Switch 2 open, Switch 3 closed", "Switch 1 closed, Switch 2 closed, Switch 3 open", "All three switches open", "All three switches closed", "Any two of the three switches closed", "None of the above"]'::jsonb,
 3, 'A series path is only complete when every component along it is closed. If even one of the three switches is open, the single available path is broken and the light cannot glow.'),

('acl', 'Logic/Reasoning', 'In a circuit, Switch C is wired in series between the battery and a junction. From that junction, two parallel branches -- one through Switch A, one through Switch B -- reconnect before reaching the light bulb. Which of the following will make the light glow?',
 '["Switch C open, Switch A closed, Switch B closed", "Switch C closed, Switch A open, Switch B open", "Switch C closed, Switch A closed, Switch B open", "Switch C open, Switch A open, Switch B open", "Exactly one of Switch A or Switch B closed, with Switch C open", "None of the above"]'::jsonb,
 2, 'Because Switch C sits in series before the parallel pair, current cannot reach either branch unless C is closed. Once C is closed, the light glows as long as at least one of Switch A or Switch B is also closed.'),

('acl', 'Logic/Reasoning', 'Two identical light bulbs, Bulb A and Bulb B, are connected in series with a battery and a single switch -- meaning all three components share the same single loop. The switch is closed and both bulbs are glowing. If Bulb A suddenly burns out, breaking that part of the circuit, what happens to Bulb B?',
 '["Bulb B glows brighter than before", "Bulb B continues to glow at the same brightness", "Bulb B goes out completely", "Bulb B glows more dimly but stays on", "Bulb B is unaffected because it has its own separate path", "The switch must be opened for Bulb B to be affected"]'::jsonb,
 2, 'In a series circuit, all components share one continuous loop. A break at Bulb A interrupts the only path current can take, so Bulb B loses its current too and goes out, even though nothing is wrong with Bulb B itself.'),

('acl', 'Logic/Reasoning', 'Two identical light bulbs, Bulb A and Bulb B, are each connected directly to the same battery through their own separate wires (in parallel), with no shared switch. Both bulbs are currently glowing. If Bulb A burns out, what happens to Bulb B?',
 '["Bulb B goes out completely, since the circuit is broken", "Bulb B also burns out shortly after", "Bulb B continues to glow normally, since its path to the battery is independent", "Bulb B begins to flicker", "Bulb B glows more dimly", "Both bulbs must be replaced together"]'::jsonb,
 2, 'In a parallel circuit, each bulb has its own independent path back to the battery. Losing Bulb A only breaks its own branch -- Bulb B''s branch is untouched, so it keeps glowing normally.'),

('acl', 'Logic/Reasoning', 'A circuit has a battery and a light bulb connected by a single wire, forming a complete loop. A student cuts this wire, breaking the circuit permanently at that point (the original wire cannot be reconnected). A new Switch P is added, wired to create a second, separate path around the cut section. Which action will make the light glow?',
 '["Leaving Switch P open", "Closing Switch P", "The light cannot glow again since the original wire is cut", "Closing Switch P will only make the light flicker", "Switch P must be opened and closed repeatedly to light it", "None of the above"]'::jsonb,
 1, 'Even though the original path is permanently broken, Switch P provides an entirely separate route between the same two points. Closing it completes that alternate path, so current can flow and the light glows again.'),

('acl', 'Logic/Reasoning', 'In a circuit, Switch 1 and Switch 2 are wired in series to form one branch between the battery and the light bulb. This branch is wired in parallel with a second, separate branch containing only Switch 3. Which of the following will make the light glow?',
 '["Switch 1 open, Switch 2 open, Switch 3 open", "Switch 1 closed, Switch 2 open, Switch 3 open", "Switch 1 open, Switch 2 closed, Switch 3 open", "Switch 1 closed, Switch 2 closed, Switch 3 open", "Switch 1 open, Switch 2 open, Switch 3 closed", "Both the fourth and fifth options above will make the light glow"]'::jsonb,
 5, 'The light glows if either branch is complete. The first branch needs both Switch 1 and Switch 2 closed; the second branch just needs Switch 3 closed. Closing Switch 1 and 2 together works, and closing Switch 3 alone also works -- either satisfies the parallel connection.'),

('acl', 'Logic/Reasoning', 'A single bulb connected directly to a battery glows at a certain brightness. If a second identical bulb is added in series with the first, so both bulbs share the same single loop and the same current, what happens to the brightness of each bulb compared to the single-bulb case?',
 '["Each bulb glows brighter than the original single bulb", "Each bulb glows at the same brightness as the original single bulb", "Each bulb glows dimmer than the original single bulb", "The first bulb glows normally, but the second bulb does not light at all", "Only one of the two bulbs will glow at a time", "The brightness cannot be determined without knowing the wire length"]'::jsonb,
 2, 'Adding a second bulb in series increases the total resistance the battery has to push current through, which reduces the current flowing in the shared loop. With less current, each bulb glows more dimly than the original single bulb did.'),

('acl', 'Logic/Reasoning', 'A single bulb connected directly to a battery glows at a certain brightness. If a second identical bulb is instead added in parallel with the first -- each bulb wired directly across the same battery terminals through separate wires -- what happens to the brightness of each bulb, assuming the battery can supply enough current?',
 '["Each bulb glows brighter than before", "Each bulb glows at about the same brightness as the original single bulb", "Each bulb glows dimmer than before", "Only one bulb will glow", "Both bulbs will flicker on and off", "The bulbs must be different sizes to both glow"]'::jsonb,
 1, 'In a parallel connection, each bulb is wired directly across the full battery voltage, independent of the other bulb. Since neither bulb''s own path changed, each glows at about the same brightness as it would alone.'),

('acl', 'Logic/Reasoning', 'A security system''s siren is wired to a battery through two switches -- a Door Switch and a Window Switch -- connected in series, so the siren sounds only when current flows through both switches. Which combination of switch positions will cause the siren to sound?',
 '["Door Switch open, Window Switch open", "Door Switch closed, Window Switch open", "Door Switch open, Window Switch closed", "Door Switch closed, Window Switch closed", "Any single switch closed is enough", "The siren sounds only when both switches are open"]'::jsonb,
 3, 'Because the two switches are in series, they form a single shared path -- both must be closed for current to complete the loop. Leaving either switch open breaks the only path available, so the siren stays silent.'),

('acl', 'Logic/Reasoning', 'A doorbell is wired to a battery through two buttons, a Front Button and a Back Button, wired in parallel -- pressing either one closes that button''s own branch of the circuit. Which of the following will make the doorbell ring?',
 '["Front Button not pressed, Back Button not pressed", "Front Button pressed, Back Button not pressed", "Front Button not pressed, Back Button pressed", "Front Button pressed, Back Button pressed", "All of the above except the first option", "None of the above"]'::jsonb,
 4, 'Since the two buttons form separate parallel branches, pressing either one alone completes a path back to the battery. The doorbell only fails to ring when neither button is pressed.'),

('acl', 'Logic/Reasoning', 'A circuit has two separate branches connecting the same battery and light bulb. Branch 1 contains Switch A and Switch B in series. Branch 2 contains Switch C and Switch D in series. The two branches are wired in parallel with each other. Which of the following will make the light glow?',
 '["Switch A closed, Switch B open, Switch C closed, Switch D open", "Switch A closed, Switch B closed, Switch C open, Switch D open", "Switch A open, Switch B open, Switch C closed, Switch D closed", "Both the second and third options above will make the light glow", "Switch A closed, Switch C closed, with Switch B and Switch D both open", "None of the above"]'::jsonb,
 3, 'Each branch needs both of its own switches closed to be complete, since the switches within a branch are in series. Closing A and B completes Branch 1; closing C and D completes Branch 2. Either branch being complete is enough, since the branches are in parallel.'),

('acl', 'Logic/Reasoning', 'A circuit has one switch, Switch 1, wired in series with Bulb A only. A completely separate branch has Bulb B wired directly to the battery with no switch at all. The two branches are otherwise independent of each other. What happens when Switch 1 is opened?',
 '["Both Bulb A and Bulb B turn off", "Bulb A turns off, but Bulb B keeps glowing", "Bulb B turns off, but Bulb A keeps glowing", "Both bulbs stay lit regardless of Switch 1", "Both bulbs turn off only if Switch 1 is closed", "Neither bulb will glow under any switch position"]'::jsonb,
 1, 'Switch 1 only controls Bulb A''s branch. Bulb B''s branch has no switch and is wired independently straight to the battery, so opening Switch 1 has no effect on it -- only Bulb A goes out.'),

('acl', 'Logic/Reasoning', 'A circuit has a battery and a light bulb connected by a wire, forming a complete loop. A Switch X is added, but it is wired as a dead-end branch -- one end attached to the main wire, the other end not connected to anything else. If the main wire is intact and unbroken, will the light glow, and does Switch X''s position matter?',
 '["The light will not glow no matter what, since Switch X is broken", "The light will glow, and it depends on Switch X being closed", "The light will glow regardless of Switch X''s position, since the main loop is already complete", "The light will only glow if Switch X is closed and the main wire is also connected", "The light will flicker depending on Switch X''s position", "Not enough information is given to determine the answer"]'::jsonb,
 2, 'Current only flows through paths that form a complete loop back to the battery. Switch X dead-ends and isn''t part of any closed path, so it carries no current either way -- the light''s behavior depends entirely on the intact main loop, not on Switch X.');
