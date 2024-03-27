import 'package:tva/Widgets/Library/StopPauseNSlide.dart';
import 'package:flutter/material.dart';
import 'VariableDataLibraryClass.dart';


class MeditateWidget extends StatefulWidget{
  @override
  State<MeditateWidget> createState() => _MeditateWidgetState();
}

class _MeditateWidgetState extends State<MeditateWidget> {
  int isPressedSong = 0;
  @override
  Widget build(BuildContext context ){
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
                child: Padding(
                  padding: EdgeInsets.all(15),
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
                                                width: variableData.screenWidth()*0.111,
                                                // color: Colors.yellow,
                                                child: const Row(
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
                                    height: variableData.screenHeight()*0.026,
                                    // color: Colors.red,
                                    child: const Column(
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
                        height: variableData.screenHeight()*0.248,
                        // color: Colors.pink,
                        child: PageView(
                          children: List.generate(4, (i) =>
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(2, (j) =>
                                      Container(
                                        height: variableData.screenHeight()*0.124,
                                        // color: Colors.blue,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: variableData.screenHeight()*0.12,
                                              // color: Colors.orange,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                        isPressedSong = i*2+j;
                                                      });
                                                    },
                                                    child: Container(
                                                      width: variableData.screenWidth()*0.25,
                                                      // color: Colors.black,
                                                      child: Stack(
                                                        children: [
                                                          Center(
                                                            child: Image.asset(
                                                              variableData.pictureOfSongPath[i * 2 + j],
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          ClipPath(
                                                            clipper: MyCustomClipper(),
                                                            child: Container(
                                                              color: variableData.colorBackGround,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: variableData.screenWidth()*0.559,
                                                    // color: Colors.red,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        SizedBox(width: 10,),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              height: variableData.screenHeight()*0.09,
                                                              width: variableData.screenWidth()*0.527777,
                                                              // color:Colors.yellow,
                                                              child:
                                                              isPressedSong == i*2+j ?
                                                              StopPauseNSlide(
                                                                songInfor: variableData.songInfor[i * 2 + j],
                                                                songPath: variableData.songPath[i * 2 + j],
                                                                nameSong: variableData.songName[i * 2 + j],
                                                                pictureOfSongPath: "123",
                                                              )
                                                                  : Container(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.all(5),
                                                                      child:   Container(
                                                                          height: variableData.screenHeight()*0.0497,
                                                                          // color: Colors.orange,
                                                                          child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    height: variableData.screenHeight()*0.03,
                                                                                    // color: Colors.brown,
                                                                                    child: Text(
                                                                                      variableData.songName[i*2+j],
                                                                                      style: TextStyle(
                                                                                          fontSize: 17,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    height: variableData.screenHeight()*0.018,
                                                                                    // color: Colors.brown,
                                                                                    child: Text(
                                                                                      variableData.songInfor[i*2+j],
                                                                                      style: const TextStyle(
                                                                                        fontSize: 12,
                                                                                        color: Color.fromARGB(255, 50, 50, 50),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          )
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            if(j % 2 == 0) Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: 200,
                                                    height: 1.1,
                                                    color: const Color.fromARGB(200, 100, 100, 100),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
              );
  }
}


class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double circleRadius = size.width / 2;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: circleRadius,
      ),
    );
    path.fillType = PathFillType.evenOdd;
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}