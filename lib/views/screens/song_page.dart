import 'package:flutter/material.dart';
import 'package:media_player/controllers/audio_controller.dart';
import 'package:media_player/modals/song_modals.dart';
import 'package:media_player/utils/my_page_route.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<SongModal> songs = SongModal.allSongs;
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: const Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favourite",
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Enjoy your favourite music",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "Trending Music",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: s.height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MyPageRoute.songDetailsPage,
                              arguments: index,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  width: s.width * 0.55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        songs[index].image,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: s.width * 0.46,
                                  margin: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white.withOpacity(0.85),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8,
                                    ),
                                    child: Consumer<AudioController>(
                                        builder: (context, pro, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            songs[index].titles,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              pro.changeIndex(index: index);

                                              // if (pro.isPlaying) {
                                              //   pro.pause();
                                              // } else {
                                              //   pro.play();
                                              // }
                                            },
                                            icon: const Icon(
                                              Icons.play_circle,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
