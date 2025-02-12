#query <= ALL
SELECT Tournament_Name, EnrolledSquadsCount, reward
FROM (
    SELECT t.TournamentID, t.Tournament_Name, COUNT(*) AS EnrolledSquadsCount, t.reward
    FROM Tournament AS t
    JOIN Enrollment AS e ON t.TournamentID = e.TournamentID
    GROUP BY t.TournamentID, t.Tournament_Name
) AS TournamentEnrollments
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
