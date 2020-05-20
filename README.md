# About

This is a set of microservices created in order to present how to manage
configuration with a central configuration server. Project consists of following micro
services:
 
 - Config Server (the central configuration server with jdbc)
 - Product Manager (a microservice that loads configuration from the central configuration server)
 - Customer Manager (a microservice that loads configuration from the central configuration server)
 
# Building

In order to build all services at once, run following command in project's
root directory:

```
mvn clean install
```

If you want to build services one by one, run the same command in a proper
subdirectory.

# Running

1. Create a postgres database (you can also use an existing one)
2. Execute the init.sql (under config-server\src\main\resources) script to create the properties and two sql statements with some configuration values
3. Create an entry for each property where: application is the spring.application.name as defined in the corresponding client application properties, profile is the spring.active.profile of the corresponding client application , the label is used for different versions of configiration - just set the value to "master" or something else , the key is the porperty key and the value is the value
4. Update application.properties file with the corresponding datasource information
5. You can run all services with the following command

```
java -jar {application}-{version}.jar
```
# Demonstration

1. Make sure that all three microservices are up and running
2. Execute java -Dserver.port=8087 -jar customer-manager-0.0.1-SNAPSHOT.jar in order to start a second node of customer-manager microservice
3. Execute http://localhost:8085/customers/getPremiumEmailSuffix in order to get a configured value on customer-manager microservice from the first node
4. Execute http://localhost:8087/customers/getPremiumEmailSuffix in order to get a configured value on customer-manager microservice from the second node
5. Update on properties table the value of the entry with key 'premium-email-suffix'
6. Execute the command http://localhost:8888/actuator/bus-refresh/customer-manager: (Note the : in the end. This is an instruction that all
nodes should be refreshed)
7. Execute the commands in steps 3 & 4 and you should see the new value.
8. Execute the command http://localhost:8086/hello in order to get a value from product-manager microservice
9. Update the values of both entries on properties table
10. Execute the command http://localhost:8888/actuator/bus-refresh and this will refresh all the values on all microservices
11. Exeute the commands on steps 3, 4 and 8 and you should see the new values
