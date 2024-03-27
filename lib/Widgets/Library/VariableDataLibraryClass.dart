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
    'assets/PicBGOfMotivation/Picture_0.jpg',
    '5 min',
    '6 min',
    '5 min',
    '3 min',
    '6 min',
    '5 min',
    '3 min',
  ];

}