import 'package:flutter/material.dart';
import 'package:signalini/screens/userinfo/userinfo_page.dart';
import 'package:signalini/utils/constants.dart';
import 'package:signalini/validator/validator.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle selectedText = whiteText.copyWith(fontSize: 25.0, fontWeight: FontWeight.w600);
  int selectedSign = 0;
  bool showPassowrd = false;
  bool _firstTap = false;
  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      child:
                          Text("SIGN IN", style: selectedSign == 0 ? selectedText : whiteText),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedSign = 1;
                        });
                      },
                      child:
                          Text("SIGN UP", style: selectedSign == 1 ? selectedText : whiteText),
                    )
                  ],
                ),
                //email input
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  child: TextFormField(
                    cursorColor: whiteColor,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'E-mail',
                      prefixIcon: Icon(Icons.mail_outline, color: whiteColor),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validator.validateEmail,
                    autovalidate: _firstTap ? true : false,
                  ),
                ),
                //password input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: TextFormField(
                    cursorColor: whiteColor,
                    obscureText: !showPassowrd,
                    style: TextStyle(color: whiteColor),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Password',
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
                    autovalidate: _firstTap ? true : false,
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
                    _formKey.currentState.validate();
                    //Navigator.pushNamed(context, UserInfoPage.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    height: 50.0,
                    color: whiteColor.withOpacity(0.2),
                    alignment: Alignment.center,
                    child: Text("Sign in", style: whiteText.copyWith(fontSize: 25.0)),
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
                    Text("or", style: whiteText),
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
                    Navigator.pushNamed(context, UserInfoPage.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    height: 50.0,
                    color: redColor,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(iconPath + 'google.png', height: 40.0),
                        SizedBox(width: 10.0),
                        Text("Sign in with Google", style: whiteText.copyWith(fontSize: 18.0)),
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
