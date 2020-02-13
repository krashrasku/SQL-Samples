/*
D02: Find drug or class by keyword   (runs very slow!   Edit query )
Description
This query enables search of vocabulary entities in the drug domain by keyword. 
The query does a search of standard concepts names in the DRUG domain including the following:

	RxNorm standard drug concepts
	ETC, ATC therapeutic classes
	NDF-RT mechanism of action, physiological effect, chemical structure concepts
	Synonyms of drug concepts
	Mapped drug codes from NDC, GPI, Multum, Multilex
*/

SELECT c.concept_id Entity_Concept_Id, 
        c.concept_name Entity_Name, 
		c.concept_code Entity_Code, 
		'Concept' Entity_Type, 
		c.concept_class_id Entity_concept_class_id, 
		c.vocabulary_id Entity_vocabulary_id
FROM concept c
WHERE c.concept_class_id IS NOT NULL
AND c.vocabulary_id in ('NDFRT','RxNorm','Indication','ETC','ATC','VA Class','GCN_SEQNO')
AND LOWER(REPLACE(REPLACE(c.concept_name, ' ', ''), '-', '')) LIKE 'lipitor'
AND date('now') >= c.valid_start_date
AND date('now') <= c.valid_end_date

UNION ALL

SELECT c.concept_id Entity_Concept_Id, c.concept_name Entity_Name, c.concept_code Entity_Code, 'Mapped Code' Entity_Type,
c.concept_class_id Entity_concept_class_id, c.vocabulary_id Entity_vocabulary_id
FROM concept_relationship cr 
  JOIN concept c ON c.concept_id = cr.concept_id_1
AND cr.relationship_id = 'Maps to'
AND c.vocabulary_id IN ('NDC', 'GPI', 'Multum', 'Multilex', 'VA Product', 'MeSH', 'SPL')
AND LOWER(REPLACE(REPLACE(c.concept_name, ' ', ''), '-', '')) LIKE 'lipitor'
AND date('now') >= c.valid_start_date
AND date('now') <= c.valid_end_date

UNION ALL

SELECT c.concept_id Entity_Concept_Id, s.concept_synonym_name Entity_Name, c.concept_code Entity_Code, 'Concept Synonym' Entity_Type, c.concept_class_id Entity_concept_class_id, c.vocabulary_id Entity_vocabulary_id
FROM concept c, concept_synonym s
WHERE S.concept_id = c.concept_id
AND c.vocabulary_id in ('NDFRT','RxNorm','Indication','ETC','ATC','VA Class','GCN_SEQNO')
AND c.concept_class_id IS NOT NULL
AND LOWER(REPLACE(REPLACE(s.concept_synonym_name, ' ', ''), '-', '')) LIKE 'lipitor'
AND date('now') >= c.valid_start_date
AND date('now') <= c.valid_end_date;
