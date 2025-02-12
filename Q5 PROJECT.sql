#correlated query
SELECT WeaponID ,Type_
FROM Equipment AS e
WHERE WeaponID = (
    SELECT WeaponID
    FROM Player AS p
    JOIN Metrics AS m ON p.PlayerID = m.PlayerID
    WHERE m.Headshot = (
        SELECT MAX(Headshot)
        FROM Metrics
    )
);

