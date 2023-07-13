import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_player/controllers/video_controller.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<VideoController>(builder: (context, provider, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: provider.videoPlayerController.value.aspectRatio,
              child: Chewie(
                controller: provider.chewieController,
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    provider.videoIndex(index: index);
                  },
                  title: Text("Video:- ${index + 1}"),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
