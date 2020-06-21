import 'package:flutter/material.dart';
import 'package:signalini/routes/routes.dart';
import 'package:signalini/screens/home/home_page.dart';

void main() => runApp(Signalini());

class Signalini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Signalini",
      initialRoute: HomePage.id,
      onGenerateRoute: Router.onGenerateRoute,
    );
  }
}
