import 'package:flutter/material.dart';
import 'package:signalini/screens/signale/widgets/choice_question.dart';
import 'package:signalini/screens/signale/widgets/multiple_choice.dart';
import 'package:signalini/screens/signale/widgets/open_question.dart';
import 'package:signalini/services/form_service.dart';
import 'package:signalini/utils/constants.dart';

class SignalePage extends StatefulWidget {
  static const String id = '/signale';
  @override
  _SignalePageState createState() => _SignalePageState();
}

class _SignalePageState extends State<SignalePage> with SingleTickerProviderStateMixin {
  int currentIndex;
  PageController pageController;
  FormService formService = FormService.instance;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget _buildItem(int index) {
    switch (forms[index][typeKey]) {
      case QuestionsType.open:
        return OpenQuestionWidget(
          question: forms[index][questionKey],
          index: currentIndex,
          formService: formService,
        );
      case QuestionsType.oneChoice:
        return ChoiceQuestion(
          question: forms[index][questionKey],
          index: currentIndex,
          formService: formService,
        );
      case QuestionsType.multipleChoice:
        return MultipleChoice(
          mainQuestion: forms[index][questionKey],
          questions: forms[index][ansersKey],
          index: currentIndex,
          formService: formService,
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
              currentIndex != forms.length - 1
                  ? Positioned(
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
                              if (formService.reponses[currentIndex] != null)
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 450),
                                  curve: Curves.linear,
                                );
                            },
                          ),
                          Text("Suivant", style: whiteText),
                        ],
                      ),
                    )
                  : Container(),
              //Submit Button
              currentIndex == forms.length - 1
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          if (formService.reponses[forms.length - 1] != null) {
                            formService.submitAnswer(context);
                          }
                        },
                        child: Container(
                          height: 50.0,
                          width: 200.0,
                          margin: const EdgeInsets.only(bottom: 30.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Soumettre",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  : Container(),
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
