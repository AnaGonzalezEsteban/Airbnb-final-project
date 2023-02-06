# The key to the success of a host on airbnb


## Project object

The purpose of this project is to analyze which features an airbnb accommodation must have to be one of the most rented in Madrid.


## Project software

The tools used to carry out this project are the following:

* [Draw.io](https://app.diagrams.net/) ~> To model the database by constructing the Entity-Relationship Diagram
* [PostgreeSQL](https://www.postgresql.org/) ~> As database engine
* [DBeaver](https://dbeaver.io/) ~> A generic client to access all kinds of databases, in this case postgreSQL
* [Python] ~>
* [RStudio] ~>
* [Tableau]
* [Git] ~> To share this project


## Project methodology

* First of all, an initial exploration and cleaning of the data provided in the following dataset will be done: [airbnb-listings.csv].

* Next, a statistical study will be done in order to normalize data, detect outliers and ensure the quality of the data.

* A dashboard will be created to visualize the relevant kpis and show the conclusions to respond the topic that we are evaluating

* The next step is to code a linear regression algorithm will in order to predict the price of a
property based on the most influential characteristics to the success of the accommodation

* Finally, a conclusion to this study will be shown


## Initial exploration and cleansing of data

After reading the data and loading necessary libraries, we created a function that tells us how many repeated values are there in each column of the dataframe in order to assess the quality of the data. 

We also assigned the correct class to each column by using as.Date to interpret the date columns.

Then we checked that all the listings are uniquely identified by their ID and Geolocation data, so we painted these points on the map and get this image:

![image text](https://raw.githubusercontent.com/AnaGonzalezEsteban/Airbnb-final-project/main/images/Rmapa1.PNG)

This data is the result of looking for "Madrid" in the source page. Although most of the houses are based in Madrid (around 90% of the total number), some of them seem to be distributed around the world. Maybe this keyword came up in different textfiedls for spurious reasons., so we found necessary to filter the relevant data by Longitude and Latitude and get this image:

![image text](https://raw.githubusercontent.com/AnaGonzalezEsteban/Airbnb-final-project/main/images/Rmapa2.PNG)

The following imagen shows the result of making zoom into Madrid:

![image text](https://raw.githubusercontent.com/AnaGonzalezEsteban/Airbnb-final-project/main/images/Rmapa3.PNG)

Once we cleared out the data points outside Madrid's area, it was weird to keep multiple values for Country, Country.Code, State and City.

For instance, when checked the listings with a country different to Spain, we found out that most of the information about the apartment in "Cuba" talks about La Habana. The geolocation might be wrong, so we cant probably trust this data point. The same happens to the listing from Italy, it seems to be an italian girl looking for an apartment.
Something similar happens when we checked the apartments that don't mention Madrid as the State and have a Zipcode that doesn't start with 28. Some apartments have addresses located in Barcelona, Malaga or Valencia, 4 of them don't have any information about their city, Street State or Zipcode. These could be mistakes in the Geolocation data. They only add up to 11 data points, so we removed them. 
Finally, we removed 5 extra outliers that seem to be located outside the area of Madrid city.

After this, we standardized the columns, cleaning some of the character fields and transforming the lists into separated columns. 
We also identified which character columns could be interpreted as factors (categorical qualitative variables).

* Neighbourhood:
There seems to be a difference between Neighbourhood and Neighbouhood.Cleansed. Let's visualize that:

![image text](https://raw.githubusercontent.com/AnaGonzalezEsteban/Airbnb-final-project/main/images/Rmapa4.PNG)

It seems that Neighbourhood.Cleansed correlates better with the Geolocalitation data for each house. According to the Data Dictionary, this field was double checked using Latitude and Longitude data. Neighbourhood also has more empty values. That`s why used Neighbourhood.Cleansed from then.

* Empty price:
Since price is one of the key metrics we need to predict, we can't possibly use the apartments that don't have this value (these are only 9 data points). 

* ZipCode:
We edited this column and removed incorrect Zipcodes

* Street:
Some streets are in English, others in Spanish... we already had the zip code in a different field. And all the data belongs to Madrid. So we aligned these fields and isolated the Street name. 

* Ammenities and Features:
These columns contain a string that summarizes different properties of the house or the host. We turned each property into a different column with a boolean value (T/F) by creating a function. This added more than 50 logical columns to our dataframe. Most were almost empty and therefore, not very useful, so we removed them. 

Finally, after observing and cleaning the initial dataframe, we removed the followinf columns:

* Scrape.ID, Last.Scraped, City, State, Country, Country.Code: All houses share the same value, so these are almost metadata, nor very useful as variables.

* Calendar.last.Scraped: there are only 2 different dates, separated by a day (the date is the same as the Last.Scraped date)

* Experiences.Offered, Host.Acceptance.Rate, Jurisdiction.Names, Has.Availability: all values are "none".

* Square.Feet: this is an interesting value to predict price. But it is mostly empty in Madrid listings (probably bc it is in feet).

* License: mostly empty

* Listing.Url, Host.Url: probably redundant with the listing and host ID

* Thumbnail.Url, Medium.Url, Picture.Url, XL.Picture.Url, Host.Thumbnail.Url, Host.Picture.Url: we won't be doing image analysis this time.

* Host.Total.Listings.Count, Calculated.host.listings.count: These fields are very similar to Host.Listings.Count. Calculated is very inferior only in 12% of the cases. Total is identical.

* Host.Neighbourhood: very similar to Host.Location, but Neighbourhood has more empty values and it lacks definition in the Data dictionary.

* Market, Smart.Location: seem a bit redundant with other location data. They are not described in the dictionary, and they were removed from the latest scrapes.

* Geolocation: redundant with longitud + latitude.

* Features/amenities: There are many interesting features in these fields. But some of them are only included in less than 10% of the listings. We believe these might be less relevant for our analysis.

### You can see this all in the following file: [nombre del archivo](Enlace al archivo)


## Statistical study

### Python Ekaterina


## Data visualization

### Tableau Elisabet


## Linear regresion algorithm

### Ekaterina


## Definition and implementation of the Datawarehouse

### SQL Vicky


## Conclusion

### Ana


## Project editors

* **Almudena Martin Castro** - *Autor del proyecto* - [Linkedin](https://www.linkedin.com/in/almudenamcastro/) - [Github](https://github.com/almudenamcastro)

* **Ekaterina Eremina** - *Autor del proyecto* - [Linkedin](https://www.linkedin.com/in/ekaterina-eremina/) - [Github](https://github.com/ekaterinaleks)

* **Maria Victoria García Gómez** - *Autor del proyecto* - [Linkedin](https://www.linkedin.com/in/mar%C3%ADa-victoria-garc%C3%ADa-g%C3%B3mez-34b689254/) - [Github]()

* **Elisabet Soriano** - *Autor del proyecto* - [Linkedin](https://www.linkedin.com/in/elisabet-soriano-845542175/) - [Github]()

* **Ana González Esteban** - *Autor del proyecto*  - [Linkedin](https://www.linkedin.com/in/anagonzalezesteban/) - [Github](https://github.com/AnaGonzalezEsteban)


## Agradecimientos

* **KeepCoding** - *Centro de formación* - [Web de KeepCoding](https://keepcoding.io/)
