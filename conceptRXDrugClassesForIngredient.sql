/*
D08: Find drug classes for a drug or ingredient
Description
This query is designed to return the therapeutic classes that associated with a drug. 
The query accepts a standard drug concept ID (e.g. as identified from query G03) as the input. 
The drug concept can be a clinical or branded drug or pack (concept_level=1), or an ingredient (concept_level=2).
 The query returns one or more therapeutic classes associated with the drug based on the following classifications.).
 
Enhanced Therapeutic Classification (ETC)
Anatomical Therapeutic Chemical classification (ATC)
NDF-RT Mechanism of Action (MoA)
NDF-RT Physiologic effect
NDF-RT Chemical structure
VA Class
By default, the query returns therapeutic classes based on all the classification systems listed above. 
Additional clauses can be added to restrict the query to a single classification system.
*/

SELECT
 c1.concept_id                 Class_Concept_Id,
 c1.concept_name               Class_Name,
 c1.concept_code               Class_Code,
 c1.concept_class_id              Classification,
 c1.vocabulary_id              Class_vocabulary_id,
 v1.vocabulary_name            Class_vocabulary_name,
 ca.min_levels_of_separation  Levels_of_Separation
FROM concept_ancestor       ca,
     concept                c1,
      vocabulary            v1
WHERE
ca.ancestor_concept_id = c1.concept_id
AND    c1.vocabulary_id IN ('NDFRT', 'ETC', 'ATC', 'VA Class')
AND    c1.concept_class_id IN ('ATC','VA Class','Mechanism of Action','Chemical Structure','ETC','Physiologic Effect')
AND    c1.vocabulary_id = v1.vocabulary_id
AND    ca.descendant_concept_id = 1545999
AND    (date('now') >= c1.valid_start_date) AND (date('now') <= c1.valid_end_date);
