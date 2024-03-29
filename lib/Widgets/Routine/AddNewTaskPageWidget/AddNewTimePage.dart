import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../VariablesDataRoutineClass.dart';


class AddTimePageWidget extends StatefulWidget{
  @override
  State<AddTimePageWidget> createState() => _AddTimePageWidgetState();
}

class _AddTimePageWidgetState extends State<AddTimePageWidget> {
  late DateTime now;

  var startHour = 0;
  var startMinute = 0;
  var endHour = 0;
  var endMinute = 0;
  bool isPressedTimeperiod = false;
  bool isTimePeriod = true;
  bool isPointTime = false;
  bool isSetime = false;
  bool _showDialogErrAsA = false;
  bool _showDialogErrNextDay = false;
  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    startHour = now.hour;
    startMinute = now.minute;
  }



  @override
  Widget build(BuildContext context){
    VariableData variableData = VariableData(context);
    return Container(
          width: variableData.screenWidth(),
          height: variableData.screenHeight() * 0.8471,
          decoration: BoxDecoration(
            color: Colors.white ,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
              // color: Colors.blue,
              child:
                  Column(
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
                                isPressedTimeperiod ?
                                setState(() {
                                  isSetime = true;
                                  _showDialogErrAsA = true;
                                  _showDialogErrNextDay = true;
                                })
                                : setState(() {
                                  isSetime = true;
                                  Navigator.pop(context, [startHour, startMinute,endHour,endMinute,isSetime,isPressedTimeperiod]);
                                });

                                isPressedTimeperiod ? (variableData.checkCorrectTimeErrAsA(startHour, startMinute, endMinute, endHour)  && ((endMinute + endHour*60) > (startMinute + startHour * 60) && (endMinute + endHour*60) < (59 + 23*60) ))
                                    ? Navigator.pop(context, [startHour, startMinute,endHour,endMinute,isSetime,isPressedTimeperiod])
                                      : (variableData.checkCorrectTimeErrAsA(startHour, startMinute, endHour, endMinute) == false
                                        ? Future.delayed(Duration(seconds: 2), () {setState(() {_showDialogErrAsA = false;_showDialogErrNextDay = false;});})
                                          :   Future.delayed(Duration(seconds: 2), () {setState(() {_showDialogErrAsA = false;_showDialogErrNextDay = false;});
                                            })
                                              ) : null;
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
                                height: variableData.screenHeight()*0.1868,
                                // color: Colors.blue,
                                child:
                                Stack(
                                  children: [
                                    Center(
                                      child: AnimatedOpacity(
                                      duration: Duration(seconds: 2),
                                      opacity: _showDialogErrAsA ? 0 : 1,
                                        child: Text(
                                          isTimePeriod ?
                                          "Do it at ${variableData.changeFormTimeTwoNumber(startHour)}:${variableData.changeFormTimeTwoNumber(startMinute)} of the day "
                                              : "Do it from ${variableData.changeFormTimeTwoNumber(startHour)}:${variableData.changeFormTimeTwoNumber(startMinute)} to ${variableData.changeFormTimeTwoNumber(endHour)}:${variableData.changeFormTimeTwoNumber(endMinute)} of the day",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: AnimatedOpacity(
                                        duration: Duration(seconds: 2),
                                        opacity: (_showDialogErrAsA || _showDialogErrNextDay) ? 1 : 0,
                                        child: Container(
                                          width: variableData.screenWidth() - 20,
                                          height: variableData.screenHeight() * 0.15,
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 255,50,50),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                !variableData.checkCorrectTimeErrAsA(startHour, startMinute, endMinute, endHour) ?
                                                'Start time cannot be the same as end time. Please try resetting to another time !'
                                                : "The time to finish the task must be before 00:00 pm, Please try resetting to another time !",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              Container(
                                height: 0.8,
                                color: Color.fromARGB(50, 120, 120, 120),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: variableData.screenHeight()*0.049833,
                                width: variableData.screenHeight()*0.49833,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(50, 200, 200, 200),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                      duration: Duration(milliseconds: 200),
                                      left: isPressedTimeperiod ? variableData.screenHeight()*0.2 : 0,
                                      child: Container(
                                        height: variableData.screenHeight()*0.049833,
                                        width: variableData.screenHeight()*0.19933,
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
                                            height: variableData.screenHeight()*0.049833,
                                            width:  variableData.screenHeight()*0.19933,
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
                                            });
                                          },
                                        ),
                                        InkWell(
                                          child: Container(
                                            // color: Colors.b lue,
                                            height: variableData.screenHeight()*0.049833,
                                            width:  variableData.screenHeight()*0.19933,
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
                                              endMinute = 0;
                                              endHour = 0;
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
                                height:  variableData.screenHeight()*0.1868,
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
                                      fontSize: 20,
                                    ),
                                  ),
                                //   child: IconButton(
                                //       onPressed: (){
                                //         print("${variableData.checkCorrectTimeErrNextDay(startHour, startMinute, endHour, endMinute)}");
                                //         print("${variableData.checkCorrectTimeErrAsA(startHour, startMinute, endHour, endMinute)}");
                                //         },
                                //       icon: Icon(Icons.abc)
                                //   )
                                ),
                              ),

                              Stack(
                                children: [
                                  isTimePeriod ? Container(height: 1,) :
                                  Container(
                                    height:  variableData.screenHeight()*0.1868,
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



