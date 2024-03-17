import 'package:flutter/material.dart';

import 'authController.dart';
import 'package:tva/Models/task.dart';
import 'package:tva/Services/database_service.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{
  RxList<Task> taskList = RxList<Task>();
  Rx<TextEditingController> taskName = TextEditingController().obs;
  Rx<TextEditingController> taskSub = TextEditingController().obs;

  List<Task> get tasks => taskList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    taskList.bindStream(Database().taskStream(uid));
    super.onInit();
  }

}