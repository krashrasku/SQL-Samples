 /*
 G09: Find descendants for a given concept
Description
For a concept identifier entered as the input parameter, this query lists all descendants in the
 hierarchy of the domain. Descendant are concepts have a relationship to the given concept that is
 defined as hierarchical in the relationship table, and any secondary, tertiary etc. concepts going
 down in the hierarchy. The resulting output provides the descendant concept details and the minimum 
 and maximum level of separation.
*/

SELECT
  c.concept_id               AS descendant_concept_id,
  c.concept_name             AS descendant_concept_name,
  c.concept_code             AS descendant_concept_code,
  c.concept_class_id         AS descendant_concept_class_id,
  c.vocabulary_id            AS vocabulary_id,
  a.min_levels_of_separation AS min_separation,
  a.max_levels_of_separation AS max_separation
FROM concept_ancestor AS a
  JOIN concept AS c 
     ON a.descendant_concept_id = c.concept_id
WHERE 
  a.ancestor_concept_id != a.descendant_concept_id AND 
  a.ancestor_concept_id = 192671 AND 
  c.invalid_reason IS NULL
ORDER BY vocabulary_id, min_separation
;
