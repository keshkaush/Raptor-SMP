import 'package:flutter/material.dart';
import 'package:smp_app/WelcomePage/Topic/cautio.dart';
import 'package:smp_app/ui/colors.dart';
import 'package:smp_app/ui/sceensize.dart';
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  Animation virusBounce;
  Animation shadowFade;
  AnimationController animationController;
  @override
  void initState() {
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
  void dispose() {
    animationController.dispose();
    super.dispose();
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
                    image: AssetImage("assets/images/smp.png"),
                    height: screenAwareSize(250, context),
                    width: screenAwareSize(250, context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Center(
                  child: Text(
                    'RAPTOR-SMP',
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
                      MaterialPageRoute(builder: (context) => Cautions()),
                    );
                  },
                  minWidth: double.infinity,
                  height: 40,
                  child: Text(
                    'Topic'.toUpperCase(),
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