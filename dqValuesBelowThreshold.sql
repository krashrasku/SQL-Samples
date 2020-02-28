/*********
PLAUSIBLE_VALUE_LOW
get number of records and the proportion to total number of eligible records that fall below this threshold

Parameters used in this template:
cdmDatabaseSchema = cdm_synthea_v897.dbo
cdmTableName = OBSERVATION
cdmFieldName = observation_datetime
plausibleValueLow = '1950-01-01'
**********/

SELECT num_violated_rows, CASE WHEN denominator.num_rows = 0 THEN 0 ELSE 1.0*num_violated_rows/denominator.num_rows END  AS pct_violated_rows
FROM
(
	SELECT COUNT(violated_rows.violating_field) AS num_violated_rows
	FROM
	(
		SELECT OBSERVATION.observation_datetime AS violating_field, OBSERVATION.*
		from OBSERVATION
    where observation_datetime < '1940-01-01'
	) violated_rows
) violated_row_count,
(
	SELECT COUNT(*) AS num_rows
	FROM OBSERVATION
	where observation_datetime is not null
) denominator
;
