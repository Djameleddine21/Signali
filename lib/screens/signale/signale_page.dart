import 'package:flutter/material.dart';
import 'package:signalini/utils/constants.dart';

class SignalePage extends StatefulWidget {
  static const String id = '/signale';

  @override
  _SignalePageState createState() => _SignalePageState();
}

class _SignalePageState extends State<SignalePage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              //background content
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[greenColor, greenDeepColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
              ),
              //body content
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: height * 0.7,
                  width: width,
                  child: PageView(
                    controller: pageController,
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Container(color: whiteColor.withOpacity(0.02)),
                      Container(color: whiteColor.withOpacity(0.1)),
                      Container(color: whiteColor.withOpacity(0.2)),
                    ],
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              //top curseur
              Positioned(
                top: height * 0.05,
                left: width * 0.45,
                child: Text(
                  "1/8",
                  style: whiteText.copyWith(fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
              //next
              Positioned(
                bottom: height * 0.05,
                right: 20.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ),
              //previous
              Positioned(
                bottom: height * 0.05,
                left: 20.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
