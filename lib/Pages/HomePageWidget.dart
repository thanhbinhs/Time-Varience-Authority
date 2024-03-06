import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tva_the_time_variance_authority_ver2/Pages/LibraryWidget.dart';
import '../Animations/Rive_untils.dart';
import 'ProfileWidget.dart';
import 'RoutineWidget.dart';
import 'VariablesDataClass.dart';
import 'package:flutter/services.dart';




class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late SMIBool searchTigger0;
  late SMIBool searchTigger1;
  late SMIBool searchTigger2;

  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (currentIndex == 0) RoutineWidget(),
              if (currentIndex == 1) LibraryWidget(),
              if (currentIndex == 2) ProfileWidget(),
              // Container(height: 0.5, color: Colors.grey,),
            ],
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
                        setState(() {
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
                        setState(() {
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
                        setState(() {
                          currentIndex = 2;
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
