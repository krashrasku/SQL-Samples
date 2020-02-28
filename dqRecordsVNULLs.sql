/*********
MEASURE_VALUE_COMPLETENESS
Computing number of null values and the proportion to total records per field

Parameters used in this template:
cdmDatabaseSchema = cdm_synthea_v897.dbo
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = provider_id
**********/


SELECT num_violated_rows, 
       CASE WHEN denominator.num_rows = 0 THEN 0 ELSE 1.0*num_violated_rows/denominator.num_rows 
	     END  AS pct_violated_rows
FROM
(
	SELECT violated_rows.violating_field AS num_violated_rows
	FROM
	(
		SELECT V.provider_id AS violating_field, 
		        V.* 
		FROM VISIT_OCCURRENCE V
		WHERE V.provider_id IS NULL
	) violated_rows
) violated_row_count,
( 
	SELECT COUNT(*) AS num_rows
	FROM VISIT_OCCURRENCE
) denominator
;
