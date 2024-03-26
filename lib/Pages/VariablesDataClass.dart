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
  Color backgroundColor4_3D = Color.fromARGB(255, 20, 20, 20);
}
