#aggregate query
#total amount of sponsorship received by each team
SELECT
    t.TeamID,
    t.Team_Name,
    COALESCE(SUM(s.Amount), 0) AS Total_Sponsorship_Amount
FROM
    Team t
LEFT JOIN
    Sponsorships_Team st ON t.TeamID = st.TeamID
LEFT JOIN
    Sponsor s ON st.SponsorID = s.SponsorID
GROUP BY
    t.TeamID, t.Team_Name
ORDER BY
    Total_Sponsorship_Amount DESC;
