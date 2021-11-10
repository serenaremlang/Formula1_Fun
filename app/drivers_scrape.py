import pandas as pd
from bs4 import BeautifulSoup as bs
from splinter import Browser
from webdriver_manager.chrome import ChromeDriverManager

# Postgres db setup
from config import usr
from config import pwd
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

engine = create_engine(f'postgresql://{usr}:{pwd}@localhost:5432/F1')
connection = engine.connect()

def scrape():
    drivers = []

    # Setup sqlalchemey
    Base = automap_base()
    Base.prepare(engine, reflect=True)
    Base.classes.keys()

    Drivers = Base.classes.Drivers
    DriverStandings = Base.classes.DriverStandings

    session = Session(engine)

    driverWinstotals = session.query(DriverStandings.driverId, func.sum(DriverStandings.wins).label("TotalWins"))\
        .group_by(DriverStandings.driverId).subquery()

    driverWins = session.query(Drivers.driverId, (Drivers.forename + ' ' + Drivers.surname).label("DriverName"), driverWinstotals.c.TotalWins, Drivers.url)\
        .join(driverWinstotals, Drivers.driverId == driverWinstotals.c.driverId)\
        .order_by(driverWinstotals.c.TotalWins.desc()).limit(3)

    session.close()

    # df = pd.DataFrame(driverWins, columns=['Driver ID', 'Driver Name', 'Total Wins', 'URL'])
    # df.set_index('Driver ID', inplace=True)
    # df.sort_values(by='Total Wins', ascending=False).head(3)

    # Set up Splinter
    executable_path = {'executable_path': ChromeDriverManager().install()}
    browser = Browser('chrome', **executable_path, headless=False)

    # ************* Wikipedia Image **************

    # loop through each driver (id, name, wins, url) 
    for driver in driverWins: 
        # Load the page
        browser.visit(driver[3])

        # Scrape into Soup
        html = browser.html
        soup = bs(html, 'html.parser')

        # find the container for the profile image
        container = soup.find('td', class_='infobox-image')

        # get the only image tag within
        img_url = container.find('img')['src']  
        
        # Save both the image url string for the full resolution hemisphere image, and the Hemisphere title containing the hemisphere name. Use a Python dictionary to store the data using the keys img_url and title.
        driver_dict = {
            "driver_id":driver[0], 
            "driver_name":driver[1],
            "driver_wins":driver[2],
            "img_url":img_url
        }

        # Append the dictionary to a list. This list will contain one dictionary for each driver.
        drivers.append(driver_dict)        

    # Close the browsers after scraping   
    browser.quit()

    # Return results
    return drivers
