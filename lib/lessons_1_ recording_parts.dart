import 'package:audioplayers/audioplayers.dart' as Audio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

//TODO #1: Make a separate class Recorder, that can be reused in all these pages. Right now there is a lot of reused, excessive code
//TODO #2: When the user hits record, make it so that it creates a new recording rather than replace the existing recording
//TODO #3: Implement function to the trash icon under each recording
//TODO #4: FIx some visual issues, e.g. the end of the Slider when active is straight rather then curved


class ThirdRoutePage2 extends StatefulWidget {
  @override
  _ThirdRoutePage2State createState() => _ThirdRoutePage2State();
}

class _ThirdRoutePage2State extends State<ThirdRoutePage2> {
  //RECORDER
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  //Initialize and dispose recorder when no longer needed
  @override
  void initState() {
    super.initState();

    initRecorder();

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == Audio.PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio(String? path) async {
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recordings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(""),
              const Text("Tap the record button to start a voice memo.",
                  style: TextStyle(fontSize: 18)),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SliderTheme(
                      child: Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          activeColor: const Color(0xff006cff),
                          onChanged: (value) async {
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
                          onPressed: () async {},
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xff006cff),
                          foregroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                            iconSize: 15,
                            onPressed: () async {
                              if (isPlaying) {
                                await audioPlayer.pause();
                              } else {
                                await audioPlayer.resume();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(child: Text("")),
              Center(
                child: ElevatedButton(
                  child: recorder.isRecording
                      ? Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              color: const Color(0xffff7b66),
                            ),
                          ),
                        )
                      : Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: const Icon(
                            Icons.fiber_manual_record_rounded,
                            color: Color(0xffff7b66),
                          ),
                        ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      onPrimary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      splashFactory: NoSplash.splashFactory),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xffC4C4C4),
                    size: 10,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xff4E4E4E),
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      );
}

class FifthRoutePage1 extends StatefulWidget {
  @override
  _FifthRoutePage1State createState() => _FifthRoutePage1State();
}

class _FifthRoutePage1State extends State<FifthRoutePage1> {
  //RECORDER
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  //Initialize and dispose recorder when no longer needed
  @override
  void initState() {
    super.initState();

    initRecorder();

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == Audio.PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio(String? path) async {
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Spell Your Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(""),
              const Text(
                  "Record yourself spelling your name using the French Alphabet. Swipe left to use to alphabet carousel for help!\n ",
                  style: TextStyle(fontSize: 18)),
              SliderTheme(
                child: Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    activeColor: const Color(0xff006cff),
                    onChanged: (value) async {
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
                    onPressed: () async {},
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color(0xff006cff),
                    foregroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      iconSize: 15,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  ),
                ],
              ),
              const Expanded(child: Text(""),),
              Center(
                child: ElevatedButton(
                  child: recorder.isRecording
                      ? Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
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
                        )
                      : Container(
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
                    } else {
                      await record();
                    }

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      onPrimary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      splashFactory: NoSplash.splashFactory),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xff4E4E4E),
                    size: 10,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xffC4C4C4),
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      );
}

class SixthRoutePage1 extends StatefulWidget {
  @override
  _SixthRoutePage1State createState() => _SixthRoutePage1State();
}

class _SixthRoutePage1State extends State<SixthRoutePage1> {
  //RECORDER
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  //Initialize and dispose recorder when no longer needed
  @override
  void initState() {
    super.initState();

    initRecorder();

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == Audio.PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio(String? path) async {
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

  //RECORDER
  final audioPlayer = Audio.AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Spell Your Street",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(""),
              const Text(
                  "Record yourself spelling your street address using the French Alphabet. Swipe left to use to alphabet carousel for help! \n ",
                  style: TextStyle(fontSize: 18)),
              SliderTheme(
                child: Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    activeColor: const Color(0xff006cff),
                    onChanged: (value) async {
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
                    onPressed: () async {},
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color(0xff006cff),
                    foregroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      iconSize: 15,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  ),
                ],
              ),
              const Expanded(child: Text("")),
              Center(
                child: ElevatedButton(
                  child: recorder.isRecording
                      ? Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              color: const Color(0xffff7b66),
                            ),
                          ),
                        )
                      : Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: const Icon(
                            Icons.fiber_manual_record_rounded,
                            color: Color(0xffff7b66),
                          ),
                        ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      onPrimary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      splashFactory: NoSplash.splashFactory),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xff4E4E4E),
                    size: 10,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xffC4C4C4),
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      );
}

class NinthRoutePage2 extends StatefulWidget {
  @override
  _NinthRoutePage2State createState() => _NinthRoutePage2State();
}

class _NinthRoutePage2State extends State<NinthRoutePage2> {
  //RECORDER
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  //Initialize and dispose recorder when no longer needed
  @override
  void initState() {
    super.initState();

    initRecorder();

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == Audio.PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio(String? path) async {
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recordings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(""),
              const Text("Tap the record button to start a voice memo.",
                  style: TextStyle(fontSize: 18)),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SliderTheme(
                      child: Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          activeColor: const Color(0xff006cff),
                          onChanged: (value) async {
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
                          onPressed: () async {},
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xff006cff),
                          foregroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                            iconSize: 15,
                            onPressed: () async {
                              if (isPlaying) {
                                await audioPlayer.pause();
                              } else {
                                await audioPlayer.resume();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(child: Text("")),
              Center(
                child: ElevatedButton(
                  child: recorder.isRecording
                      ? Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              color: const Color(0xffff7b66),
                            ),
                          ),
                        )
                      : Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: const Icon(
                            Icons.fiber_manual_record_rounded,
                            color: Color(0xffff7b66),
                          ),
                        ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      onPrimary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      splashFactory: NoSplash.splashFactory),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xffC4C4C4),
                    size: 10,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xff4E4E4E),
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      );
}

class TenthRoutePage2 extends StatefulWidget {
  @override
  _TenthRoutePage2State createState() => _TenthRoutePage2State();
}

class _TenthRoutePage2State extends State<TenthRoutePage2> {
  //RECORDER
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  //Initialize and dispose recorder when no longer needed
  @override
  void initState() {
    super.initState();

    initRecorder();

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == Audio.PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio(String? path) async {
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

  //RECORDER
  final audioPlayer = Audio.AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recordings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(""),
              const Text("Tap the record button to start a voice memo.",
                  style: TextStyle(fontSize: 18)),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SliderTheme(
                      child: Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          activeColor: const Color(0xff006cff),
                          onChanged: (value) async {
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
                          onPressed: () async {},
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xff006cff),
                          foregroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                            iconSize: 15,
                            onPressed: () async {
                              if (isPlaying) {
                                await audioPlayer.pause();
                              } else {
                                await audioPlayer.resume();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(child: Text("")),
              Center(
                child: ElevatedButton(
                  child: recorder.isRecording
                      ? Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              color: const Color(0xffff7b66),
                            ),
                          ),
                        )
                      : Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: const Icon(
                            Icons.fiber_manual_record_rounded,
                            color: Color(0xffff7b66),
                          ),
                        ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      primary: Colors.transparent,
                      onPrimary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      splashFactory: NoSplash.splashFactory),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xffC4C4C4),
                    size: 10,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    color: Color(0xff4E4E4E),
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      );
}

class EleventhRoutePage2 extends StatefulWidget {
  @override
  _EleventhRoutePage2State createState() => _EleventhRoutePage2State();
}

class _EleventhRoutePage2State extends State<EleventhRoutePage2> {
  //RECORDER
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  //Initialize and dispose recorder when no longer needed
  @override
  void initState() {
    super.initState();

    initRecorder();

    //Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == Audio.PlayerState.PLAYING;
      });
    });

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio(String? path) async {
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

  //RECORDER
  final audioPlayer = Audio.AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recordings",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const Text(""),
          const Text("Tap the record button to start a voice memo.",
              style: TextStyle(fontSize: 18)),
          SingleChildScrollView(
            child: Column(
              children: [
                SliderTheme(
                  child: Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      activeColor: const Color(0xff006cff),
                      onChanged: (value) async {
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
                      onPressed: () async {},
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: const Color(0xff006cff),
                      foregroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        iconSize: 15,
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.resume();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: Text("")),
          Center(
            child: ElevatedButton(
              child: recorder.isRecording
                  ? Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                    Border.all(width: 2, color: Colors.black)),
                child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    color: const Color(0xffff7b66),
                  ),
                ),
              )
                  : Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                    Border.all(width: 2, color: Colors.black)),
                child: const Icon(
                  Icons.fiber_manual_record_rounded,
                  color: Color(0xffff7b66),
                ),
              ),
              onPressed: () async {
                if (recorder.isRecording) {
                  await stop();
                } else {
                  await record();
                }

                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  splashFactory: NoSplash.splashFactory),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.fiber_manual_record_rounded,
                color: Color(0xffC4C4C4),
                size: 10,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.fiber_manual_record_rounded,
                color: Color(0xff4E4E4E),
                size: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    ),
  );
}
