/*
G05: Translate a code from a source to a standard vocabulary.
Description
This query enables search of all Standard Vocabulary concepts that are mapped to a code
 from a specified source vocabulary. It will return all possible concepts that are mapped
 to it, as well as the target vocabulary. The source code could be obtained using queries
 G02 or G03. Note that to unambiguously identify a source code, the vocabulary id has to 
 be provided, as source codes are not unique identifiers across different vocabularies.
 */

   -- runs way too slooooooooooooooow!
 
SELECT DISTINCT
  c1.domain_id        AS source_domain_id,
  c2.concept_id       AS concept_id,
  c2.concept_name     AS concept_name,
  c2.concept_code     AS concept_code,
  c2.concept_class_id AS concept_class_id,
  c2.vocabulary_id    AS concept_vocabulary_id,
  c2.domain_id        AS concept_domain_id
FROM concept_relationship AS cr
  JOIN concept AS c1 ON c1.concept_id = cr.concept_id_1
  JOIN concept AS c2 ON c2.concept_id = cr.concept_id_2
WHERE
  cr.relationship_id = 'Maps to' AND
  c1.concept_code IN ('070.0') AND
  c1.vocabulary_id = 'ICD9CM' AND
  cr.invalid_reason IS NULL
;
