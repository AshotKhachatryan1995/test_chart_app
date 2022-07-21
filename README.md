Test Chart Project


This project created in flutter using BLoC and Provider. Chart supports both Android and IOS, clone the  branches mentioned below:

https://github.com/AshotKhachatryan1995/test_chart_app/master (stable channel)

Getting Started
The Chart Project contains two screens. First screen contains chart data, users list, transactions. 
In second screen you can see saved cards and also transactions.

How to Use
Step 1:

Download or clone this repo by using the link below:

https://github.com/AshotKhachatryan1995/test_chart_app.git

Go to project root and execute the following command in console to get the required dependencies:

flutter pub get 
Step 3:

This project uses inject library that works with code generation, execute the following command to generate files:

flutter packages pub run build_runner build --delete-conflicting-outputs
or watch command in order to keep the source code synced automatically:

flutter packages pub run build_runner watch
Hide Generated Files
In-order to hide generated files, navigate to Android Studio -> Preferences -> Editor -> File Types and paste the below lines under ignore files and folders section:

*.inject.summary;*.inject.dart;*.g.dart;
In Visual Studio Code, navigate to Preferences -> Settings and search for Files:Exclude. Add the following patterns:

**/*.g.dart 
 
Folder Structure
Here is the core folder structure which flutter provides.

flutter-app/
|- android
|- build
|- ios
|- lib
|- test
Here is the folder structure we have been using in this project

lib/
|- constants/
|- middleware/
|- shared/
|- main.dart
|- home.dart
|- saved_cards_screen.dart

Now, lets dive into the lib folder which has the main code for the application.

1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `colors`.
2- middleware - Contains repositories, blocs, notifiers, models.
3- shared - Contains all shared widgets in the app. 
4- main.dart - This is the starting point of the application. The application routes configurations are defined in this file.
5- home.dart - This is a first screen of our Charts Project. 
6- saved_cards_screen.dart - This is a second screen of our Charts Project. 
 

Conclusion
I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the Charts Project then please feel free to submit an issue and/or pull request 🙂

I am waiting for your response.
Thanks in advance.
