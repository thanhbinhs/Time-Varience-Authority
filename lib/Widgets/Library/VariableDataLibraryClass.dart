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
  List<Color> colorList = [
    Color.fromARGB(255, 255, 230, 243),
    Color.fromARGB(255, 255, 235, 190),
    Color.fromARGB(255, 255, 255, 220),
    Color.fromARGB(255, 210, 225, 210),
    Color.fromARGB(255, 224, 255, 255),
    Color.fromARGB(255, 238, 200, 248),
    Color.fromARGB(255, 195, 195, 195),
  ];
  List<Color> colorListGradient = [
    Color.fromARGB(255, 255, 150, 150),
    Color.fromARGB(255, 255, 170, 150),
    Color.fromARGB(255, 255, 220, 130),
    Color.fromARGB(255, 190, 255, 190),
    Color.fromARGB(255, 100, 200, 255),
    Color.fromARGB(255, 248, 160, 248),
    Color.fromARGB(255, 75, 75, 75),
  ];
  Color colorBackGround = Color.fromARGB(255, 230, 229, 250);
  Color colorIsPressed =   Color.fromARGB(255, 210, 181, 255);
  Color colorCurDay = Color.fromARGB(255, 210, 141, 255);
  Color colorBorder = Color.fromARGB(255, 100, 100, 100);

  List<String> songPath = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> songName = [
    'Song 1',
    'Song 2',
    'Song 3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  List<String> songInfor = [
    '10 min',
    '10 min',
    '20 min',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];


}