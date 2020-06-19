import 'package:flutter/material.dart';
import 'package:signalini/utils/constants.dart';

class OpenQuestionWidget extends StatefulWidget {
  final String question;

  OpenQuestionWidget({@required this.question}) : assert(question != null);

  @override
  _OpenQuestionWidgetState createState() => _OpenQuestionWidgetState();
}

class _OpenQuestionWidgetState extends State<OpenQuestionWidget> {
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
