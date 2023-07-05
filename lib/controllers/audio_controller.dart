import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:media_player/utils/audio_utils.dart';

class AudioController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration.zero;

  AudioController() {
    assetsAudioPlayer
        .open(
          Audio(
            audioPath + Song.audio,
          ),
          autoStart: false,
        )
        .then(
          (value) => duration = assetsAudioPlayer.current.value!.audio.duration,
        );
    next();
    assetsAudioPlayer
        .open(
          Audio(
            audioPath + Song.audio1,
          ),
          autoStart: false,
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
    await assetsAudioPlayer.next(
      stopIfLast: true,
    );
    notifyListeners();
  }

  previous() async {
    await assetsAudioPlayer.previous(
      keepLoopMode: true,
    );
    notifyListeners();
  }

  pause() async {
    await assetsAudioPlayer.pause();
    notifyListeners();
  }

  get isPlaying {
    return assetsAudioPlayer.isPlaying.value;
    notifyListeners();
  }

  seek({required int seconds}) async {
    await assetsAudioPlayer.seek(
      Duration(seconds: seconds),
    );
    notifyListeners();
  }

  get currentPosition {
    return assetsAudioPlayer.currentPosition;
  }
}
