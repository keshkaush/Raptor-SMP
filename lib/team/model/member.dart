import 'package:flutter/widgets.dart';
import 'package:smp_app/team/resources/assets.dart';

class Member {
  final String name;
  final String occupation;
  final String imagePath;
  final String description;

  Member(
      {@required this.name,
      @required this.occupation,
      @required this.imagePath,
      @required this.description});
}

Member firstMember = Member(
    name: "Sidharth Jena",
    occupation: "ML Developer",
    imagePath: Assets.SIDDHARTH,
    description: "1. Python to Firebase Linking.\n2. Model selection for sentimental analysis and pipelining.\n3.Formatting of output for proper display in the app.\n4. Usage of API for tweet fetching.\n5. Python coding for sentimental analysis.\n6. Python coding for Historical data prediction.");
Member secondMember = Member(
    name: "Aakash Das",
    occupation: "Flutter Developer",
    imagePath: Assets.AAKASH,
    description: "1. Implemented SMP-20 App Design\n2. Implemented all internal logical part in Flutter Diagram \n3. Design and implemented present Data and its analysis in pie chart \n4. Implemented SMP-20 App in dart language\n5. Implemneted SMP-20 APP in Android, iOS(fully) and web application(partially).\n6. Adjustment UI screensize and bugs in app");

Member thirdMember = Member(
    name: "Meghna Verma",
    occupation: "Data analyst",
    imagePath: Assets.MEGHNA,
    description: "1. Proper sentiment labelling for sentiment analysis training data.\n2. Running of python script in the background.\n3. Data collection.\n4. Data cleaning.\n5. Historical data fetching using yfinance.\n6. Automated addition of dates to historical data for prediction.");

Member fourthMember = Member(
    name: "Subhashree Priyadarsini",
    occupation: "Resource Manager",
    imagePath: Assets.SUBHASHREE,
    description: "1. Designed the application after deep market research and analysis.\n2. Built the structural model for the application keeping in mind where the app will be used.\n3. Helped in finding and providing all the required resources that are essential for the project.\n4. Proposed Flutter Outline Design\n5. All Image Attachment in SMP-20 App\n6. Designed App Icon");


List<Member> members = [firstMember, secondMember, thirdMember, fourthMember];
