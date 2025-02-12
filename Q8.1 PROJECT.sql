SELECT Tournament_Name,reward
FROM Tournament
WHERE TournamentID = (
    SELECT TournamentID
    FROM Enrollment
    GROUP BY TournamentID
    HAVING COUNT(*) <= ALL (
        SELECT COUNT(*)
        FROM Enrollment
        GROUP BY TournamentID
    )
);
