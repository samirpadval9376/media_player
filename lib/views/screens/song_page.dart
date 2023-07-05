import 'package:flutter/material.dart';
import 'package:media_player/controllers/audio_controller.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AudioController>(builder: (context, provider, child) {
        return StreamBuilder(
            stream: provider.currentPosition,
            builder: (context, AsyncSnapshot<Duration> snapShot) {
              if (snapShot.hasData) {
                double currentPosition = snapShot.data!.inSeconds.toDouble();

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                        ),
                        overlayShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 8,
                        ),
                      ),
                      child: Slider(
                        thumbColor: Colors.white,
                        inactiveColor: Colors.deepPurple.shade400,
                        activeColor: Colors.white,
                        min: 0,
                        max: provider.duration.inSeconds.toDouble(),
                        value: currentPosition,
                        onChanged: (val) async {
                          await provider.seek(
                            seconds: val.toInt(),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            provider.previous();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.play();
                          },
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.pause();
                          },
                          icon: const Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.next();
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      }),
    );
  }
}
