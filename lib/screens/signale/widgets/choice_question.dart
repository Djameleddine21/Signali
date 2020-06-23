import 'package:flutter/material.dart';
import 'package:signalini/services/form_service.dart';
import 'package:signalini/utils/constants.dart';

class ChoiceQuestion extends StatefulWidget {
  final String question;
  final int index;
  final FormService formService;

  ChoiceQuestion({
    @required this.question,
    @required this.index,
    @required this.formService,
  })  : assert(question != null),
        assert(formService != null);

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

  updateAnswer() {
    if ( ! checked.contains(true)) {
      widget.formService.addAnswer(widget.index, null);
    } else {
      switch (checked.indexOf(true)) {
        case 0:
          widget.formService.addAnswer(widget.index, "Oui");
          break;
        case 1:
          widget.formService.addAnswer(widget.index, "Non");
          break;
        case 2:
          widget.formService.addAnswer(widget.index, "Ne sait pas");
          break;
        default:
          break;
      }
    }
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
                if (value != false) {
                  widget.formService.addAnswer(widget.index, "Oui");
                }
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
                if (value != false) {
                  widget.formService.addAnswer(widget.index, "Non");
                }
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
                if (value != false) {
                  widget.formService.addAnswer(widget.index, "Ne sait pas");
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
