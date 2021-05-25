import 'package:flutter/material.dart';
import 'package:smp_app/navigation_bloc/navigation_bloc.dart';
import 'package:smp_app/ui/sceensize.dart';

class Overview extends StatelessWidget with NavigationStates {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('Historical Data Analysis',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              onTimeComp(context),
            ],
          ),
        ],
      ),
    );
  }
  Widget onTimeComp(BuildContext context) {
        return Center(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        padding: EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 0),
        color: Colors.grey[300],
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text("Historical Trends",
                      style: TextStyle(
                          color: Colors.grey[800], fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Image.network('https://storage.googleapis.com/smp-app-275216.appspot.com/pred.png?Expires=1616090884&GoogleAccessId=firebase-adminsdk-pume9%40smp-app-275216.iam.gserviceaccount.com&Signature=i6Mj8IL86hvFYG4BMoleNalG5wxxHlc6YOYpw8e3N5Zo1BdglhBnH%2B55wRmOtxHY7740ej7vFC98li1t9S3aZvt%2F%2FXBhlCO2CK5jnsrpHK3IcUqdCuPjvXnOm17Jk3EIGl6cEcbByR%2BLrL8EtoO6s10t50XYl5%2Fh5qytn%2FNM2YDZ0lhREf2kSfaE8zhasu1G%2FJio6%2BWgkArHDGmZ0RlU%2FehrGuKvdguuIvzewjIB6cxd%2FdGiTWAif7rcjiXzYBWQtq9RlBL7C7cC0q6hCqSjoBhd1nowa2V0ZrVK78r%2Frbl3o4DuHgIsIQmR4zzv33AhcahKmjYCkmsSBZAjkKggtA%3D%3D'),
                    height: screenAwareSize(250, context),
                    width: screenAwareSize(250, context),
              ),
            ],
          ),
        ]
        ),
      ),
    );
  }
}
