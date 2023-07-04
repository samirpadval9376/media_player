import 'package:flutter/material.dart';
import 'package:media_player/views/screens/song_page.dart';
import 'package:media_player/views/screens/video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, val) => [
        SliverAppBar(
          title: const Text(
            "Media Player",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          pinned: true,
          floating: true,
          snap: true,
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.music_note_sharp,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Songs"),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.video_library_outlined,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Vidos"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      body: TabBarView(
        controller: tabController,
        children: const [
          SongPage(),
          VideoPage(),
        ],
      ),
    ));
  }
}
