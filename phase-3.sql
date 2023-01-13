-- -- Find Hermione's cats
-- -- Your code here

-- -- -- (Write a query to find all the cats' names for the owner with the first name of "Hermione". You must do this in one query. If you have trouble doing it in one query, try doing it in multiple and then refactor to just one query.)

-- SELECT cats.name
-- FROM cats
-- JOIN cat_owners ON cat_owners.cat_id = cats.id
-- JOIN owners ON cat_owners.owner_id = owners.id
-- WHERE owners.first_name = 'Hermione';

-- (REFACTOR⬇️⬇️⬇️⬇️⬇️)----------------------------------------------------

SELECT cats.name
FROM cats
JOIN cat_owners ON cat_owners.cat_id = cats.id
WHERE cat_owners.owner_id = (SELECT id FROM owners WHERE first_name = 'Hermione');




-- -- Find All the Toys for Hermione's cats
-- -- Your code here

-- -- -- (Write a query to find all toys' names for all the cats with an owner with the first name of "Hermione". You must do this in one query. If you have trouble doing it in one query, try doing it in multiple and then refactor to just one query.)
SELECT toys.name
FROM toys
JOIN cats ON toys.cat_id = cats.id
JOIN cat_owners ON cat_owners.cat_id = cats.id
JOIN owners ON cat_owners.owner_id = owners.id
WHERE owners.first_name = 'Hermione';

-- (REFACTOR⬇️⬇️⬇️⬇️⬇️)---------------------------------------------------

SELECT toys.name
FROM toys
WHERE cat_id IN (SELECT cat_id FROM cat_owners WHERE owner_id = (SELECT id FROM owners WHERE first_name = 'Hermione'));
