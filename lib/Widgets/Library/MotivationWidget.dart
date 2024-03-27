import 'package:flutter/material.dart';

import 'VariableDataLibraryClass.dart';

class MotivationWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    VariableData variableData = VariableData(context);
    return Container(
      height: variableData.screenHeight()*0.39,
      width: variableData.screenWidth(),
      decoration: BoxDecoration(
        color: variableData.colorBackGround,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
              height: variableData.screenHeight()*0.39,
              width: variableData.screenWidth(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/PicBGOfMotivation/Picture_0.png",
                fit: BoxFit.fitHeight,
              ),
            ),

           Padding(
            padding: EdgeInsets.all(15),
            child: Container(
                height: variableData.screenHeight()*0.1,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: variableData.screenWidth()*0.82,
                      // color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: variableData.screenHeight()*0.0498,
                            // color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Motivation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        width: variableData.screenWidth()*0.111,
                                        // color: Colors.yellow,
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 1.5,),
                                            Text("All",
                                            style: TextStyle(color: Colors.white),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 10,
                                              color: Colors.white,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}