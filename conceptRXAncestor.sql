/* Find ingredient Clopidogrel 75mg 1322185 as Ancestor of drug product */

SELECT a.max_levels_of_separation, 
       ancestor.*
FROM concept_ancestor a, concept ancestor
WHERE a.descendant_concept_id = 1322185 
AND a.ancestor_concept_id = ancestor.concept_id
ORDER BY max_levels_of_separation;
