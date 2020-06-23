import 'package:flutter/material.dart';
import 'package:signalini/services/form_service.dart';
import 'package:signalini/utils/constants.dart';

class OpenQuestionWidget extends StatefulWidget {
  final String question;
  final int index;
  final FormService formService;

  OpenQuestionWidget(
      {@required this.question, @required this.index, @required this.formService})
      : assert(question != null),
        assert(formService != null);

  @override
  _OpenQuestionWidgetState createState() => _OpenQuestionWidgetState();
}

class _OpenQuestionWidgetState extends State<OpenQuestionWidget> {
  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(widget.question, style: whiteText.copyWith(fontSize: 20.0)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                widget.formService.addAnswer(widget.index, value);
              } else if (value == '' || value == null) {
                widget.formService.addAnswer(widget.index, null);
              }
            },
            cursorColor: whiteColor,
            style: TextStyle(color: whiteColor),
            decoration: inputDecoration.copyWith(
              hintText: 'Réponse',
            ),
            maxLines: 5,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
