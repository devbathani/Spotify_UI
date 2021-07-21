import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

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

class SpotifyMusicPage extends StatefulWidget {
  const SpotifyMusicPage({Key? key}) : super(key: key);

  @override
  _SpotifyMusicPageState createState() => _SpotifyMusicPageState();
}

class _SpotifyMusicPageState extends State<SpotifyMusicPage> {
  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Slider(
      value: position.inSeconds.toDouble(),
      max: musicLength.inSeconds.toDouble(),
      activeColor: Colors.black,
      inactiveColor: Color(0xff23241f),
      onChanged: (value) => this.position = position,
    );
  }

  bool playing = false;
  IconData playbtn = Icons.play_arrow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.greenAccent, Colors.blueGrey, Colors.black87]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  child: Container(
                    height: 22,
                    width: 22,
                    child: Image.asset(
                      'icon/arrow.png',
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      "PLAYING FROM SEARCH",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\"monte" ${'in Songs'}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 46,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                  child: Container(
                    height: 22,
                    width: 22,
                    child: Image.asset(
                      'icon/menu.png',
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 57,
            ),
            Container(
              height: 310,
              width: 310,
              child: Image.asset(
                'icon/song.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 63,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Middle",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'DJ Snake, Bipolar Sunshine',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffb3b2ad)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 78,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 21,
                      width: 21,
                      child: Image.asset(
                        'icon/heart.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                slider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Text(
                          "${position.inMinutes}: ${position.inSeconds.remainder(60)}",
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        width: 270,
                      ),
                      Text(
                        "${musicLength.inMinutes}: ${musicLength.inSeconds.remainder(60)}",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'icon/merge.png',
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 45,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    child: GestureDetector(
                      onTap: () {
                        AssetsAudioPlayer assetsAudioPlayer =
                            AssetsAudioPlayer();
                        assetsAudioPlayer.open(Audio("Assets/middle.mp3"));
                        if (!playing) {
                          setState(() {
                            playbtn = Icons.pause;
                            playing = true;
                          });
                        } else {
                          playbtn = Icons.play_arrow;
                          playing = false;
                        }
                      },
                      child: Icon(
                        playbtn,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 45,
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Icon(
                    Icons.repeat,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
