/*
G08: Find ancestors for a given concept
Description
For a concept identifier entered as the input parameter, this query lists all ancestors 
in the hierarchy of the domain. Ancestors are concepts that have a relationship to the 
given concept and is defined as hierarchical in the relationship table, and any secondary,
 tertiary etc. concepts going up in the hierarchy. The resulting output provides the ancestor
 concept details and the minimum and maximum level of separation.
*/

SELECT
  c.concept_id               AS ancestor_concept_id,
  c.concept_name             AS ancestor_concept_name,
  c.concept_code             AS ancestor_concept_code,
  c.concept_class_id         AS ancestor_concept_class_id,
  c.vocabulary_id            AS vocabulary_id,
  a.min_levels_of_separation AS min_separation,
  a.max_levels_of_separation AS max_separation
FROM concept_ancestor AS a
  JOIN concept AS c 
  ON a.ancestor_concept_id = c.concept_id
WHERE 
  a.ancestor_concept_id != a.descendant_concept_id AND 
  a.descendant_concept_id = 192671 AND
  c.invalid_reason IS NULL
ORDER BY vocabulary_id, min_separation
;
