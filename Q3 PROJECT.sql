# inner join
# countries of all players in each team
SELECT DISTINCT t.TeamID, t.Team_Name, p.Country
FROM Team t
INNER JOIN Squad s ON t.TeamID = s.TeamID
INNER JOIN Player p ON s.SquadID = p.SquadID;
