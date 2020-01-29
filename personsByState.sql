SELECT
state AS state_abbr,
COUNT(*) AS num_persons
FROM person
LEFT JOIN location
ON person.location_id = location.location_id
GROUP BY state
ORDER BY state
