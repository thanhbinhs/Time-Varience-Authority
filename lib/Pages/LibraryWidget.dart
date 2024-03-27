import 'package:flutter/material.dart';
import 'package:tva/Widgets/Library/MotivationWidget.dart';
import '../Widgets/Library/MeditateWidget.dart';
import '../Widgets/Library/VariableDataLibraryClass.dart';


class LibraryWidget extends StatefulWidget {
  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Container(
      height: variableData.screenHeight(),
      width: variableData.screenWidth(),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: variableData.screenHeight() * 0.082,
                width: variableData.screenWidth(),
                color: Colors.white,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Library",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            Container(
            height: variableData.screenHeight() * 0.916,
            width: variableData.screenWidth(),
            // color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      MeditateWidget(),
                      SizedBox(height: 20),
                      MotivationWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}







