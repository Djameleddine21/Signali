import 'package:flutter/material.dart';
import 'package:signalini/screens/signale/widgets/choice_question.dart';
import 'package:signalini/screens/signale/widgets/multiple_choice.dart';
import 'package:signalini/screens/signale/widgets/open_question.dart';
import 'package:signalini/utils/constants.dart';

class SignalePage extends StatefulWidget {
  static const String id = '/signale';

  @override
  _SignalePageState createState() => _SignalePageState();
}

class _SignalePageState extends State<SignalePage> {
  int currentIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    pageController = PageController(initialPage: currentIndex);
  }

  Widget _buildItem(int index) {
    switch (forms[index][typeKey]) {
      case QuestionsType.open:
        return OpenQuestionWidget(question: forms[index][questionKey]);
      case QuestionsType.oneChoice:
        return ChoiceQuestion(question: forms[index][questionKey]);
      case QuestionsType.multipleChoice:
        return MultipleChoice(
          mainQuestion: forms[index][questionKey],
          questions: forms[index][ansersKey],
        );
      default:
        return Container();
    }
  }

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
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    //for each question in forms
                    children: <Widget>[
                      for (var i = 0; i < forms.length; i++) _buildItem(i),
                    ],
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              //top index
              Positioned(
                top: height * 0.05,
                left: width * 0.45,
                child: Text(
                  "${currentIndex + 1}/${forms.length}",
                  style: whiteText.copyWith(fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
              //next
              Positioned(
                bottom: height * 0.05,
                right: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear,
                        );
                      },
                    ),
                    Text("Suivant", style: whiteText),
                  ],
                ),
              ),
              //previous
              Positioned(
                bottom: height * 0.05,
                left: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        currentIndex = pageController.page.toInt();
                        pageController.previousPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear,
                        );
                      },
                    ),
                    Text("Précédent", style: whiteText),
                  ],
                ),
              ),
              //back button
              Positioned(
                child: BackButton(color: whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
