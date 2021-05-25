import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:smp_app/ui/colors.dart';
import 'package:smp_app/ui/sceensize.dart';
class DatabaseScreen extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}
class _OverviewState extends State<DatabaseScreen> with SingleTickerProviderStateMixin {
  String reportPDFPath = "";
  String srsPDFPath = "";
  Animation virusBounce;
  Animation shadowFade;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
        super.initState();
        animationController=AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener((){
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

    getFileFromAsset("assets/pdf/report.pdf").then((f) {
      setState(() {
        reportPDFPath = f.path;
        print(reportPDFPath);
      });
    });
    getFileFromAsset1("assets/pdf/srs.pdf").then((f) {
      setState(() {
        srsPDFPath = f.path;
        print(srsPDFPath);
      });
    });
  }
  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/report.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }
    Future<File> getFileFromAsset1(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/srs.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('D A T A B A S E'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(173, 216, 230, 1.0),
          padding: EdgeInsets.fromLTRB(25, 100, 25, 25),
          child: Center(
            child: Column(
              children: <Widget>[
                Transform.translate(
                  offset: virusBounce.value,
                  child: Image(
                    alignment: Alignment.centerRight,
                    image: AssetImage("assets/images/kiit.png"),
                    height: screenAwareSize(250, context),
                    width: screenAwareSize(250, context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Center(
                  child: Text(
                    'Undertaking\nBy\nDr.Mainak Bandyopadhyay(KIIT)',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center
                  ),
                ),
                SizedBox(height: 20),   
                Center(
                  child: Builder(
                    builder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                            ),
                            minWidth: double.infinity,
                            height: 40,
                            color: Colors.amber,
                            child: Text("Project Report"),
                            onPressed: () {
                              if (reportPDFPath != null) {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>PdfViewPage(path: reportPDFPath))
                                 );
                                }
                              },
                            ),
                            SizedBox(height: 20),
                            MaterialButton(
                              shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                            color: Colors.cyan,
                            minWidth: double.infinity,
                            height: 40,
                            child: Text("Open SRS"),
                            onPressed: () {
                              if (srsPDFPath != null) {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>PdfViewPage(path: srsPDFPath)));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
        backgroundColor: Bgcolor,
        centerTitle: true,
        title: Text('D A T A B A S E'),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Back to page ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage+1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to page ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}
