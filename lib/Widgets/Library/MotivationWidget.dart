
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'CategorieNThemeWidget.dart';
import 'VariableDataLibraryClass.dart';
import 'dart:async';

class MotivationWidget extends StatefulWidget{

  @override
  State<MotivationWidget> createState() => _MotivationWidgetState();
}

class _MotivationWidgetState extends State<MotivationWidget> {

  int Categories = 0;
  int Themes = 0;



  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (!_isPageBeingDragged && _currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  PageController _pageController = PageController(initialPage: 1, viewportFraction: 1);
  int _currentPage = 1;
  final bool _isPageBeingDragged = false;
  Timer? _timer;

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_isPageBeingDragged && _pageController.hasClients) {
        _pageController.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.ease);
      }
    });
  }





  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context){
    VariableData variableData = VariableData(context);
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => CategorieNTheme(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),

        );

      },
      child: Container(
        height: variableData.screenHeight()*0.39,
        width: variableData.screenWidth(),
        decoration: BoxDecoration(
          color: variableData.colorBackGround,
          borderRadius: BorderRadius.circular(25),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  variableData.MotivationPicturePath[Themes],
                  fit: BoxFit.cover,
                ),
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
            Container(
              child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    final int newIndex = index % 5;
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        child: Center(
                          child: Text(
                            variableData.motivationString[Categories][newIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
            ),
            ],
          ),
      ),
    );
  }
}



