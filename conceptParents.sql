/*
 
 
G10: Find parents for a given concept
This query accepts a concept ID as the input and returns all concepts that are its immediate
 parents of that concept. Parents are concepts that have a hierarchical relationship to the 
 given concepts. Hierarchical relationships are defined in the relationship table. The query 
 returns only the immediate parent concepts that are directly linked to the input concept and 
 not all ancestors.
*/

SELECT
  a.concept_id       AS parent_concept_id,
  a.concept_name     AS parent_concept_name,
  a.concept_code     AS parent_concept_code,
  a.concept_class_id AS parent_concept_class_id,
  a.vocabulary_id    AS parent_concept_vocab_id
FROM concept_ancestor ca
  JOIN concept a 
     ON ca.ancestor_concept_id = a.concept_id
  JOIN concept d 
     ON ca.descendant_concept_id = d.concept_id
WHERE 
  ca.min_levels_of_separation = 1 AND
  ca.descendant_concept_id = 192671 AND
  a.invalid_reason IS NULL
;
 
