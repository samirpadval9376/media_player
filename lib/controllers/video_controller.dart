import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:media_player/utils/video_utils.dart';
import 'package:video_player/video_player.dart';

class VideoController extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  List<String> videos = [
    videoPath + Videos.video1,
    videoPath + Videos.video2,
    videoPath + Videos.video3,
  ];

  VideoController() {
    init();
  }

  init({int index = 0}) {
    videoPlayerController = VideoPlayerController.asset(
      videos[index],
    )..initialize().then((value) {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: videoPlayerController.value.aspectRatio,
          autoPlay: false,
        );
        notifyListeners();
      });
  }

  videoIndex({required int index}) {
    videoPlayerController.pause();
    chewieController.pause();
    init(index: index);
  }

  play() async {
    await videoPlayerController.play();
    notifyListeners();
  }

  pause() async {
    await videoPlayerController.pause();
    notifyListeners();
  }
}
