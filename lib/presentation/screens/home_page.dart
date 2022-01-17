import 'package:flutter/material.dart';
import 'package:pencreative_project/core/theme/app_theme.dart';
import 'package:pencreative_project/presentation/routes/app_route.dart';
import 'package:pencreative_project/presentation/screens/home_screen.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = controller();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PenCreative Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
      home: HomeScreen(controller: _controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  VideoPlayerController controller() {
    return VideoPlayerController.network(
        'https://vid.cdn-website.com/db31a942/videos/hyHUXYGdRfWSMTytsUDL_Logo+Pen-v.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }
}
