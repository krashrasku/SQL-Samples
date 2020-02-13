 /*

G11: Find children for a given concept
Description
This query lists all standard vocabulary concepts that are child concepts of a given concept entered
 as input. The query accepts a concept ID as the input and returns all concepts that are its immediate 
 child concepts.

The query returns only the immediate child concepts that are directly linked to the input concept and not 
all descendants.
*/

SELECT
  d.concept_id       AS child_concept_id,
  d.concept_name     AS child_concept_name,
  d.concept_code     AS child_concept_code,
  d.concept_class_id AS child_concept_class_id,
  d.vocabulary_id    AS child_concept_vocab_id
FROM concept_ancestor AS ca
  JOIN concept AS d ON ca.descendant_concept_id = d.concept_id
WHERE
  ca.min_levels_of_separation = 1 AND
  ca.ancestor_concept_id = 192671 AND
  d.invalid_reason IS NULL
;
