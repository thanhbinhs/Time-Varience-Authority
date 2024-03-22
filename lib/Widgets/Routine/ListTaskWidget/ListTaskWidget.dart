import 'package:flutter/material.dart';
// import 'package:tva/Widgets/Routine/ListTaskWidget/MainTaskWidget.dart';

import 'package:tva/Widgets/Routine/ListTaskWidget/MainTaskWidget_v2.dart';
import '../TimeTableWidget/TimeTableWidget.dart';

class ListTaskWidget extends StatelessWidget {
  const ListTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TimeTableWidget(),
        MainTaskWidget()
        // TaskWidget(),
      ],
    );
  }
}
