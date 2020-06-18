import 'package:flutter/material.dart';
import 'package:signalini/screens/home/home_page.dart';
import 'package:signalini/screens/login/login_page.dart';
import 'package:signalini/screens/signale/signale_page.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.id:
        return MaterialPageRoute(builder: (_) => HomePage());
      case LoginPage.id:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case SignalePage.id:
        return MaterialPageRoute(builder: (_) => SignalePage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
