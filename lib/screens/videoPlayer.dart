import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  final String url;

  const VideoApp({Key key, this.url}) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Widget playerWidget;

  @override
  void initState() {
    super.initState();
    initVideo();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  Future<void> initVideo() async {
    this.videoPlayerController = VideoPlayerController.network(widget.url);
    await videoPlayerController.initialize();

    this.chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
    );

    this.videoPlayerController.addListener(() {
      var videoPlayerValue = this.videoPlayerController.value;
      if (!videoPlayerValue.isPlaying &&
          videoPlayerValue.position.inSeconds >=
              videoPlayerValue.duration.inSeconds) {
        Navigator.of(context).pop();
      }
      setState(() {});
    });

    playerWidget = Chewie(
      controller: chewieController,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: this.videoPlayerController.value.isInitialized
              ? this.playerWidget
              : Container(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
