SELECT
month_of_birth,
day_of_birth,
count(*) AS num_persons
FROM person
GROUP BY month_of_birth, day_of_birth
ORDER BY month_of_birth, day_of_birth;
