import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:media_player/utils/audio_utils.dart';

class AudioController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration.zero;
  int index = 0;
  List<Audio> songList = [
    Audio(
      audioPath + Song.audio,
    ),
    Audio(
      audioPath + Song.audio1,
    ),
    Audio(
      audioPath + Song.audio2,
    ),
    Audio(
      audioPath + Song.audio3,
    ),
    Audio(
      audioPath + Song.audio4,
    ),
    Audio(
      audioPath + Song.audio5,
    ),
  ];

  AudioController() {
    init();
  }

  init() async {
    await assetsAudioPlayer
        .open(
          songList[index],
          autoStart: false,
          showNotification: true,
        )
        .then(
          (value) => duration = assetsAudioPlayer.current.value!.audio.duration,
        );
  }

  play() async {
    await assetsAudioPlayer.play();
    notifyListeners();
  }

  next() async {
    // await assetsAudioPlayer.next();
    await assetsAudioPlayer.stop();
    if (songList.length > index + 1) {
      index++;
      assetsAudioPlayer.stop();
    }
    init();
    play();
    notifyListeners();
  }

  changeIndex({required int index}) async {
    await assetsAudioPlayer.stop();
    this.index = index;
    init();
    play();
    notifyListeners();
  }

  previous() async {
    // await assetsAudioPlayer.previous();
    await assetsAudioPlayer.stop();
    if (index != 0) {
      index--;
    }
    init();
    play();
    notifyListeners();
  }

  pause() async {
    await assetsAudioPlayer.pause();
    notifyListeners();
  }

  seek({required int seconds}) async {
    await assetsAudioPlayer.seek(
      Duration(seconds: seconds),
    );
    notifyListeners();
  }

  get isPlaying {
    return assetsAudioPlayer.isPlaying.value;
  }

  get positionStream {
    return assetsAudioPlayer.currentPosition;
  }
}
