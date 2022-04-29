import 'package:audioplayers/audioplayers.dart' as Audio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import "package:myapp/lessons_1.dart";
import "package:myapp/Homepage.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/carousel.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: <Widget>[
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.close_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }),
            ),
            const Expanded(child: Text("")),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Builder(
                builder: (context) => IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    }),
              ),
            ),
            Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourthRoute()),
                    );
                  }),
            ),
          ])),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          ThirdRoutePage1(),
          ThirdRoutePage2(),
        ],
      ),
    );
  }
}

class ThirdRoutePage1 extends StatelessWidget {
  ThirdRoutePage1({Key? key}) : super(key: key);

  List carousel = [
    CarouselLetter("A", "alphabet/a.m4a"),
    CarouselLetter("B", "alphabet/b.m4a"),
    CarouselLetter("C", "alphabet/c.m4a"),
    CarouselLetter("D", "alphabet/d.m4a"),
    CarouselLetter("E", "alphabet/e.m4a"),
    CarouselLetter("F", "alphabet/f.m4a"),
    CarouselLetter("G", "alphabet/g.m4a"),
    CarouselLetter("H", "alphabet/h.m4a"),
    CarouselLetter("I", "alphabet/i.m4a"),
    CarouselLetter("J", "alphabet/j.m4a"),
    CarouselLetter("K", "alphabet/k.m4a"),
    CarouselLetter("L", "alphabet/l.m4a"),
    CarouselLetter("M", "alphabet/m.m4a"),
    CarouselLetter("N", "alphabet/n.m4a"),
    CarouselLetter("O", "alphabet/o.m4a"),
    CarouselLetter("P", "alphabet/p.m4a"),
    CarouselLetter("Q", "alphabet/q.m4a"),
    CarouselLetter("R", "alphabet/r.m4a"),
    CarouselLetter("S", "alphabet/s.m4a"),
    CarouselLetter("T", "alphabet/t.m4a"),
    CarouselLetter("U", "alphabet/u.m4a"),
    CarouselLetter("V", "alphabet/v.m4a"),
    CarouselLetter("W", "alphabet/w.m4a"),
    CarouselLetter("X", "alphabet/x.m4a"),
    CarouselLetter("Y", "alphabet/y.m4a"),
    CarouselLetter("Z", "alphabet/z.m4a"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Practicing The Alphabet",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(""),
              const Text(
                  "Tap each letter to the French Pronunciation of the letter.", // To DO: Implemented the audio files
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 18),
              CarouselSlider.builder(
                // To be parsed out
                options: CarouselOptions(
                    height: 154, pageSnapping: false, viewportFraction: .42),
                itemCount: carousel.length,
                itemBuilder: (context, index, realIndex) {
                  return buildLetter(carousel[index], index);
                },
              ),
              const SizedBox(height: 18),
              const Text(
                  "Swipe left to record each letter!", // To Do: Make page to record letters, right not cannot swipe left
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLetter(carousel, int index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      child: carousel,
    ),
  );
}

class ThirdRoutePage2 extends StatefulWidget {
  @override
  _ThirdRoutePage2State createState() => _ThirdRoutePage2State();
}

class _ThirdRoutePage2State extends State<ThirdRoutePage2> {
  /**
   * RECORDER
   */
  final recorder= FlutterSoundRecorder();
  bool isRecorderReady = false;

  //Initialize and dispose recorder when no longer needed
  @override
  void initState(){
    super.initState();

    initRecorder();

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state){
      setState(() {
        isPlaying = state == Audio.PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration){
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition){
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio(String? path) async{
    final audioFile = File(path!);

    audioPlayer.setUrl(audioFile.path, isLocal: true);
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    audioPlayer.dispose();

    super.dispose();
  }

  //When initializing, request permission to record
  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();

    isRecorderReady = true;
    //how often the timer for the recording is updated
    recorder.setSubscriptionDuration(
        const Duration(milliseconds: 500),
    );
  }

  Future record() async {
    if (!isRecorderReady) return;

    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print('Recorded audio: $audioFile');

    setAudio(path);
  }

  /**
   * AUDIOPLAYER
   */
  final audioPlayer = Audio.AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;



  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recordings",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(""),
            const Text(
                "Tap the record button to start a voice memo.", // TODO: Implemented the audio files
                style: TextStyle(fontSize: 18)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SliderTheme(
                    child: Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        activeColor: const Color(0xff006cff),
                        onChanged: (value) async{
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);
                        }),
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: SliderComponentShape.noThumb,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        iconSize: 30,
                        color: const Color(0xff006cff),
                        onPressed: () async{},
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          iconSize: 15,
                          onPressed: () async {
                            if (isPlaying) {
                              await audioPlayer.pause();
                            }else{
                              await audioPlayer.resume();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder<RecordingDisposition>(
                    stream: recorder.onProgress,
                    builder: (context, snapshot) {
                      final duration = snapshot.hasData
                          ? snapshot.data!.duration
                          : Duration.zero;

                      return Text('${duration.inSeconds} s', style: const TextStyle(color: Colors.black26),);
                    }
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    child: recorder.isRecording ? Container(
                      width: 28,
                      height: 28,
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          color: const Color(0xffff7b66),
                        ),
                      ),
                    ) : Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Icon(
                        Icons.fiber_manual_record_rounded,
                        color: Color(0xffff7b66),
                      ),
                    ),
                    onPressed: () async {
                      if (recorder.isRecording) {
                        await stop();
                      }else{
                        await record();
                      }

                      setState(() {

                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}