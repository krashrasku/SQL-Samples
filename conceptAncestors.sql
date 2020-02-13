/* Ancestors of A Fib (313217) */

SELECT max_levels_of_separation, concept.*
FROM concept_ancestor
JOIN concept ON ancestor_concept_id = concept_id
WHERE descendant_concept_id = 313217 
ORDER BY max_levels_of_separation
