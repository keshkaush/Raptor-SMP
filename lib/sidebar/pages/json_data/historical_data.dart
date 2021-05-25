import 'dart:convert';
import 'package:flutter/material.dart';
class HistoricalTrends extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Historical JSON Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(title: 'Historical JSON Data'),
    );
  }
}
class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/nlpop.json'),
        builder: (context, snapshot) {
          return snapshot.hasData 
          ? Home(snapshot.data)
          : Center(child: CircularProgressIndicator())
          ;
        },
      ),
    );
  }
}
class Home extends StatefulWidget {
  final dynamic data;
  Home(this.data);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<StarWarsModel> starWarsModelList = List<StarWarsModel>();
  @override
  void initState() {
    super.initState();
    starWarsModelList =
        StarWarsModel().decodeDeceserializeJsonString(widget.data);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: starWarsModelList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 20,
              color: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  children: <Widget>[
                    Text(
                      ' ' + starWarsModelList[index].no,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Text:     ' + starWarsModelList[index].text,
                      style: TextStyle(color: Colors.white ),
                    ),
                    Text(
                      'SentimentText:     ' + starWarsModelList[index].sentimentText,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Sentiment:     ' + starWarsModelList[index].sentiment,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
class StarWarsModel {
  String no;
  String text;
  String sentimentText;
  String sentiment;
  
  StarWarsModel(
      {this.no,
      this.text,
      this.sentimentText,
      this.sentiment});

  factory StarWarsModel.fromJson(Map<String, dynamic> json) => StarWarsModel(
      no: json['No'],
      text: json['Text'],
      sentimentText: json['SentimentText'],
      sentiment: json['Sentiment']);

  List<StarWarsModel> decodeDeceserializeJsonString(dynamic jsonString) {
    dynamic map = json.decode(jsonString);
    List<StarWarsModel> starWarsModelList = List<StarWarsModel>();
    for (var entry in map) {
      starWarsModelList.add(StarWarsModel.fromJson(entry));
    }
    return starWarsModelList;
  }
}

