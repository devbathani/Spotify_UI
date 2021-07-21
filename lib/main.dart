import 'package:flutter/material.dart';
import 'package:spotify_ui/pages/spotify_music_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpotifyMusicPage(),
    );
  }
}
