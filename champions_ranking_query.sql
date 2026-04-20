SELECT *
FROM nba_champions_rating;

/* SHOW THE NBA CHAMPIONS TABLE*/

SELECT 
    SUM(CASE WHEN Offensive_ranking < Defensive_ranking THEN 1 ELSE 0 END) AS off_led,
    SUM(CASE WHEN Defensive_ranking < Offensive_ranking THEN 1 ELSE 0 END) AS def_led,
    SUM(CASE WHEN Defensive_ranking = Offensive_ranking THEN 1 ELSE 0 END) AS tie
FROM nba_champions_rating;

/* SHOW TABLE OF OFF AND DEF LED*/

SELECT Team, Year
FROM nba_champions_rating
WHERE Offensive_ranking < Defensive_ranking;

SELECT Team, Year
FROM nba_champions_rating
WHERE Defensive_ranking < Offensive_ranking;

SELECT Team, Year
FROM nba_champions_rating
WHERE Defensive_ranking = Offensive_ranking;

/* I want to see the average net rating of these categories to determine which team dominates the regular season
than translate to playoffs*/

SELECT ROUND(AVG(Net_rating), 2) as avg_net_off_led
FROM nba_champions_rating
WHERE Offensive_ranking < Defensive_ranking;

SELECT ROUND(AVG(Net_rating), 2) as avg_net_def_led
FROM nba_champions_rating
WHERE  Defensive_ranking < Offensive_ranking;

SELECT ROUND(AVG(Net_rating), 2) as avg_net_def_led
FROM nba_champions_rating
WHERE  Defensive_ranking = Offensive_ranking;

/* Is there even a team that won without being top 10 in both? */
SELECT Team, Year
FROM nba_champions_rating
WHERE Offensive_ranking > 10 AND Defensive_ranking > 10;



SELECT 
	SUM(CASE WHEN Offensive_ranking > 10 THEN 1 ELSE 0 END) AS offense_outside_top10,
    SUM(CASE WHEN Defensive_ranking > 10 THEN 1 ELSE 0 END) AS defense_outside_top10
FROM nba_champions_rating;

SELECT Team, Year
FROM nba_champions_rating
WHERE Offensive_ranking > 10;

SELECT Team, Year
FROM nba_champions_rating
WHERE Defensive_ranking > 10;

/* SHOW TABLE OF TEAMS THAT WON OUTSIDE OF TOP 10*/


/* Gap of each team from their strong side to their weak side */
SELECT 
    ROUND(AVG(CASE 
        WHEN Offensive_ranking < Defensive_ranking 
        THEN Defensive_ranking - Offensive_ranking 
    END), 2) AS avg_off_gap,

    ROUND(AVG(CASE 
        WHEN Defensive_ranking < Offensive_ranking 
        THEN Offensive_ranking - Defensive_ranking 
    END), 2) AS avg_def_gap

FROM nba_champions_rating;
