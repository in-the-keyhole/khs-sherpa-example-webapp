khsSherpa Example WebApp
========================

Example java web application that demonstrates the khsSherpa remote java object framework

khsSherpa framework hosted on GITHUB (https://github.com/in-the-keyhole/khs-sherpa)

About
-----
This example web application (WAR) implements example JSP user interface(s) that access 
remote java end points defined using the khsSherpa open source framework. 

This example provides a good example khsSherpa features and usage.

It will run under any java application server using JDK 1.5 and above.

kshSherpa Features  
------------------
 * Annotation Based Configuration
 * Authentication
 * Session Support 
 * Plug-gable User Activity Logging
 * Works with any JEE application server

Getting Started
---------------
To build it clone then use Maven:

    $ git clone ...
	$ cd khs-sherpa-example-webapp
	
	Compile and build WAR
	$ mvn clean package
	
	Deploy war to app server, start and access with...
	http://localhost:8080/khs-sherpa-example-webapp/index.jsp
	
Example JSPs
------------

Two jsp's are defined in the WAR... 

	index.jsp - Invokes various example endpoint(s) 
	test-fixture.jsp - JSP that allows Endpoints, methods, with parameters to be executed and tested
	

Example khsSherpa End Points
----------------------------

Two end point definitions have been defined in the com.khs.example.endpoints package...  

	StockService - Returns price quote information for a stock ticker
	TestService -  Various example endpoints that test parameter types




   