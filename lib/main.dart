import 'package:flutter/material.dart';
import 'package:media_player/controllers/audio_controller.dart';
import 'package:media_player/controllers/video_controller.dart';
import 'package:media_player/utils/my_page_route.dart';
import 'package:media_player/views/screens/home_page.dart';
import 'package:media_player/views/screens/song_details_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioController(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        sliderTheme: SliderThemeData(
          thumbShape: null,
        ),
      ),
      routes: {
        MyPageRoute.home: (context) => HomePage(),
        MyPageRoute.songDetailsPage: (context) => SongDetailsPage(),
      },
    );
  }
}
