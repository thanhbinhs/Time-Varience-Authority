import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
  String id;
  String name;
  String sub;
  Timestamp time;
  Timestamp startTime;
  Timestamp endTime;
  bool isDone;
  int colorId;

  Task({
    required this.id,
    required this.name,
    required this.sub,
    required this.time,
    required this.startTime,
    required this.endTime,
    required this.isDone,
    required this.colorId,
});

  Task.fromDocumentSnapshot(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot['id'],
        name = documentSnapshot['name'],
        sub = documentSnapshot['sub'],
        time = documentSnapshot['time'],
        startTime = documentSnapshot['start_time'],
        endTime = documentSnapshot['end_time'],
        isDone = documentSnapshot['is_done'],
        colorId = documentSnapshot['color_id'];

  Task.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        sub = json['sub'],
        time = json['time'],
        startTime = json['start_time'],
        endTime = json['end_time'],
        isDone = json['is_done'],
        colorId = json['color_id'];
}
