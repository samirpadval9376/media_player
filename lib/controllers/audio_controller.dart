import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:media_player/utils/audio_utils.dart';

class AudioController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration.zero;

  AudioController() {
    assetsAudioPlayer.open(
      Audio(
        audioPath + Song.audio,
      ),
      autoStart: false,
    );
  }

  play() {
    assetsAudioPlayer.play();
    notifyListeners();
  }

  pause() {
    assetsAudioPlayer.pause();
    notifyListeners();
  }

  get isPlaying {
    assetsAudioPlayer.isPlaying;
    notifyListeners();
  }
}
