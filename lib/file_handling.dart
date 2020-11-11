import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'package:flutter_ibm_watson/utils/IamOptions.dart';
import 'package:captcha/models.dart';
import 'package:path_provider/path_provider.dart';

class FileHandling{

  dynamic convertToAudioFile(String audioToConvert) async{

    var _encoded = base64Decode(audioToConvert);
    return _encoded;
  }

  void playAudioFile(){


  }

  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _audioFile async{
    final _path = await _localPath;
    return new File('$_path/audio.mp3');
  }

  Future<String> writeToFile(Uint8List audio) async{
    final File _mp3File = await _audioFile;
    _mp3File.writeAsBytes(audio, flush: true); //base64.decode(encoded)
    return _mp3File.path;
  }

  // File returnAudioFile(){
  //
  //   return File('$_path/audio.mp3');
  // }

  Future<String> getAudio(String text) async{
    print('0');
    print(text);
  // String _audioContent = await NetworkingModel().makeRequest(text);
    IamOptions options =  IamOptions(iamApiKey: 'E34irpbjevz2dyXW9Kz6Dqnj_fp1RDCXKOhGbmDmyx7K',url: 'https://api.eu-gb.text-to-speech.watson.cloud.ibm.com/instances/b9abf166-3657-4de5-9a9b-56c9ce111715');
    TextToSpeech service  = new TextToSpeech(iamOptions: options, voice: "en-US_AllisonV3Voice");
    Uint8List bi = await service.toSpeech(text);

    print(bi);
   print('3');
   // var _convertedAudio =  convertToAudioFile(_audioContent);
    String _audio = await writeToFile(bi);
    print('$_audio');
   // AudioPlayer player = AudioPlayer();
   // player.play('$_audio',isLocal: true);
    return _audio;
  }
}