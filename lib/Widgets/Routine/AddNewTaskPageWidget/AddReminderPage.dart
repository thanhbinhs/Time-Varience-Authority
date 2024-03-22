import 'package:flutter/material.dart';

import '../VariablesDataRoutineClass.dart';

void AddReminderPage(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const AddReminderPageClass();
    },
  );
}


class AddReminderPageClass extends StatefulWidget{
  const AddReminderPageClass({super.key});

  @override
  State<AddReminderPageClass> createState() => _AddReminderPageClassState();
}

class _AddReminderPageClassState extends State<AddReminderPageClass> {
  @override
  Widget build(BuildContext context){
    VariableData variableData = VariableData(context);
    return Container(
      width: variableData.screenWidth(),
      height: 680,
      decoration: BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(20),
      ),
    );

  }
}