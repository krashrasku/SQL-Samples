/* Check Descendants (other drug products containing Warfarin 1310149 or Clopidogrel 1322185) */
 
 SELECT max_levels_of_separation, descendant.*
FROM concept_ancestor a, concept descendant
WHERE (a.ancestor_concept_id = 1310149 
OR a.ancestor_concept_id = 1322185) 
AND a.descendant_concept_id = descendant.concept_id
ORDER BY max_levels_of_separation;
