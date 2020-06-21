import 'package:flutter/material.dart';
import 'package:signalini/models/user.dart';
import 'package:signalini/services/user_service.dart';
import 'package:signalini/utils/constants.dart';
import 'package:signalini/validator/validator.dart';

class UserInfoPage extends StatefulWidget {
  static const String id = '/userinfo';

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  //input controllers
  TextEditingController nomController;
  TextEditingController prenomController;
  TextEditingController numTelController;
  TextEditingController numSecSocController;

  //Form Key
  GlobalKey<FormState> _formKey;
  //true after first user tap to save button
  bool _firstTap;

  @override
  void initState() {
    super.initState();
    _firstTap = false;
    _formKey = GlobalKey<FormState>();
    nomController = TextEditingController();
    prenomController = TextEditingController();
    numTelController = TextEditingController();
    numSecSocController = TextEditingController();
  }

  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    numTelController.dispose();
    numSecSocController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          //gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[greenColor, greenDeepColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              children: <Widget>[
                //head title
                Text(
                  "User Info",
                  style: whiteText.copyWith(fontSize: 25.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                //nom input
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: nomController,
                    cursorColor: whiteColor,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Nom',
                    ),
                    keyboardType: TextInputType.text,
                    autovalidate: _firstTap,
                    validator: Validator.validateString,
                  ),
                ),
                //prenom input
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: prenomController,
                    cursorColor: whiteColor,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Prénom',
                    ),
                    keyboardType: TextInputType.text,
                    autovalidate: _firstTap,
                    validator: Validator.validateString,
                  ),
                ),
                //phone input
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: numTelController,
                    cursorColor: whiteColor,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Numéro de Téléphone',
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidate: _firstTap,
                    validator: Validator.validatePhone,
                  ),
                ),
                //number input
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: numSecSocController,
                    cursorColor: whiteColor,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Numéro de Sécurité Sociale',
                    ),
                    keyboardType: TextInputType.phone,
                    autovalidate: _firstTap,
                    validator: Validator.validateNumbers,
                  ),
                ),
                //save button
                InkWell(
                  onTap: () {
                    if (!_firstTap) {
                      setState(() {
                        _firstTap = true;
                      });
                    }
                    if (_formKey.currentState.validate()) {
                      final User user = User(
                        nom: nomController.text,
                        prenom: prenomController.text,
                        numSecSoc: numSecSocController.text,
                        numTel: numTelController.text,
                        isAdmin: false,
                      );
                      UserService.instance.createUser(context, user.toJson());
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: whiteColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5.0)),
                    alignment: Alignment.center,
                    child: Text("Enregistrer", style: whiteText.copyWith(fontSize: 24.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
