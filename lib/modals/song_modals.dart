import 'package:media_player/utils/audio_utils.dart';
import 'package:media_player/utils/image_utils.dart';

class SongModal {
  final String titles;
  final String artistName;
  final String path;
  final String image;

  SongModal({
    required this.titles,
    required this.artistName,
    required this.path,
    required this.image,
  });

  static List<SongModal> allSongs = [
    SongModal(
      titles: "Hanuman Chalisa",
      artistName: "Pawandeep Rajan",
      path: audioPath + Song.audio,
      image: imagePath + Image.image,
    ),
    SongModal(
      titles: "Apna Bana Le",
      artistName: "Arijit Singh",
      path: audioPath + Song.audio1,
      image: imagePath + Image.image1,
    ),
    SongModal(
      titles: "Aur Kya Chahiye",
      artistName: "Arijit Singh",
      path: audioPath + Song.audio2,
      image: imagePath + Image.image2,
    ),
    SongModal(
      titles: "Tu Aake Dekhle",
      artistName: "King",
      path: audioPath + Song.audio3,
      image: imagePath + Image.image3,
    ),
    SongModal(
      titles: "O Bedardeya",
      artistName: "Arijit Singh",
      path: audioPath + Song.audio4,
      image: imagePath + Image.image4,
    ),
    SongModal(
      titles: "Hawayein",
      artistName: "Arijit Singh",
      path: audioPath + Song.audio5,
      image: imagePath + Image.image5,
    ),
  ];
}
