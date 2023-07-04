import 'package:flutter/material.dart';
import 'package:media_player/controllers/audio_controller.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AudioController>(builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              min: 0,
              max: provider.duration.inSeconds.toDouble(),
              value: provider.assetsAudioPlayer.currentPosition.value.inSeconds
                  .toDouble(),
              onChanged: (val) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    provider.play();
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.pause();
                  },
                  icon: const Icon(
                    Icons.pause,
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
