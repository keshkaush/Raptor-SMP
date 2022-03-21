import 'package:flutter/material.dart';
import 'package:smp_app/navigation_bloc/navigation_bloc.dart';
import 'package:smp_app/team/resources/assets.dart';
import 'package:smp_app/ui/sceensize.dart';
import 'dart:async';
import 'dart:math';

class PeopleComments extends StatefulWidget with NavigationStates {
    @override
  _PeopleCommentsState createState() => _PeopleCommentsState();
}
class _PeopleCommentsState extends State<PeopleComments> {
  var random;
  var list;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    random = Random();
    refreshList();
  }
    Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      list = List.generate(random.nextInt(10), (i) => "Item $i");
    });

    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('Comments Data Analysis',
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
            child: Text("Comments Analysis",
              style: TextStyle(
                color: Colors.grey[800], fontWeight: FontWeight.bold)
              ),
            ),
          ),
        ],
      ),
      Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              //imageCache.clear(),
                child: Image.asset(Assets.COMMENT),
//              child: Image.network('https://storage.googleapis.com/smp-app-275216.appspot.com/pnn.png?Expires=1616090295&GoogleAccessId=firebase-adminsdk-pume9%40smp-app-275216.iam.gserviceaccount.com&Signature=SynMwLu3MpyDUbSlogE3uDJJqaBjm8ihhqwoyr391brtm%2Fedq69PgVz1jKQUgBPbCuZhoglZ64OIbQhd2BPJq4YEZNSEejIkBB3UkstSrhiG8z4pBmkWjwLl263irmb%2BdezlPY28IwveEaDKNZcviwqO0OgW2le1EQRDhcttypykM6B8SFnQuldP6msxPAhie%2BJ9N5MQFSr6GPkEJ57fgarQ2ZV96Zuqf2X%2F8%2BmqqFpRR7OZJBCtexldN%2FRqR0MKyray%2FG%2BvMfQaamVBNam0CfAPJYanp%2FgP%2BR%2BuwMU43iD3ynHedbcgKB%2Fc8lxSzPcrYWzfSJ6vnoTXu5z15j7Kfg%3D%3D',key: ValueKey(new Random().nextInt(100)),),
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






