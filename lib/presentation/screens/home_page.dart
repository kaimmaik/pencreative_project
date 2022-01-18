import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pencreative_project/core/services/connectivity_service.dart';
import 'package:pencreative_project/core/theme/app_theme.dart';
import 'package:pencreative_project/logic/cubit/home_bloc.dart';
import 'package:pencreative_project/logic/cubit/theme_cubit.dart';
import 'package:pencreative_project/presentation/routes/app_route.dart';
import 'package:pencreative_project/presentation/screens/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    _controller = controller();
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  late VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) =>
                HomeBloc(connectivityService: ConnectivityService()),
          ),
        ],
        child: Builder(
          builder: (context) {
            return Sizer(builder: (context, constraints, orientation) {
              return MaterialApp(
                title: 'PenCreative Demo',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode:
                    context.select((ThemeCubit cubit) => cubit.state.themeMode),
                debugShowCheckedModeBanner: false,
                onGenerateRoute:
                    AppRouter(controller: _controller).onGenerateRoute,
                home: HomeScreen(controller: _controller),
              );
            });
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    _controller.dispose();
  }

  VideoPlayerController controller() {
    return VideoPlayerController.network(
        'https://vid.cdn-website.com/db31a942/videos/hyHUXYGdRfWSMTytsUDL_Logo+Pen-v.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }
}
