-- ** Ensure the account postgres is running as an account that has read\execute permissions for the location these files reside in
-- ** Updated to convert \N to null on import as these csv files had this in many fields

copy public."Status" ("statusId", "status") FROM 'C:\Users\Jon\Documents\BOOTCAMP\Formula_1_Fun\resources\data\status.csv' DELIMITER ',' CSV HEADER QUOTE '"' ESCAPE '''' null '\N';

copy public."Drivers" ("driverId", "driverRef", "number", "code", "forename", "surname", "dob", "nationality", "url") FROM 'C:\Users\Jon\Documents\BOOTCAMP\Formula_1_Fun\resources\data\drivers.csv' DELIMITER ',' CSV HEADER QUOTE '"' ESCAPE '''' null '\N';

copy public."DriverStandings" ("driverStandingsId", "raceId", "driverId", "points", "position", "positionText", "wins") FROM 'C:\Users\Jon\Documents\BOOTCAMP\Formula_1_Fun\resources\data\driver_standings.csv' DELIMITER ',' CSV HEADER QUOTE '"' ESCAPE '''' null '\N';

copy public."Results" ("resultId", "raceId", "driverId", "constructorId", "number", "grid", "position", "positionText", "positionOrder", "points", "laps", "time", "milliseconds", "fastestLap", "rank", "fastestLapTime", "fastestLapSpeed", "statusId") FROM 'C:\Users\Jon\Documents\BOOTCAMP\Formula_1_Fun\resources\data\results.csv' DELIMITER ',' CSV HEADER QUOTE '"' ESCAPE '''' null '\N';