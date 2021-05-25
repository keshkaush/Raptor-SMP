import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smp_app/ui/colors.dart';
class Cautions extends StatefulWidget {
  @override
  _CautionsState createState() => _CautionsState();
}
class _CautionsState extends State<Cautions> {
  SwiperController _swiperController;
  double prevOpacity = 1.0;
  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }
  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> swiperItemsList = [
      buildSwiperItem(
          "assets/images/smp.png",
          "Stock market prediction is the act of trying to determine the future value of a company stock or other financial instrument traded on an exchange. The successful prediction of a stock's future price could yield significant profit.",
          Color(0xFFfba457),
          firstGradient,
          "What is Stock Market Prediction?"),
      buildSwiperItem(
          "assets/images/smp.png",
          "Even if you don’t trade stocks for a living, or have any financial background whatsoever, being able to predict the future economy can be a huge benefit to your financial situation. Real estate can be sold at its highs, money can be drawn from mutual funds that are expected to rise indefinitely, and when things start to go bad, moving capital into tangible assets such as gold is a boon.",
          Color(0xFFffcc00),
          secondtGradient,
          "Predicting the Stock Market Is Easier Than You Think"),
      buildSwiperItem(
          "assets/images/smp.png",
          "It's believed that the pandemic’s effect on stock prices today is better understood as a series of emotional responses to unique events. People are trading stocks with their cellphones on their living room couches with the television news blaring about the pandemic. There is widespread foreboding, not just about the economy but about the possibility of grave illness or death in the weeks ahead.",
          Color(0xFFd18cd6),
          thirdGradient,
          "Prediction For The Coronavirus Stock Market"),
    ];
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Topic'),
      ),
      backgroundColor: Bgcolor,
      body: Container(
        color: Bgcolor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 6,
              child: Swiper(
                controller: _swiperController,
                itemCount: swiperItemsList.length,
                onIndexChanged: (int value) {
                  if (value == 2) {
                    setState(() {
                      prevOpacity = 0.0;
                    });
                  } else {
                    setState(() {
                      prevOpacity = 1.0;
                    });
                  }
                },
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height / 1.5,
                itemBuilder: (BuildContext context, index) {
                  return swiperItemsList[index];
                },
                layout: SwiperLayout.TINDER,
                curve: Curves.bounceOut,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwiperItem(String image, String text, Color color,
      Gradient gradient, String endText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.8),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: gradient,
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 8),
                        )
                      ]),
                ),
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.3,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              endText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const firstGradient = LinearGradient(
  colors: [
    Color(0xFFfc792c),
    Color(0xFFfba457),
  ],
);

const secondtGradient = LinearGradient(
  colors: [
    Color(0xFFfeb700),
    Color(0xFFffcc00),
  ],
);

const thirdGradient = LinearGradient(
  colors: [
    Color(0xFFa978ad),
    Color(0xFFd18cd6),
  ],
);
