import 'dart:io' if (dart.library.js) 'dart:js_interop';

import 'package:tva/Models/task.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserInformation(
      String userName, String email, String password) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid; // Lấy UID của người dùng mới tạo

    // Thêm hoặc cập nhật thông tin người dùng vào Firestore
    return users
        .doc(uid) // Sử dụng UID làm key để dễ dàng truy cập và quản lý sau này
        .set({
          'user_name': userName, // Tên người dùng
          'email': email,
          'password': password, // Email
        })
        .then((value) => print("User Information Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addTask(
      String uid,
      String name,
      String decoration,
      int day,
      int startHour,
      int startMinute,
      int endHour,
      int endMinute,
      bool isTimePeriod,
      bool setTime,
      bool isDone,
      int colorId) async {
    try {
      var uuid = Uuid().v4(); // Tạo UUID để làm ID cho task
      // Thêm task mới vào Firestore
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('tasks')
          .doc(uuid)
          .set({
        'id': uuid,
        'name': name, // Tên task
        'decoration': decoration, // Mô tả task
        'day': day,
        'start_hour': startHour,
        'start_minute': startMinute,
        'end_hour': endHour,
        'end_minute': endMinute,
        'is_timeperiod': isTimePeriod,
        'set_time': setTime, // Có thiết lập thời gian hay không
        'is_done': isDone, // Trạng thái task (đã hoàn thành hay chưa)
        'color_id': colorId, // Mã màu của task
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(String uid, String id, bool isDone) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('tasks')
          .doc(id)
          .update({'is_done': isDone});
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTaskEdit(
      String uid,
      String id,
      String? name,
      String? decoration,
      int? startHour,
      int? startMinute,
      int? endHour,
      int? endMinute,
      bool? isTimePeriod,
      bool? setTime,
      int? colorId) async {
    try {
      final Map<String, dynamic> dataToUpdate = {};

      if (name != null) {
        dataToUpdate['name'] = name;
      }
      if (decoration != null) {
        dataToUpdate['decoration'] = decoration;
      }
      // if (day != null) {
      //   dataToUpdate['day'] = day;
      // }
      if (startHour != null) {
        dataToUpdate['start_hour'] = startHour;
      }
      if (startMinute != null) {
        dataToUpdate['start_minute'] = startMinute;
      }
      if (endHour != null) {
        dataToUpdate['end_hour'] = endHour;
      }
      if (endMinute != null) {
        dataToUpdate['end_minute'] = endMinute;
      }
      if (isTimePeriod != null) {
        dataToUpdate['is_time_period'] = isTimePeriod;
      }
      if (setTime != null) {
        dataToUpdate['set_time'] = setTime;
      }
      if (colorId != null) {
        dataToUpdate['color_id'] = colorId;
      }

      await _firestore
          .collection('users')
          .doc(uid)
          .collection('tasks')
          .doc(id)
          .update(dataToUpdate);
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String uid, String id) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('tasks')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Task>> taskStream(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Task.fromDocumentSnapshot(doc))
          .toList();
    });
  }
}
