/*********
FIELD_CDM_DATATYPE

At a minimum, for each field that is supposed to be an integer, verify it is an integer

Parameters used in this template:
cdmDatabaseSchema = cdm_synthea_v897.dbo
cdmTableName = PERSON
cdmFieldName = provider_id
**********/


SELECT num_violated_rows, 
CASE WHEN denominator.num_rows = 0 THEN 0 ELSE 1.0*num_violated_rows/denominator.num_rows END  
AS pct_violated_rows
FROM
(
	SELECT COUNT(violated_rows.violating_field) AS num_violated_rows
	FROM
	(
		SELECT P.provider_id AS violating_field, 
		       P.* 
		  FROM  PERSON P
		 WHERE provider_id  = 0
		 
		 
	) violated_rows
) violated_row_count,
( 
	SELECT COUNT(*) AS num_rows
	FROM PERSON
) denominator
;
