import 'dart:math';

class Questions{

  List _questions = [
    {
      'audio': 'airplane.mp3',
      'question':'Does the sound maker have letter p?',
      'answer':'Y'
    },

    {
      'audio': 'alarmclock.mp3',
      'question':"Does the sound maker's name ends with letter k ?",
      'answer':'Y'
    },

    {
      'audio': 'applause.mp3',
      'question':'Does the sound maker have letter w?',
      'answer':'N'
    },

    {
      'audio': 'camerashutterclick.mp3',
      'question':'Does the sound maker have letter m?',
      'answer':'Y'
    },

    // {
    //   'audio': 'campfire.mp3',
    //   'question':"Does the sound maker's name start with letter f?",
    //   'answer':'Y'
    // },

    {
      'audio': 'carignition.mp3',
      'question':'Does the sound maker have letters c and k?',
      'answer':'N'
    },

    {
      'audio': 'coindrop.mp3',
      'question':'Does the sound maker have letter o',
      'answer':'Y'
    },

    {
      'audio': 'laptopkeyboard.mp3',
      'question':"Does the sound maker's name starts with letter k?",
      'answer':'Y'
    },

    {
      'audio': 'creakingdoor.mp3',
      'question':'Does the sound maker have letter a?',
      'answer':'N'
    },

    {
      'audio': 'doorbell.mp3',
      'question':"Does the sound maker's name have double o ?",
      'answer':'Y'
    },

    {
      'audio': 'gun.mp3',
      'question':'Does the sound maker have letter n?',
      'answer':'Y'
    },

    {
      'audio': 'matches.mp3',
      'question':"Does the sound maker's name starts with letter m?",
      'answer':'Y'
    },

    // {
    //   'audio': 'oceanwave.mp3',
    //   'question':'Does the sound maker have letter t?',
    //   'answer':'N'
    // },

    {
      'audio': 'rain.mp3',
      'question':'Does the sound maker have letter i?',
      'answer':'Y'
    },

    {
      'audio': 'train.mp3',
      'question':'Does the sound maker have letter r?',
      'answer':'Y'
    },

    {
      'audio': 'truck.mp3',
      'question':'Does the sound maker have letter a?',
      'answer':'N'
    },

    {
      'audio': 'tvstatic.mp3',
      'question':"Does the sound maker's name starts with letter t?",
      'answer':'Y'
    }

  ];
    Map getQuestion(){
      Random randomQuestion = Random();
      return _questions[randomQuestion.nextInt(15)];
    }
}