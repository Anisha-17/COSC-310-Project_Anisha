# COSC 310 Project: Office Security System

## Developed by:
- Anisha Parikh
- Jaden Edgar
- Kyra Barnes

# What is our project?

Office Security System is a dual computer project utilising both locally run android studio and processing java applications to emulate a redimentary office building security system. The android studio java application will be emulating a NFC card reader with variable permissions depending on which employee of the office attempts to gain access, and the room in which the employee is attempting to enter. The processing java application will reflect these attempted actions by the employee by showing a top down view of the office building floor layout, and represent granted access into a certain room by showing a dynamic door that change color when access is granted.

# How will this software system work?

In user stages, the employee will first select the room in which they are attempting to access using the NFCScanner android studio java application. They will then scan their appropriate NFC card on the back of the emulator. Should their access level by suitable for the room they are trying to enter, they will be prompted with the text "ACCESS GRANTED". Should their access level not be suitable, they will instead be prompted with "ACCESS DENIED". Additionally, if the users NFC card is not read properly, a toast message telling them that the scan was unsuccseful will be presented, and if the NFC card is read succesfully but the data on the card is not recognised by the system, then the user will be presented with "UNKNOWN CARD".

On an 'Access Granted' event, the appropriate room and user details will be sent over a local java socket client to the processing application, running a java socket server on a seperate computer, including the users role within the company, the room that was attempted to access, and whether the attempt was succesful or not. This information will then be used in two ways; it will be used initially to show visually the door opening and then closing after a set time (3s), and the user information previously described will be stored in a .csv file along with the time of the access attempt to allow for logs of access attempts to be stored.

Finally, two emergency situations have been implemented into the scanner, an fire emergency, and a intruder emergency. In the event of a fire emergency (in this case a card with the raw data "FIRE" on it), the scanner will present the user with continous flashing text "FIRE ALERT", and all doors on processing will be shown in the open position. The scanner text and the doors in processing will remain in these states until a new nfc card is manually scanned to end the event. In the intruder emergency state, the opposite behavior will be observed by the system, where the scanner will display "INTRUDER ALERT" however all doors will remain closed and cannot be opened until a new nfc card is scanned to manually end the event.

# How to compile and run the code

The project_demo was made using Processing 4.0.1. It should also run with earlier versions. The program will be updated when new versions of Processing are released if necessary. Download the 'project_demo' folder in the current main branch, and using a suitable version of processing, open the project folder. Processing will automatically open a java socket server on a seperate thread on port 4000, and wait for a connection from the java socket client on the NFCScanner app.

To implement the NFCScanner, download the latest version of android studio, clone the current main branch repository, and open the NFCScanner application using android studio. You may either run the application in the android studio IDE connected to a physical android device, or build an APK through android studio, install onto a physical android device, and run the app locally. To use the app, first rerad through the tutorial describing each state of the system depending on how your NFC card is processed, and then on the following activity screen, enter the local IPV4 address of your device running the processing app and press done. Next, select the room you are attempting to access, and then scan the appropriate NFC card onto the back of the device. Once the first NFC card is scanned, the NFCScanner app will automatically open a java socket client to send the NFC card data, aswell as the door selected to enter and whether or not the access attempt was succesfull or not to the processing java socket server.

Regarding the Features added, you will need docker desktop to be running in the background. In addition, before being able to use the feature, in the visual studio code terminal with the folder 'j' open, you will have to type "docker compose up -d". This will take a second to run, once completed in a web browser (preferably chrome) type in the url "localhost/shop/loaddata.jsp". Now you are welcome to go into a web browser and type in "localhost/shop/login.jsp" to begin. To be able to log in to the server, you will be able to find faux usernames and passwords created in the insert statements in either ddl file.

- NOTE: Should you choose to test the NFCScanner app, NFC DATA FOR EACH CARD IS WITHIN 'strings.xml' INSIDE THE PROJECT FOLDER AT THE FOLLOWING DIRECTORY, WRITE EACH INDIVIDUAL ITEM IN ARRAY "rooms" TO SEPERATE NFC CARDS.
-  .\NFCScanner\app\res\values\strings.xml

- NOTE: As NFC scanning capabilities are essential to the NFCScanner app, the android studio app is required to be run on a physical device with an NFC scanner enabled. Failure to do so will result in the app waiting at its initial "ACCESS PENDING" state with no ability to grant or deny access, or be able to open the java socket client to communicate with the processing java socket server.



# List of features

- Sending information from Android Studio to processing using java.net libary, specifically java network sockets. Here, using Java Sockets, we can send information in the form of strings to Processing. This allows us to store that information to a locally saved excel file using Processing.
  - Using Java network sockets allowed us to succesfully connect both apps together, tying in the GUI of the NFCScanner app and the Processing office floor layout GUI to give a holistic GUI that can be used
  
 - Writing information to an excel spreadsheet and editing the same excel spreadsheet to add on new data and not rewrite.
   - Being able to write to a excel file and save new access attempts without rewriting the file has given the program the ability to store an effective database of all access attempts, succesfull or not with precise times and which part of the office was accessed.
   - 
   ![Snippet of database logging](Assets/Images/database.PNG)
   
 - included emergency features for fires or intruders that will have special behavior such that all doors either remain open or closed respectively, and an appropriate message is displayed to the user on the NFCScanner app.
   - having special behavior for emergencies and allowing the system to emulate what would happen should one of these emergencies occur is an important improvement to our system as it then gains the ability to handle exceptional circumstances and alter the systems behavior accordingly, outside of its default state of regular use.
   - 
   ![NFCScanner fire](/Assets/Images/screenshot-(8).jpg)
   ![NFCScanner intruder](/Assets/Images/screenshot-(9).jpg)
   
 - Reads data on NFC cards and decides what course of action to take based on the information received.
    - Altering NFCScanner to automatically read NFC data off the seperate NFC cards created improves the system as it now acts closer to a real life system, where testing functionality such as the "TEST" button and selecting roles instead of the room you wished to enter was used more as a early development prototype.
    - 
   ![NFCScanner pending](/Assets/Images/screenshot-(4).jpg)
   ![NFCScanner access granted](/Assets/Images/screenshot-(5).jpg)
   ![NFCScanner access denied](/Assets/Images/screenshot-(6).jpg)
   ![NFCScanner unknown card](/Assets/Images/screenshot-(7).jpg)
    
 - virtual demonstration of how the employees would be provided access to rooms and how doors would open and close within processing
   - with both NFCScanner and Processing now multithreaded, and running the java socket and server respectively on seperate threads from the main GUI, our system has improved by now being able to automatically emulate the opening of a door that a user has been granted access to as soon as they scan their NFC card on the NFCScanner app, instead of manually clicking the door to emulate the functionality that the java socket has now implemented.
   - 
   ![Snippet of database logging](/Assets/Images/floor-layout-all-closed.jpg)
   ![Snippet of database logging](/Assets/Images/floor-layout-fire.jpg)
   
   # Features added
   
   The overall feature added is the ability to see the activity logs recorded in the database and filter through. More specifically, the software can now upload the data to a server. From here the software verifies log in information before being able to access the activity logs. Then, it is able to take in input and display information related only to what one would want to see. 
   With every log in attempt, whether successful or not, the users IP address and username used will be stored in a database. 

  # APIs Used
  
  The added program is based based off of JDBC, which is a Java based API. It allows for creativing a connection between a Java program and a database and determines how one may access that database. Whether it be only adding values or only querying the database, it provides all the methods required to do so.
  
  The program also uses MY IP, which is an API that gets the users IP information by simply accessing the link. Which is called every login attempt. This gets stored to a database to keep track of who is accessing security logs from where.
