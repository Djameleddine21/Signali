import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:signalini/components/alert_widget.dart';
import 'package:signalini/screens/home/home_page.dart';
import 'package:signalini/services/auth_service.dart';

///manage user info with singleton pattren
class UserService {

  ///firestore instance
  Firestore _firestore;

  ///unique instance for this class (singleton pattren)
  static UserService instance = UserService._();
  
  UserService._(){
    _firestore = Firestore.instance;
  }

  ///create User inofo document
  void createUser(BuildContext context,Map<String, dynamic> userMap) async {
    try {
      AlertWidget.circularProgressIndicator(context);
      ///get User id
      String userID = await AuthService.instance.getUserID();
      userMap.putIfAbsent("user_id", () => userID);
      await _firestore.collection("users").document().setData(userMap);
      Navigator.popAndPushNamed(context, HomePage.id);
      
    } catch (e) {
      Navigator.pop(context);
      AlertWidget.showError(context, e.toString());
    }
  }
}
