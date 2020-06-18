import 'package:flutter/material.dart';
import 'package:signalini/screens/home/home_page.dart';
import 'package:signalini/utils/constants.dart';

class UserInfoPage extends StatefulWidget {
  static const String id = '/userinfo';

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[greenColor, greenDeepColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            children: <Widget>[
              Text(
                "User Info",
                style: whiteText.copyWith(fontSize: 25.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextFormField(
                  cursorColor: whiteColor,
                  style: TextStyle(color: whiteColor),
                  decoration: inputDecoration.copyWith(
                    hintText: 'Nom',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextFormField(
                  cursorColor: whiteColor,
                  style: TextStyle(color: whiteColor),
                  decoration: inputDecoration.copyWith(
                    hintText: 'Prénom',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextFormField(
                  cursorColor: whiteColor,
                  style: TextStyle(color: whiteColor),
                  decoration: inputDecoration.copyWith(
                    hintText: 'Numéro de Téléphone',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextFormField(
                  cursorColor: whiteColor,
                  style: TextStyle(color: whiteColor),
                  decoration: inputDecoration.copyWith(
                    hintText: 'Numéro de Sécurité Sociale',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  height: 50.0,
                  color: whiteColor.withOpacity(0.2),
                  alignment: Alignment.center,
                  child: Text("Enregistrer", style: whiteText.copyWith(fontSize: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
