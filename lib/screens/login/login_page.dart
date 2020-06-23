import 'package:flutter/material.dart';
import 'package:signalini/screens/home/home_page.dart';
import 'package:signalini/services/auth_service.dart';
import 'package:signalini/utils/constants.dart';
import 'package:signalini/validator/validator.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle selectedText = whiteText.copyWith(fontSize: 25.0, fontWeight: FontWeight.w600);
  int selectedSign;
  bool showPassowrd;
  bool _firstTap;
  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //input controllers
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    selectedSign = 0;
    showPassowrd = false;
    _firstTap = false;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showPassord() {
    this.setState(() {
      showPassowrd = !showPassowrd;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

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
              children: <Widget>[
                //logo
                Container(
                  height: 100,
                  width: 200,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  child: Image.asset(iconPath + "iss.png", height: 100, width: 200.0),
                ),
                //SignIn or SignUp
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedSign = 0;
                        });
                      },
                      child: Text("S'identifier",
                          style: selectedSign == 0 ? selectedText : whiteText),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedSign = 1;
                        });
                      },
                      child: Text("S'inscrire",
                          style: selectedSign == 1 ? selectedText : whiteText),
                    )
                  ],
                ),
                //email input
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  child: TextFormField(
                    cursorColor: whiteColor,
                    controller: emailController,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'E-mail',
                      prefixIcon: Icon(Icons.mail_outline, color: whiteColor),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validator.validateEmail,
                    autovalidate: _firstTap,
                  ),
                ),
                //password input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: TextFormField(
                    controller: passwordController,
                    cursorColor: whiteColor,
                    obscureText: !showPassowrd,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Mot de passe',
                      prefixIcon: Icon(Icons.vpn_key, color: whiteColor),
                      suffixIcon: showPassowrd
                          ? InkWell(
                              onTap: _showPassord,
                              child: Icon(Icons.visibility, color: whiteColor),
                            )
                          : InkWell(
                              onTap: _showPassord,
                              child: Icon(Icons.visibility_off, color: whiteColor),
                            ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validator.validatePassword,
                    autovalidate: _firstTap,
                  ),
                ),
                //login button
                InkWell(
                  onTap: () {
                    if (!_firstTap) {
                      setState(() {
                        _firstTap = true;
                      });
                    }
                    if (_formKey.currentState.validate()) {
                      if (selectedSign == 0) {
                        AuthService.instance.loginEmail(
                            context, emailController.text, passwordController.text);
                      } else if (selectedSign == 1) {
                        AuthService.instance.registreEmail(
                            context, emailController.text, passwordController.text);
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    height: 50.0,
                    color: whiteColor.withOpacity(0.2),
                    alignment: Alignment.center,
                    child: Text(
                      selectedSign == 0 ? "S'identifier" : "S'inscrire",
                      style: whiteText.copyWith(fontSize: 25.0),
                    ),
                  ),
                ),
                // OR
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 2.0,
                      width: _width * 0.2,
                      color: whiteColor.withOpacity(0.2),
                      margin: const EdgeInsets.only(right: 10.0),
                    ),
                    Text("ou", style: whiteText),
                    Container(
                      height: 2.0,
                      width: _width * 0.2,
                      color: whiteColor.withOpacity(0.2),
                      margin: const EdgeInsets.only(left: 10.0),
                    ),
                  ],
                ),
                //Sign in with Google
                InkWell(
                  onTap: () {
                    AuthService.instance.loginGoogle(context);
                    // Navigator.pushNamed(context, UserInfoPage.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    height: 50.0,
                    color: redColor.withOpacity(0.75),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(iconPath + 'google.png', height: 40.0),
                        SizedBox(width: 10.0),
                        Text(
                          "Se connecter avec Google",
                          style: whiteText.copyWith(fontSize: 18.0),
                        ),
                      ],
                    ),
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
