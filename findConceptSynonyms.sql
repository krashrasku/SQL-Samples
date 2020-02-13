/*
 G04: Find synonyms for a given concept
Description
This query extracts all synonyms in the vocabulary for a given Concept ID.
*/

SELECT
  c.concept_id,
  s.concept_synonym_name
FROM concept AS c
  JOIN concept_synonym AS s ON c.concept_id = s.concept_id
WHERE c.concept_id = 192671
;
