import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signalini/components/alert_widget.dart';
import 'package:signalini/models/user.dart';
import 'package:signalini/screens/home/home_page.dart';
import 'package:signalini/screens/userinfo/userinfo_page.dart';

/// class of authentification functions with singleton pattren
class AuthService {
  FirebaseAuth _firebaseAuth;
  GoogleSignIn _googleSignIn;

  ///class instance (singleton pattren)
  static AuthService instance = AuthService._();

  AuthService._() {
    _firebaseAuth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  ///login with email and password
  void loginEmail(BuildContext context, String email, String password) async {
    try {
      AlertWidget.circularProgressIndicator(context);
      final AuthResult authResult =
          await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      if (authResult.user != null) {
        Navigator.pushNamed(context, HomePage.id);
      }
    } catch (e) {
      Navigator.pop(context);
      AlertWidget.showError(context, e.toString());
    }
  }

  ///registre with email and password
  void registreEmail(BuildContext context, String email, String password) async {
    try {
      AlertWidget.circularProgressIndicator(context);
      final AuthResult authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      if (authResult.user != null) {
        Navigator.pushNamed(context, UserInfoPage.id);
      }
    } catch (e) {
      Navigator.pop(context);
      AlertWidget.showError(context, e.toString());
    }
  }

  ///login with Google account
  void loginGoogle(BuildContext context) async {
    try {
      AlertWidget.circularProgressIndicator(context);
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      final AuthResult authResult = await _firebaseAuth.signInWithCredential(authCredential);
      assert(!authResult.user.isAnonymous);
      assert(await authResult.user.getIdToken() != null);
      Navigator.pop(context);
      if (authResult.user != null) {
        Navigator.pushNamed(context, UserInfoPage.id);
      }
    } catch (e) {
      Navigator.pop(context);
      AlertWidget.showError(context, e.toString());
    }
  }

  ///get the id of the current user
  Future<String> getUserID() async {
    String id;
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      if (user != null) {
        id = user.uid;
      }
      return id;
    } catch (e) {
      debugPrint(e.toString());
    }
    return id;
  }

  ///get Current user info
  Future<User> getUserInfo() async {
    User user;
    try {
      String id = await getUserID();
      DocumentSnapshot document =
          await Firestore.instance.collection("users").document(id).get();
      if (document.data != null) {
        print(id);
        print(document.data.toString());
        user = User.fromJson(document.data);
      }
      return user;
    } catch (e) {
      return user;
    }
  }

  ///logout from google
  void logoutGoogle() async {
    await _googleSignIn.signOut();
  }

  ///logout from Gmail & password
  void logoutEmail() async {
    await _firebaseAuth.signOut();
  }
}
