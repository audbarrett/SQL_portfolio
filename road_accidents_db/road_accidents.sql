-- find row with missing info
SELECT *
FROM road_accidents
WHERE road_crashes = 0;

-- note columns with missing data: road_crashes, serious_injury, slight_injury
-- note year = 2017
-- note road_deaths = 6740

-- delete rows
DELETE FROM accidents_by_state
WHERE year != 2017;

SELECT *
FROM accidents_by_state;

-- calculate missing data AND rename columns
SELECT 
	SUM(road_crashes) AS road_crashes,
	SUM(serious_injury) AS serious_injury,
	SUM(slight_injury) AS slight_injury,
	SUM(road_deaths) AS road_deaths
FROM accidents_by_state;

-- road_crashes: 533875
-- serious_injury: 3310
-- slight injury: 6539
-- road_deaths: 6740

-- update missing data in road_accidents table
UPDATE road_accidents
SET 
	road_crashes = 533875,
	serious_injury = 3310,
	slight_injury = 6539
WHERE Year = 2017;

SELECT * FROM road_accidents;


