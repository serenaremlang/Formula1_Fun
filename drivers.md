# Driver PostgreSQL Schema

![](images/schema_drivers.png)

# Notes on Import and Data Cleansing processes

<p>Importing the data from the csv files into PostgreSQL was done to identify and aknowledge null values.  This was addressed in the drivers_import_data.sql file.</p>

<p>This also allowed for the data to be converted and stored in more usable data types for aggregation etc. (i.e. converting to ints and floats where applicable)</p>

<p>The data was then pulled into pandas using sql alchemey to perform analysis via orm for joining and aggregating the data to answer the question:
<ul>
<li>Who are the top 3 drivers in F1 history based on number of wins?</li>
</ul>
</p>

<p>Once the data for this was found, it was flatened and stored in mongo along with a url to the driver's profile image from wikipedia</p>

<p>The data stored in mongo was then rendered out using flask with an html template to show the resulting data.
