import 'package:flutter/material.dart';
import 'package:media_player/controllers/audio_controller.dart';
import 'package:media_player/modals/song_modals.dart';
import 'package:provider/provider.dart';

class SongDetailsPage extends StatelessWidget {
  const SongDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800,
            Colors.deepPurple.shade300,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: s.height,
              width: 365,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    SongModal.allSongs[index].image,
                  ),
                ),
              ),
            ),
            Container(
              height: s.height * 0.15,
              width: double.infinity,
              child: Consumer<AudioController>(
                  builder: (context, provider, child) {
                return StreamBuilder(
                    stream: provider.positionStream,
                    initialData: provider.duration,
                    builder: (context, AsyncSnapshot<Duration> snapShot) {
                      if (snapShot.hasData) {
                        double positionStream =
                            snapShot.data!.inSeconds.toDouble();

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
                                value: positionStream,
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
                                    provider.changeIndex(index: index);
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
            ),
          ],
        ),
      ),
    );
  }
}
