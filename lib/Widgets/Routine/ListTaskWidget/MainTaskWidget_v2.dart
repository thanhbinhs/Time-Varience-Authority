import 'dart:io' if(dart.library.js) 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tva/Models/task.dart';
import 'package:tva/Services/database_service.dart';
import 'package:tva/Widgets/Routine/ListTaskWidget/MainTaskWidget.dart';
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



  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    // DateTime selectedDate = DateTime.now();
    // DateTime startOfDay = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('tasks')
            .where('is_done', isEqualTo: false)
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: variableData.screenHeight() * 0.8,
                      // color: Colors.blue,
                      child: ListView(
                        children:
                        snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  child: IntrinsicHeight(
                                    child: Column(
                                      children: [
                                        Slidable(
                                          key: const ValueKey(0),
                                          endActionPane: const ActionPane(
                                            motion: DrawerMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: Edit,
                                                backgroundColor: Color.fromARGB(
                                                    100, 100, 100, 100),
                                                foregroundColor: Colors.white,
                                                icon: Icons.edit,
                                                label: "Edit",
                                              ),
                                              SlidableAction(
                                                // onPressed: Delete(context,Database()),
                                                onPressed: Edit,
                                                backgroundColor: Color.fromARGB(
                                                    150, 255, 0, 0),
                                                foregroundColor: Colors.white,
                                                icon: Icons.delete_outline,
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
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
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
                                                                    Database().delete(user.uid, data['id']);
                                                                    // print("123");
                                                                  },
                                                                )),
                                                            Container(
                                                              width: 200,
                                                              // color: Colors.red,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    // color: Colors.brown,
                                                                    height: 25,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
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
                                                                          "${variableData.ChangeFormTime(data['start_hour'],data['start_minute'],data['end_hour'],data['end_minute'],data['is_timeperiod'],)}",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    // color: Colors.red,
                                                                    child: Text(
                                                                      data[
                                                                      'name'],
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        16,
                                                                        fontWeight:
                                                                        FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    // color: Colors.red,
                                                                    child: Text(
                                                                      data[
                                                                      'decoration'],
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        14,
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
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.start,
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
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                                  () {
                                                                                  Database().updateTask(user.uid, data['id'], true);
                                                                              });
                                                                        },
                                                                        child:
                                                                        Container(
                                                                          height:
                                                                          35,
                                                                          width:
                                                                          35,
                                                                          // color: Colors.white,
                                                                          child:
                                                                          Icon(
                                                                            Icons.check_circle_rounded,
                                                                            size:
                                                                            35,
                                                                            color: data["is_done"] == true ? Colors.green : Colors.white,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
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

