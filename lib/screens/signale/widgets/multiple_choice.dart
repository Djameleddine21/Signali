import 'package:flutter/material.dart';
import 'package:signalini/services/form_service.dart';
import 'package:signalini/utils/constants.dart';

class MultipleChoice extends StatefulWidget {
  final String mainQuestion;
  final List<String> questions;
  final int index;
  final FormService formService;

  const MultipleChoice(
      {@required this.mainQuestion,
      @required this.questions,
      @required this.index,
      @required this.formService})
      : assert(mainQuestion != null),
        assert(questions != null),
        assert(formService != null);

  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  List<bool> checked = <bool>[];

  @override
  void initState() {
    super.initState();
    for (var _ in widget.questions) {
      checked.add(false);
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
          Text(widget.mainQuestion, style: whiteText.copyWith(fontSize: 20.0)),
          for (var i = 0; i < widget.questions.length; i++)
            CheckboxListTile(
              activeColor: whiteColor,
              checkColor: greenDeepColor,
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(widget.questions[i], style: whiteText),
              value: checked[i],
              onChanged: (value) {
                setState(() {
                  checked[i] = value;
                });
                if (checked[i]) {
                  if (widget.formService.reponses[widget.index] == null) {
                    widget.formService.reponses[widget.index] = <String>[widget.questions[i]];
                  } else if (!widget.formService.reponses[widget.index]
                      .contains(widget.questions[i])) {
                    widget.formService.reponses[widget.index].add(widget.questions[i]);
                  }
                } else {
                  widget.formService.reponses[widget.index].remove(widget.questions[i]);
                }
              },
            ),
        ],
      ),
    );
  }
}
