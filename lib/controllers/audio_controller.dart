import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:media_player/utils/audio_utils.dart';

class AudioController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration.zero;
  Stream<Duration> position = const Stream.empty();

  AudioController() {
    assetsAudioPlayer
        .open(
          Playlist(
            audios: [
              Audio(
                audioPath + Song.audio,
              ),
              Audio(
                audioPath + Song.audio1,
              ),
            ],
          ),
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
    await assetsAudioPlayer.next();
    notifyListeners();
  }

  previous() async {
    await assetsAudioPlayer.previous();
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
    return assetsAudioPlayer.isPlaying;
  }

  get positionStream {
    return assetsAudioPlayer.currentPosition;
  }
}
