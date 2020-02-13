/*
 P02: Find a procedure from a keyword.
Description
This query enables search of procedure domain of the vocabulary by keyword.
 The query does a search of standard concepts names in the PROCEDURE domain (SNOMED-CT, ICD9,
 CPT, SNOMED Veterinary, OPCS4, CDT ICD10PCS and HCPCS procedures) and their synonyms to return 
 all related concepts.

This is a comprehensive query to find relevant terms in the vocabulary. It does not require prior
 knowledge of where in the logic of the vocabularies the entity is situated. To constrain, additional 
 clauses can be added to the query. However, it is recommended to do a filtering after the result set is produced to avoid syntactical mistakes. The query only returns concepts that are part of the Standard Vocabulary, ie. they have concept level that is not 0. If all concepts are needed, including the non-standard ones, the clause in the query restricting the concept level and concept class can be commented out.

The following is a sample run of the query to run a search of the Procedure domain for keyword 
‘Fixation of fracture’.
*/

   --- TAKES A LONG TIME!    NEED TO CHANGE FILTER 

SELECT DISTINCT
  C.concept_id            AS Entity_Concept_Id,
  C.concept_name          AS Entity_Name,
  C.concept_code          AS Entity_Code,
  'Concept'               AS Entity_Type,
  C.concept_class_id      AS Entity_concept_class_id,
  C.vocabulary_id         AS Entity_vocabulary_id
FROM concept C
LEFT JOIN concept_synonym S
ON C.concept_id = S.concept_id
WHERE C.vocabulary_id IN ('SNOMED','ICD9Proc','ICD10PCS','CPT4','CDT','HCPCS','SNOMED Veterinary','OPCS4')
      AND C.domain_id = 'Procedure'
      AND C.standard_concept = 'S'
      -- regular expression containing the input pattern
      AND LOWER(C.concept_name) LIKE LOWER('%Fixation of fracture%')
            OR LOWER(S.concept_synonym_name) LIKE LOWER('%Fixation of fracture%')
      -- Retrieve only valid concepts
      AND  date('now') >= C.valid_start_date AND date('now') <= C.valid_end_date; 
