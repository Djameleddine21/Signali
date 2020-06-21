import 'package:flutter/material.dart';
import 'package:signalini/routes/routes.dart';
// import 'package:signalini/screens/login/login_page.dart';
import 'package:signalini/screens/userinfo/userinfo_page.dart';

void main() => runApp(Signalini());

class Signalini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Signalini",
      initialRoute: UserInfoPage.id,
      onGenerateRoute: Router.onGenerateRoute,
    );
  }
}
