import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/pages/login_page.dart';
import 'package:foodie_ui_kit/pages/qr_generate.dart';
import 'package:foodie_ui_kit/pages/register_page.dart';
import 'package:foodie_ui_kit/pages/root_app.dart';
import 'package:foodie_ui_kit/pages/topup_page.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = new Map<String, dynamic>();

  switch (setting.name) {
    case '/root_app':
      return MaterialPageRoute(builder: (context) => RootApp());
    case '/register_page':
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case '/login_page':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/qr_generate':
      return MaterialPageRoute(builder: (context) => GeneratePage());
    case '/topup_page':
      return MaterialPageRoute(builder: (context) => TopupPage());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(),
              ));
  }
}
