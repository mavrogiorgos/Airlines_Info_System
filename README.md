# Airlines_Info_System

## Short description of the technologies used

This information system consists of the front-end, which is the user interface, and the back-end, which consists of all the services that the user has access to through the interface. The following technologies were used for the front-end:
* HTML5 for organizing the individual sections that make up the interface and adding rules to the user submission forms to ensure their validity before being sent back-end.
* CSS to format the above sections so that they are clear and attractive to the user.
* JavaScript for adding the capacity element to the front-end, maintaining cookies and generally managing various values at the front-end.
* JSP for adding Java code that integrates with static HTML5 pages to provide various functionality.

The following technologies were used for the back-end:
* Java for web services programming and database communication.
* MySQL which is the database of the information system and provides all the data for its smooth operation.

## System Acrhitecture
![system architecture](https://github.com/mavrogiorgos/Airlines_Info_System/blob/main/system_architecture.png)

As depicted in the image above, the system during its execution, follows a specific flow. 
Initially, there are two roles in the system: the simple user and the administrator. Each of them, through the available interface, requests a service. 
This service is then executed, and it can either request data from the database or insert data into it. 
The data in the database comes either from the users themselves or has come from external data sources and relates to flight data, airports and aircraft.
As long as the service performs the action requested by the user, it returns either the corresponding notification message (if it is an action such as registering a new user in the system) or specific data (if it is an action such as viewing information about a flight) through the interface used initially by the user to request this service.

## Conclusions and Future Work

This work aimed to develop an information system that automates a daily realistic process. The theme chosen was that of an airline management system, as these systems are now essential. This is due to the huge demand that now exists for air travel and therefore the need that arises for the creation of systems that will transform the relevant processes, such as ticket purchasing, into processes that are understandable and user-friendly.

Having said that, this work has achieved its goal. A system has been developed that automates air travel processes in a comprehensible and user-friendly way, utilizing a widely used type of web services such as REST. Of course, there is room for improvement.
Of course, there is room for improvement. In order to be able to use this system in complex use cases of reality, various improvements will have to be made, such as: the addition of more seats and even depending on the aircraft that performs the specific flight, the addition of different types of tickets, the formulation of security policy for personal data of users such as username and password, modification of database tables to include more complete data, etc.

