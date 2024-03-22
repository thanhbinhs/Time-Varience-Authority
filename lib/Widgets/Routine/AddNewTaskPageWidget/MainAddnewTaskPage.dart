import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tva/Services/database_service.dart';
import 'package:tva/Widgets/Routine/AddNewTaskPageWidget/AddTimePage.dart';
import 'package:tva/Widgets/Routine/VariablesDataRoutineClass.dart';


void AddNewTaskPageVer1(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const AddNewTaskPage();
    },
  );
}


class AddNewTaskPage extends StatefulWidget{
  const AddNewTaskPage({super.key});

  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  Color colorTheme = const Color.fromARGB(255, 255, 200, 223);
  Color colorThemeGradient = const Color.fromARGB(255, 255, 200, 223);
  List<bool> isPressedColorTheme = List.generate(7, (index) => false);
  final TextEditingController _taskName = TextEditingController();
  final TextEditingController _taskSub = TextEditingController();
  int colorId = 1;
  TextEditingController _dateController = TextEditingController();
  // TextEditingController _taskStartTime = TextEditingController();
  // TextEditingController _taskEndTime = TextEditingController();
    final user = FirebaseAuth.instance.currentUser!;



  int BurnIndex = 0;


  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    void dismissKeyboard() {
      FocusScope.of(context).unfocus();
    }
    double screenHeight() {
      return MediaQuery.of(context).size.height;
    }
    double screenWidth() {
      return MediaQuery.of(context).size.width;
    }
    return GestureDetector(
      onTap: dismissKeyboard,
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
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:SizedBox(
              height: screenHeight()*0.06229,
              //color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      dismissKeyboard();
                      Future.delayed(const Duration(milliseconds: 300), () {
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
                      Database().addTask(user.uid, _taskName.text, _taskSub.text,Timestamp.now(), Timestamp.now(), Timestamp.now(), false, colorId);
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: variableData.screenHeight() * 0.81,
                // color: Colors.yellow,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: variableData.screenHeight() * 0.0872,
                        // color: Colors.blue,
                        child: IconButton(
                          icon: const Icon(Icons.abc),
                          onPressed: () {

                          },
                        ),
                      ),

                      TextField(
                        maxLines: null,
                        controller: _taskName,
                        maxLength: 70,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        decoration: const InputDecoration(
                          hintText: "New Task",
                          // Remove the underline border
                          border: InputBorder.none,
                          // Optionally, add some padding to the input
                          contentPadding: EdgeInsets.all(0),
                        ),
                      ),

                      const SizedBox(height: 15,),

                      SizedBox(
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
                                    colorId = i;
                                    BurnIndex = -1;
                                  });
                                },
                                child: Stack(
                                  children: [
                                    PhysicalModel(
                                      elevation: 2,
                                      shadowColor: const Color.fromARGB(255, 245, 245, 245),
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
                            // SizedBox(
                            //     height: variableData.screenHeight() * 0.07475,
                            //      // color: Colors.green,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         TextField(
                            //           controller: _dateController,
                            //           decoration: InputDecoration(
                            //             labelText: 'DATE',
                            //             filled: true,
                            //             prefixIcon: Icon(Icons.calendar_today),
                            //             enabledBorder: OutlineInputBorder(
                            //               borderSide: BorderSide.none
                            //             ),
                            //             focusedBorder: OutlineInputBorder(
                            //               borderSide: BorderSide(color: Colors.blue)
                            //             )
                            //           ),
                            //           readOnly: true,
                            //           onTap: (){
                            //             _selectDate();
                            //           },
                            //         ),
                            //       ],
                            //     ),
                            //   ),




                            // Padding(padding: const EdgeInsets.symmetric(
                            //     horizontal: 25,),
                            //   child: Container(height: 1.5, color: const Color.fromARGB(200, 200, 200, 200)),
                            // ),
                            //
                            // InkWell(
                            //   child: SizedBox(
                            //     height: variableData.screenHeight() * 0.07475,
                            //     // color: Colors.green,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         SizedBox(
                            //           width:variableData.screenHeight() * 0.2616,
                            //           // color: Colors.blue,
                            //           child: const Row(
                            //             mainAxisAlignment: MainAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 'Time: ',
                            //                 style: TextStyle(
                            //                   fontSize: 17,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: variableData.screenHeight() * 0.0436,
                            //           // color: Colors.green,
                            //           child: const Row(
                            //             mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Icon(Icons.alarm_rounded,size: 30,),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            //   onTap: (){
                            //     AddTimePage(context);
                            //   },
                            // ),
                            // Padding(padding: const EdgeInsets.symmetric(
                            //   horizontal: 25,),
                            //   child: Container(height: 1.5,color: const Color.fromARGB(200, 200, 200, 200),),
                            // ),
                            // InkWell(
                            //   child: SizedBox(
                            //     height: variableData.screenHeight() * 0.07475,
                            //     // color: Colors.green,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         SizedBox(
                            //           width: variableData.screenHeight() * 0.2616,
                            //           // color: Colors.blue,
                            //           child: const Row(
                            //             mainAxisAlignment: MainAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 'Reminder: ',
                            //                 style: TextStyle(
                            //                   fontSize: 17,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: variableData.screenHeight() * 0.0436,
                            //           // color: Colors.green,
                            //           child: const Row(
                            //             mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Icon(Icons.doorbell_outlined,size: 30,),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //
                            //
                            //   ),
                            //   onTap: (){
                            //
                            //   },
                            // ),
                            // Padding(padding: const EdgeInsets.symmetric(
                            //   horizontal: 25,),
                            //   child: Container(height: 1.5, color: const Color.fromARGB(200, 200, 200, 200),),
                            // ),
                            // InkWell(
                            //   child: SizedBox(
                            //     height: variableData.screenHeight() * 0.07475,
                            //     // color: Colors.green,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         SizedBox(
                            //           width: variableData.screenHeight() * 0.2616,
                            //           // color: Colors.blue,
                            //           child: const Row(
                            //             mainAxisAlignment: MainAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 'Tag: ',
                            //                 style: TextStyle(
                            //                   fontSize: 17,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: variableData.screenHeight() * 0.0436,
                            //           // color: Colors.green,
                            //           child: const Row(
                            //             mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Icon(Icons.discount_outlined,size: 30,),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //
                            //   ),
                            //   onTap: (){
                            //
                            //   },
                            // ),

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

  Future<void> _selectDate() async{
    DateTime? _picked = await showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime.now() , lastDate: DateTime(2040));

    if(_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split("")[0];
      });
    }
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


