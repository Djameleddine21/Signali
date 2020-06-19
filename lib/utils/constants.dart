import 'package:flutter/material.dart';

///path to icon assets
const String iconPath = "assets/icons/";

///custom color pallete
const Color redDeepColor = Color(0xffD90429);
const Color redColor = Color(0xffEF233C);
const Color whiteColor = Color(0xffEDF2F4);
const Color greyColor = Color(0xff8D99AE);
const Color greyDeepColor = Color(0xff2B2D42);
const Color greenDeepColor = Color(0xFF143642);
const Color greenColor = Color(0xFF26667d);

///border radius
const double radius = 30.0;

/// text style with white color
TextStyle whiteText = TextStyle(color: whiteColor);

///custom input/field decoration
InputDecoration inputDecoration = InputDecoration(
  filled: false,
  hoverColor: Colors.white,
  focusColor: Colors.white,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
  ),
  hintStyle: TextStyle(color: whiteColor),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: whiteColor, width: 2.0),
  ),
);

enum QuestionsType { open, oneChoice, multipleChoice }
///map keys of the forms
const String questionKey = "question";
const String typeKey = "type";
const String ansersKey = "ansers";
///questions examples of COVID-19 forms
const List<Map<String, dynamic>> forms = <Map<String, dynamic>>[
  {
    questionKey: "Ces dernières 48 heures, qu'elle a été votre température la plus élevée ?",
    typeKey: QuestionsType.open
  },
  {
    questionKey: "Avez-vous été en contact étroit avec un cas confirmé de coronavirus ?",
    typeKey: QuestionsType.oneChoice
  },
  {
    questionKey: "Avez-vous voyagé à l'étranger ou fait une croisière ?",
    typeKey: QuestionsType.oneChoice,
  },
  {
    questionKey: "Avez-vous eu l'un des symptômes suivants au cours des dernières 24 heures",
    typeKey: QuestionsType.multipleChoice,
    ansersKey: <String>["Toux", "Essoufflement ou difficulté à respirer"],
  },
  {
    questionKey: "OU au moins DEUX des symptômes suivants au cours des dernières 24 heures",
    typeKey: QuestionsType.multipleChoice,
    ansersKey: <String>[
      "Douleur musculaire",
      "Mal de tête",
      "Nouvelle perte de goût ou d'odeur",
      "Gorge irritée"
    ],
  },
  {
    questionKey: "Avez-vous une maladie cardiaque ou vasculaire ?",
    typeKey: QuestionsType.oneChoice,
  },
  {
    questionKey: "Avez-vous une maladie respiratoire ?",
    typeKey: QuestionsType.oneChoice,
  },
  {
    questionKey: "Indiquez votre poids et votre taille :",
    typeKey: QuestionsType.open,
  }
];
