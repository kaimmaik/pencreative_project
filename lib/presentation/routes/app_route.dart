import 'package:flutter/material.dart';
import 'package:pencreative_project/presentation/screens/home_page.dart';
import 'package:pencreative_project/presentation/screens/my_signup_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const MySignUpPage());
    }
    return null;
  }
}
