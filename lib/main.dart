import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:smp_app/Database/DataScreen.dart';
import 'package:smp_app/WelcomePage/LandingPage.dart';
import 'package:smp_app/sidebar/stock_list.dart';
import 'package:smp_app/team/pages/team_member_pages.dart';
import 'package:smp_app/ui/colors.dart';
void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Bgcolor, fontFamily: 'Staatliches'),
      home: StartScreen()));
}
class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}
class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Welcome(),
    DatabaseScreen(),
    StocklistScreen(),
    TeamMembersPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 75.0,
        items: <Widget>[
          Icon(LineAwesomeIcons.dashboard, size: 30),
          Icon(LineAwesomeIcons.database, size: 30),
          Icon(LineAwesomeIcons.history, size: 30),
          Icon(LineAwesomeIcons.mobile_phone, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Color.fromRGBO(253, 219, 39, 1.0),
        backgroundColor: Color.fromRGBO(173, 216, 230, 1.0),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}