/*
C01: Find condition by concept ID
Description
Find condition by condition ID is the lookup for obtaining condition or disease concept details 
associated with a concept identifier. This query is a tool for quick reference for the name, class, 
level and source vocabulary details associated with a concept identifier, either SNOMED-CT clinical 
finding or MedDRA. This query is equivalent to G01, but if the concept is not in the condition domain
 the query still returns the concept details with the Is_Disease_Concept_Flag field set to ‘No’.

The following is a sample run of the query to run a search for specific disease concept ID.
*/

SELECT
  c.concept_id       AS condition_concept_id,
  c.concept_name     AS condition_concept_name,
  c.concept_code     AS condition_concept_code,
  c.concept_class_id AS condition_concept_class,
  c.vocabulary_id    AS condition_concept_vocab_id,
  CASE c.vocabulary_id
  WHEN 'SNOMED'
    THEN CASE lower(c.concept_class_id)
         WHEN 'clinical finding'
           THEN 'Yes'
         ELSE 'No' END
  WHEN 'MedDRA'
    THEN 'Yes'
  ELSE 'No'
  END                AS is_disease_concept_flag
FROM concept AS c
WHERE
  c.concept_id = 192671 AND 
  c.invalid_reason IS NULL
;
 
