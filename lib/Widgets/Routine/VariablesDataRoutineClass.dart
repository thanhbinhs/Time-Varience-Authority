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
  static int index = 0;

  List<Color> colorList = [
    const Color.fromARGB(255, 255, 230, 243),
    const Color.fromARGB(255, 255, 235, 190),
    const Color.fromARGB(255, 255, 255, 220),
    const Color.fromARGB(255, 210, 225, 210),
    const Color.fromARGB(255, 224, 255, 255),
    const Color.fromARGB(255, 238, 200, 248),
    const Color.fromARGB(255, 195, 195, 195),
  ];
  List<Color> colorListGradient = [
    const Color.fromARGB(255, 255, 150, 150),
    const Color.fromARGB(255, 255, 170, 150),
    const Color.fromARGB(255, 255, 220, 130),
    const Color.fromARGB(255, 190, 255, 190),
    const Color.fromARGB(255, 100, 200, 255),
    const Color.fromARGB(255, 248, 160, 248),
    const Color.fromARGB(255, 75, 75, 75),
  ];
  Color colorBackGround = const Color.fromARGB(255, 230, 229, 250);
  Color colorIsPressed =   const Color.fromARGB(255, 210, 181, 255);
  Color colorCurDay = const Color.fromARGB(255, 210, 141, 255);


  String changeFormatDay(int dayNumber) {
    if(dayNumber > 7){
      dayNumber = dayNumber % 7;
      if(dayNumber == 0) {
        dayNumber = 7;
      }
    }
    String formattedDay = '';
    switch (dayNumber) {
      case 1:
        formattedDay = 'Mo';
        break;
      case 2:
        formattedDay = 'Tu';
        break;
      case 3:
        formattedDay = 'We';
        break;
      case 4:
        formattedDay = 'Th';
        break;
      case 5:
        formattedDay = 'Fr';
        break;
      case 6:
        formattedDay = 'Sa';
        break;
      case 7:
        formattedDay = 'Su';
        break;
    }
    return formattedDay;
  }






}