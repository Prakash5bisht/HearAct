import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:captcha/file_handling.dart';
import 'package:captcha/models.dart';
import 'package:captcha/questions.dart';
import 'package:captcha/refresh_screen.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String _question;
  var playerInstance;
  Map _questionAnswerMap;
  AudioCache _player  = AudioCache();
  @override
  void initState() {
    Questions firstQuestion = Questions();
     _questionAnswerMap  = firstQuestion.getQuestion();
    _question = _questionAnswerMap['question'];
    playAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            InkWell(
              highlightColor: Colors.white,
              splashColor: Colors.black12,
              onTap: (){
                playerInstance.stop();
                verifyIfTrue();
              },
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragEnd: (details){
                  print(details);
                  playerInstance.stop();
                  verifyIfFalse();
                },
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: Text(
                     'Tap or Swipe',
                      style: TextStyle(
                        color: Color(0xffcccccc),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,right: 10.0, left: 10.0),
              child: Container(
                width: size.width,
                height: 100.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(
                    _question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff4d4d4d),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,

                    ),
                  ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffDCDCE5),
                        spreadRadius: 1.0,
                        blurRadius: 5.0,
                      )
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void dictateQuestion(String question) async{
   print(question);
    String audioFile = await FileHandling().getAudio(question);
     //AudioPlayer player  = AudioPlayer();
    //  Questions question = Questions();
    //  Map map = question.getQuestion();
    // setState(() {
    //   _question = map['question'];
    // });
    // var playerInstance = await player.play(map['audio']);
    //  Timer(Duration(seconds: 3), (){
    //    playerInstance.stop();
    //  });
    print('\n');
    print(audioFile);
   // print();
    AudioPlayer player = AudioPlayer();
    player.play(audioFile, isLocal: true, volume: 30.0);
     //playAudio();
    print('\n');

  }


  void verifyIfTrue(){
     if(_questionAnswerMap['answer'] == 'Y'){
       newQuestion();
     }
     else{
       tryAgain();
     }
  }

  void verifyIfFalse(){
    if(_questionAnswerMap['answer'] == 'N'){
      newQuestion();
    }
    else{
      tryAgain();
    }
  }

 void newQuestion() async{
   Questions question = Questions();
   _questionAnswerMap = question.getQuestion();
   setState(() {
     _question = _questionAnswerMap['question'];
   });

   dictateQuestion(_question);
   // var playerInstance = await _player.play(_questionAnswerMap['audio']);
   // Timer(Duration(seconds: 3), (){
   //   playerInstance.stop();
   // });
  }

  void playAudio() async{
     playerInstance = await _player.play(_questionAnswerMap['audio']);
      Timer(Duration(seconds: 3), (){
        playerInstance.stop();
      });

  }
  void tryAgain(){

    // Timer(Duration(seconds: 1), (){
    //   Navigator.of(context).pop();
    // });
    playerInstance.stop();
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> RefreshScreen(verificationDone: false,)));
  }
}
