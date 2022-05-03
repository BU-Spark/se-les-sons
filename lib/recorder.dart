// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_sound_lite/flutter_sound.dart';
// import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
//
// class Recorder {
//   FlutterSoundRecorder? recorder;
//   bool isInitialized = false;
//   bool get isRecording => recorder!.isRecording;
//
//   Future init() async {
//     recorder = FlutterSoundRecorder();
//
//     final status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted){
//       throw RecordingPermissionException("Microphone permission denied.");
//     }
//
//     await recorder!.openAudioSession();
//     isInitialized = true;
//   }
//
//   void dispose() {
//     if(!isInitialized) return;
//
//     recorder!.closeAudioSession();
//     recorder = null;
//     isInitialized = true;
//   }
//
//   Future record() async{
//     if(!isInitialized) return;
//
//     await recorder!.startRecorder(toFile:"../assets/p1l3recordings/recording.wav");
//   }
//   Future stop() async{
//     if(!isInitialized) return;
//
//     await recorder!.stopRecorder();
//   }
//
//   Future toggleRecording() async{
//     if (recorder!.isStopped){
//       await record();
//     }else{
//       await stop();
//     }
//   }
// }
