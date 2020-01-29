SELECT
COUNT(DISTINCT person_id) AS persons_with_condition_count
FROM condition_occurrence
WHERE condition_concept_id = 31967
AND person_id IS NOT NULL;
