/*
D04: Find drugs by ingredient
Description
This query is designed to extract all drugs that contain a specified ingredient. 
The query accepts an ingredient concept ID as the input and returns all drugs that have the ingredient. 
It should be noted that the query returns both generics that have a single ingredient
 (i.e. the specified ingredient) and those that are combinations which include the specified ingredient.
 The query requires the ingredient concept ID as the input. A list of these ingredient concepts can be
 extracted by querying the concept table for concept class of ‘Ingredient’, e.g. using query D02.
*/

SELECT
        A.concept_id Ingredient_concept_id,
        A.concept_Name Ingredient_name,
        A.concept_Code Ingredient_concept_code,
        A.concept_Class_id Ingredient_concept_class,
        D.concept_id Drug_concept_id,
        D.concept_Name Drug_name,
        D.concept_Code Drug_concept_code,
        D.concept_Class_id Drug_concept_class
FROM
        concept_ancestor CA,
        concept A,
        concept D
WHERE
        CA.ancestor_concept_id = A.concept_id
        AND CA.descendant_concept_id = D.concept_id
        AND date('now') >= A.valid_start_date
        AND date('now') <= A.valid_end_date
        AND date('now') >= D.valid_start_date
        AND date('now') <= D.valid_end_date
        AND CA.ancestor_concept_id = 966991;
