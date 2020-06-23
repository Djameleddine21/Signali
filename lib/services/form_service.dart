import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signalini/components/alert_widget.dart';
import 'package:signalini/screens/home/home_page.dart';
import 'package:signalini/services/auth_service.dart';

///singelton class of Fomr functions
class FormService {
  Firestore _firestore;
  List<dynamic> reponses;

  FormService._() {
    reponses = <dynamic>[null, null, null, <String>[], <String>[], null, null, null];
    _firestore = Firestore.instance;
  }

  static FormService instance = FormService._();

  void addAnswer(int index, dynamic reponse) {
    reponses[index] = reponse;
  }

  void submitAnswer(BuildContext context) async {
    String id;
    try {
      AlertWidget.circularProgressIndicator(context);
      id = await AuthService.instance.getUserID();
      Map<String, dynamic> map = <String, dynamic>{};
      for (var i = 0; i < this.reponses.length; i++) {
        map.putIfAbsent('${i + 1}', () => this.reponses[i]);
      }
      map.putIfAbsent("user_id", () => id);
      await _firestore.collection("reponses").document().setData(map);
      Navigator.popAndPushNamed(context, HomePage.id);
    } catch (e) {
      Navigator.pop(context);
    }
  }
}
