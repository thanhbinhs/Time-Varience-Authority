import 'package:tva/Models/task.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Database{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> saveUserInformation(String userName, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid; // Lấy UID của người dùng mới tạo

  // Thêm hoặc cập nhật thông tin người dùng vào Firestore
  return users
      .doc(uid) // Sử dụng UID làm key để dễ dàng truy cập và quản lý sau này
      .set({
        'user_name': userName, // Tên người dùng
        'email': email, // Email
      })
      .then((value) => print("User Information Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addTask(String uid, String name, String sub, Timestamp startTime, Timestamp endTime, bool isDone, int colorId) async {
  try{
  var uuid = Uuid().v4(); // Tạo UUID để làm ID cho task
  // Thêm task mới vào Firestore
  await _firestore.collection('users').doc(uid).collection('tasks').doc(uuid).set({
    'id': uuid, 
    'name': name, // Tên task
    'sub': sub, // Mô tả task
    'start_time': startTime, // Thời gian bắt đầu
    'end_time': endTime, // Thời gian kết thúc
    'is_done': isDone, // Trạng thái task (đã hoàn thành hay chưa)
    'color_id': colorId, // Mã màu của task
  });
  }catch(e){
    print(e);
  }
}

Future<void> delete(String uid, String id) async{
  try{
    await _firestore.collection('users').doc(uid).collection('tasks').doc(id).delete();
  }catch(e){
    print(e);
  }
}

Stream<List<Task>> taskStream(String uid) {
  return _firestore.collection('users').doc(uid).collection('tasks').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => Task.fromDocumentSnapshot(doc)).toList();
  });
}
}