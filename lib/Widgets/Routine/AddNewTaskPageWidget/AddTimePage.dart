
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tva/Widgets/Routine/VariablesDataRoutineClass.dart';


void AddTimePage(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return AddTimePageClass();
    },
  );
}

class AddTimePageClass extends StatefulWidget{
  @override
  State<AddTimePageClass> createState() => _AddTimePageState();
}

class _AddTimePageState extends State<AddTimePageClass> {
  var startHour = 0;
  var startMinute = 0;

  var endHour = 0;
  var endMinute = 0;

  bool isPressedTimeperiod = false;
  bool isTimePeriod = true;
  bool isPointTime = false;




  Widget build(BuildContext context){
    VariableData variableData = VariableData(context);
    return Container(
      width: variableData.screenWidth(),
      height: 680,
      decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Container(
          // color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Container(
                  // color: Colors.yellow,
                  height: variableData.screenHeight()*0.06229,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(
                        onPressed: (){
                            Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          // print(variableData.screenHeight());
                        },
                        child: const Text(
                          "Set Time",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: variableData.screenHeight()*0.7,
                  width: variableData.screenWidth(),
                  // color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 10,),
                      Container(
                        height: 150,
                        // color: Colors.blue,
                        child: Center(
                          child: Text(
                            isTimePeriod ?
                            "Do it at $startHour:$startMinute of the day "
                            : "Do it from $startHour:$startMinute to $endHour:$endMinute of the day",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        height: 0.8,
                        color: Color.fromARGB(50, 120, 120, 120),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(50, 200, 200, 200),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(
                          children: [

                            AnimatedPositioned(
                              duration: Duration(milliseconds: 200),
                              left: isPressedTimeperiod ? 160 : 0,
                              child: Container(
                                height: 40,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 150, 220, 255),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                InkWell(
                                  child: Container(
                                    // color: Colors.blue,
                                    height: 40,
                                    width: 160,
                                    child: Center(
                                      child: Text(
                                          "Point time",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isPointTime ?  Colors.grey : Colors.black ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      isPressedTimeperiod = false;

                                        isTimePeriod = true;
                                        isPointTime = false;
                                      print(
                                          isTimePeriod
                                      );
                                    });
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    // color: Colors.b lue,
                                    height: 40,
                                    width: 160,
                                    child: Center(
                                      child: Text(
                                        "Time period",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isTimePeriod ?  Colors.grey : Colors.black ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      isPressedTimeperiod = true;

                                        isTimePeriod = false;
                                        isPointTime = true;

                                    });
                                  },
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),



                      Container(
                        height: 150,
                        // color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  NumberPicker(
                                    minValue: 0,
                                    maxValue: 23,
                                    value: startHour,
                                    zeroPad: true,
                                    infiniteLoop: true,
                                    itemWidth: 60,
                                    itemHeight: 40,
                                    onChanged: (value) {
                                      setState(() {
                                        startHour = value;
                                      });
                                    },
                                    textStyle:
                                    const TextStyle(color: Colors.grey, fontSize: 15),
                                    selectedTextStyle:
                                    const TextStyle(color: Colors.black, fontSize: 25),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                            color: Colors.black,
                                          ),
                                          bottom: BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                  NumberPicker(
                                    minValue: 0,
                                    maxValue: 59,
                                    value: startMinute,
                                    zeroPad: true,
                                    infiniteLoop: true,
                                    itemWidth: 60,
                                    itemHeight: 40,
                                    onChanged: (value) {
                                      setState(() {
                                        startMinute = value;
                                      });
                                    },
                                    textStyle:
                                    const TextStyle(color: Colors.grey, fontSize: 15),
                                    selectedTextStyle:
                                    const TextStyle(color: Colors.black, fontSize: 25),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                            color: Colors.black,
                                          ),
                                          bottom: BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      isTimePeriod ? Container(height: 1,) :
                      Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'TO',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),

                        ),
                      ),

                      Stack(
                        children: [
                          isTimePeriod ? Container(height: 1,) :
                          Container(
                            height: 150,
                          // color: Colors.black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    NumberPicker(
                                      minValue: 0,
                                      maxValue: 23,
                                      value: endHour,
                                      zeroPad: true,
                                      infiniteLoop: true,
                                      itemWidth: 60,
                                      itemHeight: 40,
                                      onChanged: (value) {
                                        setState(() {
                                          endHour = value;
                                        });
                                      },
                                      textStyle:
                                      const TextStyle(color: Colors.grey, fontSize: 15),
                                      selectedTextStyle:
                                      const TextStyle(color: Colors.black, fontSize: 25),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                              color: Colors.black,
                                            ),
                                            bottom: BorderSide(color: Colors.black)),
                                      ),
                                    ),
                                    NumberPicker(
                                      minValue: 0,
                                      maxValue: 59,
                                      value: endMinute,
                                      zeroPad: true,
                                      infiniteLoop: true,
                                      itemWidth: 60,
                                      itemHeight: 40,
                                      onChanged: (value) {
                                        setState(() {
                                          endMinute = value;
                                        });
                                      },
                                      textStyle:
                                      const TextStyle(color: Colors.grey, fontSize: 15),
                                      selectedTextStyle:
                                      const TextStyle(color: Colors.black, fontSize: 25),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                              color: Colors.black,
                                            ),
                                            bottom: BorderSide(color: Colors.black)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



