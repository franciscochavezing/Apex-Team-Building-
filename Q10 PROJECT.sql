#query union
SELECT DISTINCT Tournament_Region AS Country
FROM Tournament
UNION
SELECT DISTINCT Team_Region AS Country
FROM Team;

