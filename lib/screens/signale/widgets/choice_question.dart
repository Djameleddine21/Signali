import 'package:flutter/material.dart';
import 'package:signalini/utils/constants.dart';

class ChoiceQuestion extends StatefulWidget {
  final String question;

  ChoiceQuestion({@required this.question}) : assert(question != null);

  @override
  _ChoiceQuestionState createState() => _ChoiceQuestionState();
}

class _ChoiceQuestionState extends State<ChoiceQuestion> {
  List<bool> checked = <bool>[];

  @override
  void initState() { 
    super.initState();
    checked = <bool>[false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.question, style: whiteText.copyWith(fontSize: 20.0)),
          CheckboxListTile(
            activeColor: whiteColor,
            checkColor: greenDeepColor,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Oui", style: whiteText),
            value: checked[0],
            onChanged: (value) {
              setState(() {
                checked.setAll(0, [value, false, false]);
              });
            },
          ),
          CheckboxListTile(
            activeColor: whiteColor,
            checkColor: greenDeepColor,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Non", style: whiteText),
            value: checked[1],
            onChanged: (value) {
              setState(() {
                checked.setAll(0, [false, value, false]);
              });
            },
          ),
          CheckboxListTile(
            activeColor: whiteColor,
            checkColor: greenDeepColor,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Ne sait pas", style: whiteText),
            value: checked[2],
            onChanged: (value) {
              setState(() {
                checked.setAll(0, [false, false, value]);
              });
            },
          ),
        ],
      ),
    );
  }
}
