import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(const MaterialApp(home: VideoTest2(),));
}

class VideoTest2 extends StatefulWidget {
  const VideoTest2({Key? key}) : super(key: key);

  @override
  State<VideoTest2> createState() => _VideoTest2State();
}

class _VideoTest2State extends State<VideoTest2> {

  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

  ChewieController? chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoPlayerController.initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
      );
      setState(() {});
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: chewieController != null &&
            chewieController!
                .videoPlayerController.value.isInitialized ? Chewie(
          controller: chewieController!,
        ) : const CircularProgressIndicator(),
      ),
    );
  }
}
