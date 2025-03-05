import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videointro extends StatefulWidget {
  const Videointro({super.key});

  @override
  State<Videointro> createState() => _VideointroState();
}

class _VideointroState extends State<Videointro> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.asset('videos/Edit_vid.mp4'));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1D1E33),
          title: const Text("Intro Video"),
          centerTitle: true,
        ),
        body: Center(
          child: AspectRatio(aspectRatio: 16/9,child: FlickVideoPlayer(flickManager: flickManager)),
        ));
  }
}
