import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoBackgroundWidget extends StatelessWidget {
  const VideoBackgroundWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: controller.value.size.width,
          height: controller.value.size.height,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
