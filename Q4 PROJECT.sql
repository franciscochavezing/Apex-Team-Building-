#
SELECT Name
FROM Legend
WHERE LegendID = (
    SELECT LegendID
    FROM Player
    WHERE PlayerID IN (
        SELECT PlayerID
        FROM Metrics
        WHERE Win > 90
    )
    GROUP BY LegendID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
