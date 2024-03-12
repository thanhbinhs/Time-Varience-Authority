import 'package:flutter/material.dart';
import 'VariablesDataClass.dart';

class LibraryWidget extends StatefulWidget {
  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
  var hour = 0;
  var minute = 0;


  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Container(
      height: variableData.screenHeight(),
      color: Colors.white,


    );
  }
}

