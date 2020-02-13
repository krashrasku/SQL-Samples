/*
D06: Find branded drugs by ingredient
Description
This query is designed to extract all branded drugs that have a specified ingredient. 
The query accepts an ingredient concept ID as the input and returns all branded drugs that have the ingredient.
 It should be noted that the query returns both generics that have a single ingredient 
 (i.e. the specified ingredient) and those that are combinations which include the specified ingredient. 
 The query requires the ingredient concept ID as the input. A list of these ingredient concepts can be 
 extracted by querying the CONCEPT table for concept class of ‘Ingredient’.
*/

SELECT        A.concept_id Ingredient_concept_id,
                A.concept_name Ingredient_concept_name,
                A.concept_code Ingredient_concept_code,
                A.concept_class_id Ingredient_concept_class,
                D.concept_id branded_drug_id,
                D.concept_name branded_drug_name,
                D.concept_code branded_drug_concept_code,
                D.concept_class_id branded_drug_concept_class
FROM           concept_ancestor CA,
               concept A,
               concept D
WHERE
        CA.ancestor_concept_id = 966991
AND        CA.ancestor_concept_id = A.concept_id
AND        CA.descendant_concept_id = D.concept_id
AND        D.concept_class_id = 'Branded Drug'
AND        (date('now') >= A.valid_start_date)
AND        (date('now') <= A.valid_end_date)
AND        (date('now') >= D.valid_start_date)
AND        (date('now') <= D.valid_end_date);
