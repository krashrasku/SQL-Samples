/*
Description: This query is used to count the persons with the top 5 conditions
(condition_concept_id). 
*/

SELECT ce.condition_concept_id, c.concept_name, COUNT(DISTINCT person_id) AS num_people
FROM condition_era ce
JOIN concept c
ON c.concept_id = ce.condition_concept_id
WHERE ce.condition_concept_id
IN ( 256723, 372906, 440377, 441202, 435371 )
GROUP BY ce.condition_concept_id, c.concept_name
ORDER BY num_people DESC;
