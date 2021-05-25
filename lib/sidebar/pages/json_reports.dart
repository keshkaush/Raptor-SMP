import 'package:flutter/material.dart';
import 'package:smp_app/navigation_bloc/navigation_bloc.dart';
import 'package:smp_app/sidebar/pages/json_data/historical_data.dart';
import 'package:smp_app/sidebar/pages/json_data/present_data.dart';
import 'package:smp_app/ui/colors.dart';
import 'package:smp_app/ui/sceensize.dart';

class JSONReports extends StatefulWidget with NavigationStates{
  @override
  _StocklistState createState() => _StocklistState();
}
class _StocklistState extends State<JSONReports> with SingleTickerProviderStateMixin {
  String assetPDFPath = "";
  String urlPDFPath = "";

  Animation virusBounce;
  Animation shadowFade;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

        super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward(from: 0.0);
            }
          });
    virusBounce = Tween(begin: Offset(0, 0), end: Offset(0, -20.0))
        .animate(animationController);
    shadowFade = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.4, 1.0), parent: animationController));

    animationController.forward();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Fgcolor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 100, 25, 25),
          child: Center(
            child: Column(
              children: <Widget>[
                Transform.translate(
                  offset: virusBounce.value,
                  child: Image(
                    alignment: Alignment.centerRight,
                    image: AssetImage("assets/images/json.png"),
                    height: screenAwareSize(250, context),
                    width: screenAwareSize(250, context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Center(
                  child: Text(
                    'Local JSON Files',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PresentTrends()),
                    );
                  },
                  minWidth: double.infinity,
                  height: 40,
                  child: Text(
                    'Present Data Files'.toUpperCase(),
                  ),
                  color: Bgcolor,
                  textColor: Colors.white,
                ),
                                SizedBox(height: 20),
                MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoricalTrends()),
                    );
                  },
                  minWidth: double.infinity,
                  height: 40,
                  child: Text(
                    'Historical Trends Files'.toUpperCase(),
                  ),
                  color: Bgcolor,
                  textColor: Colors.white,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
