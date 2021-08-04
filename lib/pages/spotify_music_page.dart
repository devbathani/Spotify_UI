import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class SpotifyMusicPage extends StatefulWidget {
  const SpotifyMusicPage({Key? key}) : super(key: key);

  @override
  _SpotifyMusicPageState createState() => _SpotifyMusicPageState();
}

class _SpotifyMusicPageState extends State<SpotifyMusicPage> {
  Duration position = new Duration();
  Duration duration = new Duration();

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // SizedBox(
              //   height: 35,
              // ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 50,
                  // ),
                  Column(
                    children: [
                      Text(
                        "PLAYING FROM SEARCH",

                        // Implement google fonts instead.
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      Text(
                        '\"monte" ${'in Songs'}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: 46,
                  // ),
                  Container(
                    height: 22,
                    width: 22,
                    child: Image.asset(
                      'icon/menu.png',
                      color: Colors.white,
                      fit: BoxFit.cover,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(),
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
                      // child: Image.asset(
                      //   'icon/heart.png',
                      //   fit: BoxFit.cover,
                      // ),
                      child: Icon(Icons.favorite_outline),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Column(
                children: [
                  MySlider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      Text(
                          "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        width: 270,
                      ),
                      Text(
                        "${duration.inMinutes}:${duration.inSeconds.remainder(60)}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    // child: Image.asset(
                    //   'icon/merge.png',
                    //   color: Colors.white,
                    //   fit: BoxFit.cover,
                    // ),
                    child: Icon(
                      Icons.shuffle_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  // SizedBox(
                  //   width: 35,
                  // ),
                  Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 45,
                  ),
                  // SizedBox(
                  //   width: 22,
                  // ),
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
                        assetsAudioPlayer.open(
                          Audio("assets/middle.mp3"),
                          showNotification: true,
                        );
                        if (!playing) {
                          setState(() {
                            playbtn = Icons.pause;
                            playing = true;
                          });
                        } else {
                          assetsAudioPlayer.pause();
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
                  // SizedBox(
                  //   width: 22,
                  // ),
                  Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 45,
                  ),
                  // SizedBox(
                  //   width: 35,
                  // ),
                  Icon(
                    Icons.repeat,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({
    Key? key,
  }) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      // divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
