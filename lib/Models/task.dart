import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String name;
  String decoration;
  int day;
  int startHour;
  int startMinute;
  int endHour;
  int endMinute;
  bool isTimePeriod;
  bool setTime;
  bool isDone;
  int colorId;

  Task({
    required this.id,
    required this.name,
    required this.decoration,
    required this.day,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.isTimePeriod,
    required this.setTime,
    required this.isDone,
    required this.colorId,
  });

  Task.fromDocumentSnapshot(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot['id'],
        name = documentSnapshot['name'],
        decoration = documentSnapshot['decoration'],
        day = documentSnapshot['day'],
        startHour = documentSnapshot['start_hour'],
        startMinute = documentSnapshot['start_minute'],
        endHour = documentSnapshot['end_hour'],
        endMinute = documentSnapshot['end_minute'],
        isTimePeriod = documentSnapshot['is_timeperiod'],
        setTime = documentSnapshot['set_time'],
        isDone = documentSnapshot['is_done'],
        colorId = documentSnapshot['color_id'];

  Task.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        decoration = json['decoration'],
        day = json['day'],
        startHour = json['start_hour'],
        startMinute = json['start_minute'],
        endHour = json['end_hour'],
        endMinute = json['end_minute'],
        isTimePeriod = json['is_timeperiod'],
        setTime = json['set_time'],
        isDone = json['is_done'],
        colorId = json['color_id'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'decoration': decoration,
      'day': day,
      'start_hour': startHour,
      'start_minute': startMinute,
      'end_hour': endHour,
      'end_minute': endMinute,
      'is_timeperiod': isTimePeriod,
      'set_time': setTime,
      'is_done': isDone,
      'color_id': colorId,
    };
  }
}
