/*

D10: Find ingredient by drug class
Description
This query is designed to extract all ingredients that belong to a therapeutic class. 
The query accepts a therapeutic class concept ID as the input and returns all drugs that 
are included under that class. Therapeutic classes could be obtained using query D02 and are
 derived from one of the following:

Enhanced Therapeutic Classification (FDB ETC)
Anatomical Therapeutic Chemical classification (WHO ATC)
– NDF-RT Mechanism of Action (MoA), Concept Class = ‘Mechanism of Action’

– NDF-RT Physiologic effect (PE), Concept Class = ‘Physiologic Effect’

– NDF-RT Chemical Structure, Concept Class = ‘Chemical Structure’

VA Class
*/

SELECT  c.concept_id    ingredient_concept_id,
        c.concept_name  ingredient_concept_name,
        c.concept_class_id ingredient_concept_class,
        c.concept_code  ingredient_concept_code
 FROM   concept          c,
        concept_ancestor ca
 WHERE  ca.ancestor_concept_id = 966991
   AND  c.concept_id           = ca.descendant_concept_id
   AND  c.vocabulary_id        = 'RxNorm'
   AND  c.concept_class_id     = 'Ingredient'
   AND  (date('now') >= c.valid_start_date)
   AND  (date('now') <= c.valid_end_date);
