import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pencreative_project/logic/cubit/home_bloc.dart';
import 'package:pencreative_project/presentation/widgets/signup_widget.dart';
import 'package:pencreative_project/presentation/widgets/video_background_widget.dart';
import 'package:video_player/video_player.dart';

import 'package:pencreative_project/presentation/widgets/signin_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required VideoPlayerController controller,
  })  : _controller = controller,
        super(key: key);

  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeLoadedState) {
            if (state.hasAccount) {
              return Stack(children: [
                VideoBackgroundWidget(
                  controller: _controller,
                ),
                 const SignInWidget()
              ]);
            } else {
              return Stack(children: [
                VideoBackgroundWidget(
                  controller: _controller,
                ),
                 const SignUpWidget()
              ]);
            }
          }
          if (state is HomeNoInternetState) {
            return const Text('no internet :(');
          }
          return Container();
        },
      ),
    );
  }
}
