#query Subqueries in Select and From
SELECT 
    Tournament_Region,
    (SELECT COUNT(*) FROM Tournament AS t2 WHERE t2.Tournament_Region = t1.Tournament_Region) AS TotalTournaments,
    (SELECT AVG(Reward) FROM Tournament AS t3 WHERE t3.Tournament_Region = t1.Tournament_Region) AS AverageReward
FROM
    (SELECT DISTINCT Tournament_Region FROM Tournament) AS t1
ORDER BY AverageReward DESC;
