-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GJdfE8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS "Status" CASCADE;
DROP TABLE IF EXISTS "Drivers" CASCADE;
DROP TABLE IF EXISTS "DriverStandings" CASCADE;
DROP TABLE IF EXISTS "Results" CASCADE;

CREATE TABLE "Status" (
    "statusId" int   NOT NULL,
    "status" varchar   NOT NULL,
    CONSTRAINT "pk_Status" PRIMARY KEY (
        "statusId"
     )
);

CREATE TABLE "Drivers" (
    "driverId" int   NOT NULL,
    "driverRef" varchar   NOT NULL,
    "number" int   NULL,
    "code" char(3)   NULL,
    "forename" varchar   NOT NULL,
    "surname" varchar   NOT NULL,
    "dob" date   NOT NULL,
    "nationality" varchar   NOT NULL,
    "url" varchar   NOT NULL,
    CONSTRAINT "pk_Drivers" PRIMARY KEY (
        "driverId"
     )
);

CREATE TABLE "DriverStandings" (
    "driverStandingsId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "points" float   NOT NULL,
    "position" int   NOT NULL,
    "positionText" varchar NOT NULL,
    "wins" int   NOT NULL,
    CONSTRAINT "pk_DriverStandings" PRIMARY KEY (
        "driverStandingsId"
     )
);

CREATE TABLE "Results" (
    "resultId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "number" int  NULL,
    "grid" int   NOT NULL,
    "position" int   NULL,
    "positionText" varchar   NOT NULL,
    "positionOrder" int   NOT NULL,
    "points" float   NOT NULL,
    "laps" int   NOT NULL,
    "time" varchar   NULL,
    "milliseconds" int   NULL,
    "fastestLap" int   NULL,
    "rank" int   NULL,
    "fastestLapTime" varchar   NULL,
    "fastestLapSpeed" varchar   NULL,
    "statusId" int   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "resultId"
     )
);

ALTER TABLE "DriverStandings" ADD CONSTRAINT "fk_DriverStandings_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_statusId" FOREIGN KEY("statusId")
REFERENCES "Status" ("statusId");

