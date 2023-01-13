-- Find the first owner that has a last name containing the lowercase letter "r"
-- Your code here
SELECT * FROM owners WHERE last_name LIKE '%r%' LIMIT 1;

-- Find the name and birth year of all the cats ordered by descending birth year
-- Your code here
SELECT name, birth_year FROM cats ORDER BY birth_year DESC;

-- Find the name of the cats who have an owner whose first name begins with an "H"
-- Your code here
SELECT cats.name FROM cats
JOIN cat_owners ON cat_owners.cat_id = cats.id
JOIN owners ON cat_owners.owner_id = owners.id
WHERE owners.first_name LIKE 'H%';

-- Find the first and last names of the owner whose cats are born after the year 2015
-- Your code here
-- SELECT first_name, last_name FROM owners
-- JOIN cat_owners ON cat_owners.owner_id = owners.id
-- JOIN cats ON cat_owners.cat_id = cats.id
-- WHERE cats.birth_year > 2015
-- GROUP BY owner_id


-- Find names of the cats whose owners are both George Beatty and Melynda Abshire, or just George Beatty, or just Melynda Abshire
-- Your code here
SELECT cats.name FROM cats
JOIN cat_owners ON cat_owners.cat_id = cats.id
JOIN owners ON cat_owners.owner_id = owners.id
WHERE (owners.first_name = 'George' AND owners.last_name = 'Beatty')
  OR (owners.first_name = 'Melynda' AND owners.last_name = 'Abshire')
GROUP BY cats.id;
