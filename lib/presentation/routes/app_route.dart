import 'package:flutter/material.dart';
import 'package:pencreative_project/presentation/screens/home_screen.dart';

import 'package:video_player/video_player.dart';

class AppRouter {
  final VideoPlayerController controller;
  AppRouter({required this.controller});

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => HomeScreen(controller: controller));
    }
    return null;
  }
}
