SELECT
AVG(
strftime('%d', observation_period_start_date) -
strftime('%d', observation_period_end_date) / 365.25) AS NUM_YEARS

FROM observation_period;
