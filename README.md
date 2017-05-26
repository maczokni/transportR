# transportR
This is a package for reading data thru APIs from transport authorities in the United Kingdom. So far it connects with Transport for London and Transport for Greater Manchester. You can retreive data about collisions, for example, or about currently available spaces in parking structures. 

To connect to the API you will need to register a developer account with each transport authority that you want to use. 

To register for with Transport for London, visit [https://api-portal.tfl.gov.uk/signup](https://api-portal.tfl.gov.uk/signup)

To register for with Transport for Greater Manchester, visit [https://developer.tfgm.com/](https://developer.tfgm.com/)


After you have registered, you will need to save these key/ access codes you receive using the save_key() function. Then you can use the other functions to retreive data from the APIs into dataframes. 

Currently it can:
- Get all accident details for accidents occuring in the specified year
- Get details about car park names, state (giving an indication of whether it is open or closed), capacity and real-time occupancy for selected car parks in the districts of Manchester, Stockport and Wigan.

