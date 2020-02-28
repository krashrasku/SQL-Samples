  
/*********
PLAUSIBLE_TEMPORAL_AFTER
get number of records and the proportion to total number of eligible records with datetimes that do not occur on or after their corresponding datetimes

Parameters used in this template:
cdmDatabaseSchema = cdm_synthea_v897.dbo
cdmTableName = VISIT_OCCURRENCE
cdmFieldName = visit_start_date
plausibleTemporalAfterTableName = PERSON
plausibleTemporalAfterFieldName = BIRTH_DATETIME
**********/

SELECT num_violated_rows, 
        CASE WHEN denominator.num_rows = 0 THEN 0 
		 ELSE 1.0*num_violated_rows/denominator.num_rows 
		END  AS pct_violated_rows
FROM
(
	SELECT COUNT(violated_rows.violating_field) AS num_violated_rows
	FROM
	(
		SELECT VISIT_OCCURRENCE.visit_start_date AS violating_field, 
		 VISIT_OCCURRENCE.*
    from VISIT_OCCURRENCE
    
		join PERSON
			on VISIT_OCCURRENCE.person_id = PERSON.person_id
		
    where BIRTH_DATETIME > visit_start_date
	) violated_rows
) violated_row_count,
(
	SELECT COUNT(*) AS num_rows
	FROM VISIT_OCCURRENCE
) denominator
;
  
