import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_player/utils/audio_utils.dart';

class AudioController extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  Duration duration = Duration.zero;
  Stream<Duration> position = const Stream.empty();

  AudioController() {
    final playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      shuffleOrder: DefaultShuffleOrder(),
      children: [
        AudioSource.asset(
          audioPath + Song.audio,
        ),
        AudioSource.asset(
          audioPath + Song.audio1,
        ),
      ],
    );
    player
        .setAudioSource(
          playlist,
          initialIndex: 0,
          initialPosition: player.duration,
        )
        .then((value) => duration = player.duration!);
  }

  play() async {
    await player.play();
    notifyListeners();
  }

  next() async {
    await player.seekToNext();
    notifyListeners();
  }

  previous() async {
    await player.seekToPrevious();
    notifyListeners();
  }

  pause() async {
    await player.pause();
    notifyListeners();
  }

  seek({required int seconds}) async {
    await player.seek(
      Duration(seconds: seconds),
    );
    notifyListeners();
  }

  get isPlaying {
    return player.playingStream;
  }

  get positionStream {
    return player.positionStream;
  }
}
