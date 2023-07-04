import 'package:flutter/material.dart';
import 'package:media_player/controllers/audio_controller.dart';
import 'package:media_player/views/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioController(),
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
      home: HomePage(),
    );
  }
}
