![](images/hdr.jpg)

# Formula1_Fun
For this project, we were intersted in answering the following questions:

1) Who are the top 3 drivers for all time wins in recorded F1 history??
2) What is the frequency of which any circuit appeared in the history of formula 1 and which circuit has been featured the most across 1950 to 2021 formula 1 seasons.
3) Is there a significant difference between a driver's qualifying scores and race scores?

In order to answer these questions we required the following data:
- F1 drivers over the years
- A driver's rankings for each race
- A driver's ranking in a qualifying race
- All the races in each season
- The results of every race
- Circuits and which circuits were included in which season from 1950 to 2021


## Extract
While searching for the best way to extract this information (As it is contained on Wikipedia and to a certain extent on the official F1 page) we found a Kaggle data set with a number of .csv files containing way more information than needed.

We were able to directly download all the .csv files from the kaggle (hyperlink dis).
- link to raw csvs

We also scrapped Wikepida to pull a picture of the drivers.


## Transform
For our first question, Jon imported the driver data into postgresql and cleansed it on the import process by:
 - dealing with erroneous data and converting those values to null
 - converting the relevant data to the appropriate data types (ints, text, etc)
 - link to drivers_import_data.sql file.

Ben - what did you do?

Serena imported the qualifying (link) .csv into a jupyter notebook and set it up as a pandas dataframe. Using Pandas she cleaned the data. She also set up blank tables with the approparite columns to keep the data needed and set the data types, primary keys and foreing keys to join with the other tables made by Jon and Ben in her Postgres database to hold the dataframes (link to schema).

## Load
Jon - drivers_import_data.sql

Ben using SQL Alchemy loaded into tables of his db -link to file

Serena using SQL Alchemy loaded into tables of db F1 - link to file

## Analysis
 In order to answer our first question, Jon then loaded into a jupyter notebook (link). The data was then pulled into pandas to perform analysis via orm for joining and aggregating the data to answer the question:
- Who are the top 3 drivers in F1 history based on number of wins?</li>

 Ben import graph

 Serena - show solution of stats
 
 ## Bonus
 the code was then converted into a python app (linke to code for app) that read the data from our newly minted Postgres database joined with the wikepieda images and flattened and stored in mongo (mongo data)  where it was then rendered back out (link to page)


## Data:
- https://www.kaggle.com/sveneschlbeck/formula-1-ergast-developer-api-data
  - Contains information about: Drivers, races,
- Wikepedia (to be scraped and formatted with beautifulsoup)

## Database:
PostgresSQL



## Team Members:
<ul style="list-style:none">
<li>Serena Remtulla-Langlois</li>
<li>Ben Smith</li>
<li>Jon Wood</li>
</ul>
