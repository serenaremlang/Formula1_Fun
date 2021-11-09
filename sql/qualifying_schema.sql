DROP TABLE IF EXISTS "Qualifying" CASCADE;

CREATE TABLE "Qualifying" (
    "qualifyId" int NOT NULL,
    "raceId" int NOT NULL,
    "driverId" int NOT NULL,
    "position" int NOT NULL,
    CONSTRAINT "pk_Qualifying" PRIMARY KEY (
        "qualifyingId"
        )

);

ALTER TABLE "Qualifying" ADD CONSTRAINT "fk_Qualifying_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "Qualifying" ADD CONSTRAINT "fk_Qualifying" FOREIGN KEY("raceId")
REFERENCES "race_db" ("raceId");