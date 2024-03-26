import 'dart:io' if(dart.library.js) 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tva/Services/database_service.dart';
import 'package:tva/src/action_pane_motions.dart';
import 'package:tva/src/actions.dart';
import 'package:tva/src/slidable.dart';
import '../VariablesDataRoutineClass.dart';
import 'dart:core';




class MainTaskWidget extends StatefulWidget {
  final int dayIsPressed;
  MainTaskWidget({Key? key, required this.dayIsPressed}) : super(key: key);
  @override
  State<MainTaskWidget> createState() => _MainTaskWidgetState();
}

class _MainTaskWidgetState extends State<MainTaskWidget> {
  final user = FirebaseAuth.instance.currentUser!;
  int index = VariableData.index;
  bool checkDone = false;
  bool  checkAll = true;

  void Delete(String id){
    Database().delete(user.uid, id);
  }
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    // DateTime selectedDate = DateTime.now();
    // DateTime startOfDay = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: checkAll == false ?
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('tasks')
            // .orderBy('day', descending: true)
            .where('is_done', isEqualTo: checkDone)
            .where('day', isEqualTo: widget.dayIsPressed)
            .snapshots()
        :
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('tasks')
        // .orderBy('day', descending: true)
        //     .where('is_done', isEqualTo: checkDone)
            .where('day', isEqualTo: widget.dayIsPressed)
            .snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Container(
            height: variableData.screenHeight() * 0.803,
            width: variableData.screenWidth(),
            color: variableData.colorBackGround,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: variableData.screenHeight() * 0.3,
                      color: Colors.white,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      height: 35,
                      width: variableData.screenWidth() - 20,
                      // color: Colors.black,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 10),

                          InkWell(
                            onTap: (){
                              setState(() {
                                checkAll = true;
                                checkDone = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 35,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: checkAll ? Color.fromARGB(255, 150, 220, 255) : null,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: variableData.colorBorder, // Màu viền mong muốn
                                    width: 1, // Độ dày của viền
                                  ),
                                ),
                                child:
                                    Center(
                                      child: Text(
                                        "All",
                                        style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                              ),
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                checkAll = false;
                                checkDone = true;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 35,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: checkDone ? Color.fromARGB(255, 150, 220, 255) : null,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: variableData.colorBorder, // Màu viền mong muốn
                                    width: 1, // Độ dày của viền
                                  ),
                                ),
                                child:
                                Center(
                                  child: Text(
                                    "Is done",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                              ),
                            ),
                          ),


                          InkWell(
                            onTap: (){
                              setState(() {
                                checkAll = false;
                                checkDone = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 35,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: (checkDone == false && checkAll == false)  ? Color.fromARGB(255, 150, 220, 255) : null,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: variableData.colorBorder,
                                    width: 1,
                                  ),
                                ),
                                child:
                                Center(
                                  child: Text(
                                    "Not done",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      height: variableData.screenHeight() * 0.69,
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: 10,bottom: 40),
                        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot document = snapshot.data!.docs[index];
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return  Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => {
                                  },
                                  backgroundColor: Color.fromARGB(220, 100, 100, 100),
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: 'Edit',
                                ),
                                SlidableAction(
                                  onPressed: (context) => {
                                    Database().delete(user.uid, data['id']),
                                  },
                                  backgroundColor: Color.fromARGB(220, 255, 70, 70),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete_forever,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color:
                                  variableData.colorList[data['color_id']],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10),
                                    child: Container(
                                      // color: Colors.yellow,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: 50,
                                                  // color: Colors.blue,
                                                  child:
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons
                                                            .abc),
                                                    onPressed:
                                                        () {

                                                      // print("123");
                                                    },
                                                  )),
                                              Container(
                                                width: 200,
                                                // color: Colors.red,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // color: Colors.brown,
                                                      height: 25,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            "Time: ",
                                                            style:
                                                            TextStyle(
                                                              fontSize:
                                                              13,
                                                              // fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${variableData.ChangeFormTime(data['start_hour'],data['start_minute'],data['end_hour'],data['end_minute'],data['is_timeperiod'],data['is_timeperiod'])}",
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      // color: Colors.red,
                                                      child: Text(
                                                        data['name'],
                                                        style:
                                                        TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      // color: Colors.red,
                                                      child: Text(
                                                        data['decoration'],
                                                        style:
                                                        TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                // child: Icon(Icons.abc),
                                                // color: Colors.black,
                                                child: Center(
                                                  child: Stack(
                                                    children: [
                                                      Center(
                                                        child:
                                                        InkWell(
                                                          onTap:
                                                              () {
                                                            setState(
                                                                    () {
                                                                  // isCompleteTask = !isCompleteTask;
                                                                  // print(isCompleteTask);
                                                                });
                                                          },
                                                          child:
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Center(
                                                        child:
                                                        InkWell(
                                                          onTap: () {

                                                            setState(() {
                                                              isComplete = !isComplete;
                                                                  Database().updateTask(user.uid, data['id'], isComplete);
                                                                });
                                                          },
                                                          child:
                                                          data['is_done'] ?
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            // color: Colors.white,
                                                            child:
                                                            Icon(
                                                              Icons.check_circle_rounded,
                                                              size: 35,
                                                              color: Color.fromARGB(255,94, 190, 109),
                                                            ),
                                                          ) :
                                                          Container(
                                                            height: 27,
                                                            width: 27,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              border: Border.all(
                                                                width: 2,
                                                                color: Colors.grey,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


void Delete(BuildContext context, String id ) {
  final user = FirebaseAuth.instance.currentUser!;

  Database().delete(user.uid, id);

}

void Edit(BuildContext context) {
  print('Do edit in here');
}

