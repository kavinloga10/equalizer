-- Equalizer schema v12: OPTIONAL cleanup after removing TJHSST prep from the
-- app. The app no longer loads or writes 'tj'-subject rows (see loadQuestions
-- in index.html, which now fetches only subject = 'acl'), so any existing
-- tj-tagged rows are simply inert dead data sitting in the table -- this
-- migration is not required for the app to work correctly.
--
-- Run this only if you want to actually delete that old TJ question content
-- from the database. This is destructive and cannot be undone.
delete from public.questions where subject = 'tj';
