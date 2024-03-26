import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tva/Services/database_service.dart';
import 'package:tva/Widgets/Routine/VariablesDataRoutineClass.dart';
import 'AddNewTimePage.dart';


void AddNewTaskPageVer1(BuildContext context, int dayIsPressed) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return AddNewTaskPage(dayIsPressed: dayIsPressed,);
    },
  );
}


class AddNewTaskPage extends StatefulWidget{
  int dayIsPressed;
  AddNewTaskPage({required this.dayIsPressed});
  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}


class _AddNewTaskPageState extends State<AddNewTaskPage> {

  // Task Name
  String taskName = '';

  // color id
  int colorID = 0;

  // Date
 // widget.dayIsPressed;

  // variable của Addnewtimepage
  var startHour = 0;
  var startMinute = 0;
  var endHour = 0;
  var endMinute = 0;
  bool isSetime = false;
  bool isPressedTimeperiod = false;




  Color colorTheme = Color.fromARGB(255, 255, 200, 223);
  Color colorThemeGradient = Color.fromARGB(255, 255, 200, 223);
  List<bool> isPressedColorTheme = List.generate(7, (index) => false);

  TextEditingController _taskName = TextEditingController();
  TextEditingController _taskSub = TextEditingController();
  // TextEditingController _taskStartTime = TextEditingController();
  // TextEditingController _taskEndTime = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  int BurnIndex = 0;

  void AddTimePage(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddTimePageWidget(),
    ).then((value) {
      if (value != null) {
        setState(() {
          startHour = value[0];
        startMinute = value[1];
        endHour = value[2];
        endMinute = value[3];
        isSetime = value[4];
        isPressedTimeperiod = value[5];
        });
      }
    });
  }


  String changeFormTimeTwoNumber(int num) {
    if (num <= 9) {
      return '0$num';
    } else {
      return num.toString();
    }
  }

  String  ChangeFormTime(var startHour, var startMinute, var endHour, var endMinute){
    if (isSetime == true && isPressedTimeperiod == true ){
      return '${changeFormTimeTwoNumber(startHour)}:${changeFormTimeTwoNumber(startMinute)} to ${changeFormTimeTwoNumber(endHour)}:${changeFormTimeTwoNumber(endMinute)}';
    } else{
      if(isSetime == true && isPressedTimeperiod == false ){
        return '${changeFormTimeTwoNumber(startHour)}:${changeFormTimeTwoNumber(startMinute)}';
      }
      else{
        return "No";
      }
    }

  }

  int currentDateAsInt =  int.parse(DateTime.now().day.toString());
  int currentYearAsInt = int.parse(DateTime.now().year.toString());

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDateMonth = DateFormat('MMM').format(now);

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
                      Database().addTask(user.uid, _taskName.text, _taskSub.text, widget.dayIsPressed, startHour, startMinute, endHour, endMinute, isPressedTimeperiod, false, colorID);
                      Future.delayed(Duration(milliseconds: 300), () {
                        Navigator.pop(context);
                      });
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
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        onChanged: (text) {
                          setState(() {
                            taskName = text;
                          });
                        },
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
                                    colorID = i;
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
                                            widget.dayIsPressed == currentDateAsInt ?
                                            'Date: Today' : ((widget.dayIsPressed - currentDateAsInt) == 1 ?
                                            'Date: Tomorrow' :  'Date: $formattedDateMonth ${widget.dayIsPressed}, ${currentYearAsInt}'),
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
                                print(widget.dayIsPressed);
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
                                          Text(
                                            ChangeFormTime(startHour,startMinute,endHour,endMinute),
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
                                setState(() {
                                  isSetime = false;
                                  AddTimePage(context);
                                });
                                // print(isSetime);
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



