/*
 G02: Find a concept by code from a source vocabulary
This query obtains the concept details associated with a concept code, such as name, class, 
level and source vocabulary.

Only concepts from the Standard Vocabularies can be searched using this query. If you want to
 translate codes from other Source Vocabularies to Standard Vocabularies use G06 query.

The following is a sample run of the query to extract details for concept code of ‘74474003’ 
from concept vocabulary ID of ‘SNOMED’. Note that in contrast to concept ID the concept
 codes are not unique across different vocabularies. If you don’t specify the vocabulary, you might
 get results for the same code in different vocabularies.
 */

    
SELECT
  c.concept_id,
  c.concept_name,
  c.concept_code,
  c.concept_class_id,
  c.vocabulary_id
FROM concept AS c
WHERE 
  c.concept_code = '74474003' AND
  c.vocabulary_id = 'SNOMED' AND
  c.invalid_reason IS NULL
;
