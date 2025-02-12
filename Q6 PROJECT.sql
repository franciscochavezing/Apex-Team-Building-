# Not Exist
SELECT SquadID,PlayerID, Player_Name, Age
FROM Player AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM Play AS pl
    WHERE p.SquadID = pl.SquadID
);
