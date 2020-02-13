/*	   
D01: Find drug concept by concept ID
Description
This is the lookup for obtaining drug concept details associated with a concept identifier. 
This query is intended as a tool for quick reference for the name, class, level and source 
vocabulary details associated with a concept identifier. This query is equivalent to G01, 
but if the concept is not in the drug domain the query still returns the concept details
 with the Is_Drug_Concept_Flag field set to ‘No’.
*/
	
	  SELECT 
    c.concept_id AS drug_concept_id,
    c.concept_name AS drug_concept_name,
    c.concept_code AS drug_concept_code,
    c.concept_class_id AS drug_concept_class,
    c.standard_concept AS drug_standard_concept,
    c.vocabulary_id AS drug_concept_vocab_id,
    (CASE c.domain_id WHEN 'Drug' THEN 'Yes' ELSE 'No' END) AS is_drug_concept_flag
FROM concept AS c
WHERE date('now') >= c.valid_start_date AND date('now') <= c.valid_end_date 
  AND c.concept_id = 1545999
;
