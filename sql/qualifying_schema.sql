DROP TABLE IF EXISTS "Qualifying" CASCADE;

CREATE TABLE "Qualifying" (
    "qualifyId" int PRIMARY KEY,
    "raceid" int NOT NULL,
    "driverId" int NOT NULL,
    "position" int NOT NULL
);

ALTER TABLE "Qualifying" ADD CONSTRAINT "fk_Qualifying_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "Qualifying" ADD CONSTRAINT "fk_Qualifying" FOREIGN KEY("raceid")
REFERENCES "race_db" ("raceid");