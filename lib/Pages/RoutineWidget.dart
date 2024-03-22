import 'package:flutter/material.dart';
import 'package:tva/Widgets/Routine/AddNewTaskPageWidget/AddNewTakPage.dart';
import '../Widgets/Routine/ListTaskWidget/ListTaskWidget.dart';
import 'VariablesDataClass.dart';



class RoutineWidget extends StatelessWidget {
  const RoutineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Container(
      height: variableData.screenHeight(),
      width: variableData.screenWidth(),
      color: const Color.fromARGB(255, 243, 239, 255),
      child: const Stack(
        children: [
          ListTaskWidget(),
          AddNewTaskPageWidget(),
        ],
      ),
    );
  }
}