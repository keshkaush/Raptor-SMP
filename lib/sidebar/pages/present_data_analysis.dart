import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smp_app/navigation_bloc/navigation_bloc.dart';

DashboardResult dashboardResultFromJson(String str) =>
    DashboardResult.fromJson(json.decode(str));

String dashboardResultToJson(DashboardResult data) =>
    json.encode(data.toJson());

class DashboardResult {
  int positiveSentiment;
  int negativeSentiment;

  DashboardResult({
    this.positiveSentiment,
    this.negativeSentiment,
  });

  factory DashboardResult.fromJson(Map<String, dynamic> json) =>
      DashboardResult(
        positiveSentiment: json["positive_sentiment"],
        negativeSentiment: json["negative_sentiment"],
      );

  Map<String, dynamic> toJson() => {
        "positive_sentiment": positiveSentiment,
        "negative_sentiment": negativeSentiment,
      };
}

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  enablePlatformOverrideForDesktop();
  runApp(PresentData());
}
class PresentData extends StatefulWidget with NavigationStates{
  @override
  _PresentDataState createState() => _PresentDataState();
}
class _PresentDataState extends State<PresentData> {

  //get dataMap => null;
  //get colorList => null;
  Map<String, double> dataMap = Map();

  List<Color> colorList = [
    Colors.green,
    Colors.red,
  ];
  String jsonString;
  DashboardResult dashboardResult;

  @override
  void initState() {
    super.initState();

    jsonString = '''{
      "positive_sentiment":15,
    "negative_sentiment":18
    }
    ''';

    dashboardResult = dashboardResultFromJson(jsonString);
    
    dataMap.putIfAbsent("Positive Sentiment", () => dashboardResult.positiveSentiment.toDouble());
    dataMap.putIfAbsent("Negative Sentiment", () => dashboardResult.negativeSentiment.toDouble());
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('Present Data Analysis',
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
                  child: Text("Present Data Sentiment Analysis",
                      style: TextStyle(
                          color: Colors.grey[800], fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width / 2.7,
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                colorList: colorList,
                showLegends: true,
                legendPosition: LegendPosition.right,
                decimalPlaces: 1,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                    color: Colors.blueGrey[900].withOpacity(0.9)),
                chartType: ChartType.disc,
              )
              ),
            ],
          ),
        ]
        ),
      ),
    );
  }
}

