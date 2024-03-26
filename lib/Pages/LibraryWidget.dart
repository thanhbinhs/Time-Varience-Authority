import 'package:flutter/material.dart';
import 'package:tva/Widgets/Library/StopPauseNSlide.dart';
import 'VariablesDataClass.dart';

class LibraryWidget extends StatefulWidget {
  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
  int isPressedSong = 0;
  // List<bool> isPressedSong = List.generate(9, (index) => false);


  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Container(
      height: variableData.screenHeight(),
      width: variableData.screenWidth(),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                height: variableData.screenHeight() * 0.082,
                width: variableData.screenWidth(),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Library",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: variableData.screenHeight() * 0.916,
                width: variableData.screenWidth(),
                // color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      Container(
                        height: variableData.screenHeight()*0.34,
                        width: variableData.screenWidth(),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: variableData.screenHeight()*0.1,
                                // color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 305,
                                      // color: Colors.yellow,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 40,
                                            // color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Meditate',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 23,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        width: 40,
                                                        // color: Colors.yellow,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SizedBox(width: 1.5,),
                                                            Text("All"),
                                                            Icon(
                                                              Icons.arrow_forward_ios_rounded,
                                                              size: 10,
                                                            ),
                                                          ],
                                                        )
                                                    ),
                                                    SizedBox(height: 5,),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            // color: Colors.red,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text('Find peace through meditation.'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 170,
                                color: Colors.red,
                                child: PageView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      color: Colors.yellow,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 84,
                                            color: Colors.green,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  // color: Colors.orange,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 220,
                                                  color: Colors.yellow,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          height: 40,
                                                          width: 200,
                                                          color: Colors.orange,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    height: 20,
                                                                    color: Colors.brown,
                                                                    child: Text(
                                                                      "Song name",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    height: 15,
                                                                    color: Colors.brown,
                                                                    child: Text(
                                                                      "10 min",
                                                                      style: TextStyle(
                                                                          fontSize: 10,
                                                                          color: Color.fromARGB(255, 50, 50, 50)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 1,
                                                width: 220,
                                                color: Color.fromARGB(255, 150, 150, 150),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 84,
                                            color: Colors.green,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  // color: Colors.orange,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 220,
                                                  color: Colors.yellow,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          height: 40,
                                                          width: 200,
                                                          color: Colors.orange,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    height: 20,
                                                                    color: Colors.brown,
                                                                    child: Text(
                                                                      "Song name",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    height: 15,
                                                                    color: Colors.brown,
                                                                    child: Text(
                                                                      "10 min",
                                                                      style: TextStyle(
                                                                          fontSize: 10,
                                                                          color: Color.fromARGB(255, 50, 50, 50)
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                    Container(
                                      color: Colors.orange,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      StopPauseNsilde(songInfor: "123", songPath: "123", nameSong: "123",),
                  ],
                ),
            ],
          ),
        ],
      )
    );
  }
}






