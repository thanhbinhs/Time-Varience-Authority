import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tva/Pages/LibraryWidget.dart';
import '../Animations/Rive_untils.dart';
import 'ProfileWidget.dart';
import 'RoutineWidget.dart';
import 'VariablesDataClass.dart';





class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool isSideMenuClosed = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
            () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }



  int currentIndex = 0;
  late SMIBool searchTigger0;
  late SMIBool searchTigger1;
  late SMIBool searchTigger2;

  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Scaffold(
      backgroundColor: variableData.backgroundColor4_3D,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: variableData.screenHeight()/2,
                color: Color.fromARGB(255, 6, 6, 6),
              ),
              Container(
                height: variableData.screenHeight()/2,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
            ],
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isSideMenuClosed ? variableData.screenWidth() : 0,
            curve: Curves.fastOutSlowIn,
            width: variableData.screenWidth(),
            height: variableData.screenHeight(),
            top: 0,
            child: ProfileWidget(),
          ),
         Transform(
           alignment: Alignment.center,
           transform: Matrix4.identity()
             ..setEntry(3, 2, 0.001)
             ..rotateY(-1 * animation.value + 30 * (animation.value) * 3.14 / 180),

           child: Transform.translate(
                  offset: Offset(animation.value*-variableData.screenWidth()*0.5666,0),
                  child: Transform.scale(
                      scale: scalAnimation.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child:  currentIndex == 0 ? RoutineWidget() : (currentIndex == 1 ? LibraryWidget() : null),
                      )
                  )
           ),
         ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(200, 0, 0, 0),
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        searchTigger0.change(true);
                        searchTigger1.change(false);
                        searchTigger2.change(false);
                        if(isSideMenuClosed == false) {
                          _animationController.reverse();
                        }
                        setState(() {
                          isSideMenuClosed = true;
                          currentIndex = 0;
                        });
                      },

                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: RiveAnimation.asset(
                          "assets/RiveAssets/Icons.riv",
                          artboard: "TIMER",
                          onInit: (artboard){
                            StateMachineController controller =
                            RiveUtils.getRiveController(artboard,stateMachineName: "TIMER_Interactivity");
                            searchTigger0 = controller.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        searchTigger0.change(false);
                        searchTigger1.change(true);
                        searchTigger2.change(false);
                        if(isSideMenuClosed == false) {
                          _animationController.reverse();
                        }
                        setState(() {
                          isSideMenuClosed = true;
                          currentIndex = 1;
                        });
                      },

                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: RiveAnimation.asset(
                          "assets/RiveAssets/Icons.riv",
                          artboard: "SEARCH",
                          onInit: (artboard){
                            StateMachineController controller =
                            RiveUtils.getRiveController(artboard,stateMachineName: "SEARCH_Interactivity");
                            searchTigger1 = controller.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        searchTigger0.change(false);
                        searchTigger1.change(false);
                        searchTigger2.change(true);
                        if(isSideMenuClosed == true) {
                          _animationController.forward();
                        }
                        setState(() {
                          isSideMenuClosed = false;
                        });
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: RiveAnimation.asset(
                          "assets/RiveAssets/Icons.riv",
                          artboard: "USER",
                          onInit: (artboard){
                            StateMachineController controller =
                            RiveUtils.getRiveController(artboard,stateMachineName: "USER_Interactivity");
                            searchTigger2 = controller.findSMI("active") as SMIBool;
                          },

                        ),
                      ),
                    ),

                  ],
                ),


              ),


            ],
          ),

        ],
      ),
    );
  }
}
