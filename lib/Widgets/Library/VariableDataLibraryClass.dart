import 'package:flutter/material.dart';


class VariableData {
  BuildContext context;
  VariableData(this.context);
  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }
  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  Color colorBackGround = Color.fromARGB(255,227, 253, 253);
  Color colorBackGroundAppbar = Color.fromARGB(255,150, 160, 230);

  List<String> songPath = [
    'assets/Music/French79HomeTown',
    'assets/Music/French79BetweenButtons',
    'assets/Music/KidFrancescoliMoon',
    'assets/Music/French79BurningLegend',
    'assets/Music/French79Hero',
    'assets/Music/FRENCH79Angel',
    'assets/Music/French79DDROPP',
    'assets/Music/French79LovinFeeling',
  ];
  List<String> pictureOfSongPath = [
    'assets/PictureOfSong/Picture_0.jpg',
    'assets/PictureOfSong/Picture_1.jpg',
    'assets/PictureOfSong/Picture_2.jpg',
    'assets/PictureOfSong/Picture_3.jpg',
    'assets/PictureOfSong/Picture_4.jpg',
    'assets/PictureOfSong/Picture_5.jpg',
    'assets/PictureOfSong/Picture_6.jpg',
    'assets/PictureOfSong/Picture_7.jpg',
  ];
  List<String> songName = [
    'HomeTown',
    'Between Buttons',
    'Moon',
    'BurningLegend',
    'Hero',
    'Angel',
    'DDROPP',
    'Lovin - Feeling',
    '9',
    '10',
  ];
  List<String> songInfor = [
    '5 min',
    '5 min',
    '6 min',
    '5 min',
    '3 min',
    '6 min',
    '5 min',
    '3 min',
  ];

  List<String> MotivationPicturePath = [
    'assets/PicBGOfMotivation/Picture_0.png',
    'assets/PicBGOfMotivation/Picture_1.png',
    'assets/PicBGOfMotivation/Picture_2.png',
    'assets/PicBGOfMotivation/Picture_3.png',
    'assets/PicBGOfMotivation/Picture_4.png',
    'assets/PicBGOfMotivation/Picture_5.png',
    'assets/PicBGOfMotivation/Picture_6.png',
    'assets/PicBGOfMotivation/Picture_7.png',
    'assets/PicBGOfMotivation/Picture_8.png',
    'assets/PicBGOfMotivation/Picture_9.png',
    'assets/PicBGOfMotivation/Picture_10.png',
    'assets/PicBGOfMotivation/Picture_11.png',
    'assets/PicBGOfMotivation/Picture_12.png',
    'assets/PicBGOfMotivation/Picture_13.png',
    'assets/PicBGOfMotivation/Picture_14.png',
    'assets/PicBGOfMotivation/Picture_15.png',
    'assets/PicBGOfMotivation/Picture_16.png',
  ];


    List<List<String>> motivationString = [
      [
        'I am moving forward in this situation.',
        'I am becoming the best version of myself.',
        'YOU MUST DO THE THINGS YOU THINK YOU CANNOT DO.',
        'I HAVE EVERYTHING I NEED TO BE HAPPY RIGHT NOW.',
        'My ability to conquer my challenges is limitless: my potential to succeed is infinite.',
        'Start each day with a positive thought and a grateful heart.',
        'I am committed to my path, with or without others.',
        'WHAT YOU FEEL, YOU ATTRACT, WHAT YOU IMAGINE, YOU CREATE.',
        'I choose JOY. I choose CREATIVITY. I choose INSPIRATION. I choose SERENITY. I choose TO LIVE WELL IN EACH MOMENT.',
        'I am unaffected by the judgment of others.',
        'Try my best.',
      ],

      [
        'No medicine cures what happiness cannot.',
        'I HAVE EVERYTHING I NEED TO BE HAPPY RIGHT NOW.',
        'Happiness is not a goal...it\'s a by-product of a life well-lived.',
        'Happiness depends upon ourselves.',
        'Happiness is a warm puppy.',
        'There is no path to happiness; happiness is the path.',
        'You cannot protect yourself from sadness without protecting yourself from happiness.',
        'The best way to cheer yourself is to try to cheer someone else up.',
        'Being happy never goes out of style.',
        'Think of all the beauty still left around you and be happy.',
        'Love u <3',
      ],

      [
        'You need lofty goals. Then cement it with a great work ethic.',
        'YOU MUST DO THE THINGS YOU THINK YOU CANNOT DO.',
        'Success is the progressive realization of a worthy goal or ideal.',
        'If you aim for nothing, you\'ll hit it every time.',
        'You should set goals beyond your reach so you always have something to live for.',
        'Start each day with a positive thought and a grateful heart.',
        'If the plan doesn\'t work, change the plan, but never the goal.',
        'You are never too old to set a new goal or to dream a new dream.',
        'Set realistic goals, keep re-evaluating, and be consistent.',
        'Dream your own dreams, achieve your own goals. Your journey is your own and unique.',
      ],
    ];






}