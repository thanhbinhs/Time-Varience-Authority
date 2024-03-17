import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tva/Services/database_service.dart';
import 'package:tva/Widgets/Routine/AddNewTaskPageWidget/AddTimePage.dart';
import 'package:tva/Widgets/Routine/VariablesDataRoutineClass.dart';


void AddNewTaskPageVer1(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return AddNewTaskPage();
    },
  );
}


class AddNewTaskPage extends StatefulWidget{
  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  Color colorTheme = Color.fromARGB(255, 255, 200, 223);
  Color colorThemeGradient = Color.fromARGB(255, 255, 200, 223);
  List<bool> isPressedColorTheme = List.generate(7, (index) => false);
  TextEditingController _taskName = TextEditingController();
  TextEditingController _taskSub = TextEditingController();
  // TextEditingController _taskStartTime = TextEditingController();
  // TextEditingController _taskEndTime = TextEditingController();
    final user = FirebaseAuth.instance.currentUser!;


  int BurnIndex = 0;


  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    void _dismissKeyboard() {
      FocusScope.of(context).unfocus();
    }
    double screenHeight() {
      return MediaQuery.of(context).size.height;
    }
    double screenWidth() {
      return MediaQuery.of(context).size.width;
    }
    return GestureDetector(
      onTap: _dismissKeyboard,
      child:
      Container(
        width: screenWidth(),
        height: screenHeight() - screenHeight()*0.08098,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              colorTheme,
              colorThemeGradient,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:Container(
              height: screenHeight()*0.06229,
              //color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      _dismissKeyboard();
                      Future.delayed(Duration(milliseconds: 300), () {
                        Navigator.pop(context);
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Database().addTask(user.uid, _taskName.text, _taskSub.text, Timestamp.now(), Timestamp.now(), false, BurnIndex);
                      // print(variableData.screenHeight());
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: variableData.screenHeight() * 0.81,
                // color: Colors.yellow,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: variableData.screenHeight() * 0.0872,
                        // color: Colors.blue,
                        child: IconButton(
                          icon: Icon(Icons.abc),
                          onPressed: () {

                          },
                        ),
                      ),

                      TextField(
                        maxLines: null,
                        controller: _taskName,
                        maxLength: 70,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        decoration: InputDecoration(
                          hintText: "New Task",
                          // Remove the underline border
                          border: InputBorder.none,
                          // Optionally, add some padding to the input
                          contentPadding: EdgeInsets.all(0),
                        ),
                      ),

                      SizedBox(height: 15,),

                      Container(
                        //color: Colors.green,
                        height: variableData.screenHeight() * 0.049833,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for(int i = 0; i < 7; i++)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isPressedColorTheme = List.generate(7, (index) => false);
                                    isPressedColorTheme[i] = true;
                                    colorTheme = variableData.colorList[i];
                                    colorThemeGradient = variableData.colorListGradient[i];
                                    BurnIndex = -1;
                                  });
                                },
                                child: Stack(
                                  children: [
                                    PhysicalModel(
                                      elevation: 2,
                                      shadowColor: Color.fromARGB(255, 245, 245, 245),
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      child: SizedBox(
                                        width: variableData.screenHeight() * 0.049833,
                                        height: variableData.screenHeight() * 0.049833,
                                      ),
                                    ),
                                    Container(
                                      height: variableData.screenHeight() * 0.049833, width: variableData.screenHeight() * 0.049833,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: variableData.colorList[i],
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 3,
                                        ),
                                      ),
                                      child: Visibility(
                                        visible: isPressedColorTheme[i] || BurnIndex == i,
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20,),

                      Container(
                        height: variableData.screenHeight() * 0.3064,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [

                            InkWell(
                              child: Container(
                                height: variableData.screenHeight() * 0.07475,
                                 // color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: variableData.screenHeight() * 0.2616,
                                      // color: Colors.blue,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Today',
                                          style: TextStyle(
                                            fontSize: 17,

                                          ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: variableData.screenHeight() * 0.0436,
                                      // color: Colors.green,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.calendar_today),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: (){

                              },
                            ),


                            Padding(padding: EdgeInsets.symmetric(
                                horizontal: 25,),
                              child: Container(height: 1.5, color: Color.fromARGB(200, 200, 200, 200)),
                            ),

                            InkWell(
                              child: Container(
                                height: variableData.screenHeight() * 0.07475,
                                // color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width:variableData.screenHeight() * 0.2616,
                                      // color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Time: ',
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: variableData.screenHeight() * 0.0436,
                                      // color: Colors.green,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.alarm_rounded,size: 30,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: (){
                                AddTimePage(context);
                              },
                            ),
                            Padding(padding: EdgeInsets.symmetric(
                              horizontal: 25,),
                              child: Container(height: 1.5,color: Color.fromARGB(200, 200, 200, 200),),
                            ),
                            InkWell(
                              child: Container(
                                height: variableData.screenHeight() * 0.07475,
                                // color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: variableData.screenHeight() * 0.2616,
                                      // color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Reminder: ',
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: variableData.screenHeight() * 0.0436,
                                      // color: Colors.green,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.doorbell_outlined,size: 30,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),


                              ),
                              onTap: (){

                              },
                            ),
                            Padding(padding: EdgeInsets.symmetric(
                              horizontal: 25,),
                              child: Container(height: 1.5, color: Color.fromARGB(200, 200, 200, 200),),
                            ),
                            InkWell(
                              child: Container(
                                height: variableData.screenHeight() * 0.07475,
                                // color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: variableData.screenHeight() * 0.2616,
                                      // color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tag: ',
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: variableData.screenHeight() * 0.0436,
                                      // color: Colors.green,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.discount_outlined,size: 30,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                              onTap: (){

                              },
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),

                      // InkWell(
                      //   child: Container(
                      //     height: variableData.screenHeight() * 0.07475,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //       borderRadius: BorderRadius.circular(20)
                      //     ),
                      //     child:
                      //     Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Container(
                      //               width: 35,
                      //               // color: Colors.green,
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.start,
                      //                 children: [
                      //                   Icon(Icons.add_circle_outline_rounded,size:30),
                      //                 ],
                      //               ),
                      //             ),
                      //             Container(
                      //               width: 240,
                      //               height: 70,
                      //               color: Colors.yellow,
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.start,
                      //                 children: [
                      //                 ],
                      //               ),
                      //             ),
                      //
                      //
                      //           ],
                      //         ),
                      //     ),
                      //   ),
                      //   onTap: (){
                      //
                      //   },
                      // ),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



// TextField(
// maxLines: null,
// maxLength: 70,
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 22,
// ),
// decoration: InputDecoration(
// hintText: "New Task",
// // Remove the underline border
// border: InputBorder.none,
// // Optionally, add some padding to the input
// contentPadding: EdgeInsets.all(0),
// ),
// ),


