from flask import Flask, render_template, redirect
from flask_pymongo import PyMongo
import drivers_scrape

# Flask instance
app = Flask(__name__)

# Mongo connection with pyMongo
app.config["MONGO_URI"] = "mongodb://localhost:27017/F1_db"
mongo = PyMongo(app)

# Home route to render template
@app.route("/")
def home():   

    # Find the one record of data from mongo
    F1_Drivers_Data = list(mongo.db.F1_Drivers.find())   
    print(F1_Drivers_Data)

    # Return templated data
    return render_template("index.html", data=F1_Drivers_Data)


# Route for scraping
@app.route("/scrape")
def scrape():

    # ref to mongo 
    F1_Drivers_Collection = mongo.db.F1_Drivers

    # drop the collection to ensure no duplicates
    F1_Drivers_Collection.drop()

    # call scrape function
    F1_Drivers_Data = drivers_scrape.scrape()   

    # Update the Mongo db
    F1_Drivers_Collection.insert_many(F1_Drivers_Data)
    
    # Redirect back home
    return redirect("/", code=302)


if __name__ == "__main__":
    app.run(debug=True)
