// import 'package:flutter/material.dart';
// import 'package:tva/src/action_pane_motions.dart';
// import 'package:tva/src/actions.dart';
// import 'package:tva/src/slidable.dart';
// import '../VariablesDataRoutineClass.dart';

// class MainTaskWidget extends StatefulWidget{
//   @override
//   State<MainTaskWidget> createState() => _MainTaskWidgetState();
// }

// class _MainTaskWidgetState extends State<MainTaskWidget> {
//   bool  isCompleteTask = false;


//   @override
//   Widget build(BuildContext context){
//     VariableData variableData = VariableData(context);
//     return Container(
//       height: variableData.screenHeight() * 0.803,
//       width: variableData.screenWidth(),
//       color: variableData.colorBackGround,
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 height: variableData.screenHeight()*0.3,
//                 color: Colors.white,
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 height: variableData.screenHeight() * 0.8,
//                 // color: Colors.blue,
//                 child: ListView(
//                   padding: EdgeInsets.all(0),
//                   children: [
//                     Container(
//                       // color: Colors.yellow,
//                       height: variableData.screenHeight() * 0.19933,
//                       child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: PageView(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(10),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(10),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),


//                       Container(
//                         // color: Colors.black,
//                         child: IntrinsicHeight(
//                           child: Column(
//                             children: [
//                               Slidable(
//                                 key: const ValueKey(0),
//                                 endActionPane: const ActionPane(
//                                   motion: DrawerMotion(),
//                                   children: [
//                                     SlidableAction(
//                                       onPressed: doNothing,
//                                       backgroundColor: Color.fromARGB(100, 100, 100, 100),
//                                       foregroundColor: Colors.white,
//                                       icon: Icons.edit,
//                                       label: "Edit",
//                                     ),
//                                     SlidableAction(
//                                       onPressed: doNothing,
//                                       backgroundColor: Color.fromARGB(150, 255, 0, 0),
//                                       foregroundColor: Colors.white,
//                                       icon: Icons.delete_outline,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: variableData.colorList[0],
//                                     ),
//                                     child: Center(
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                                         child: Container(
//                                           // color: Colors.yellow,
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Container(
//                                                     width: 50,
//                                                   // color: Colors.blue,
//                                                     child: IconButton(
//                                                       icon: Icon(Icons.abc),
//                                                       onPressed: (){
//                                                         // print("123");
//                                                       },

//                                                     )
//                                                   ),

//                                                   Container(
//                                                     width: 200,
//                                                     // color: Colors.red,
//                                                     child: Column(
//                                                       mainAxisAlignment: MainAxisAlignment.start,
//                                                       children: [
//                                                         Container(
//                                                           // color: Colors.brown,
//                                                           height: 25,
//                                                           child: Row(
//                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                             children: [
//                                                               Text(
//                                                                   "Time: ",
//                                                                 style: TextStyle(
//                                                                   fontSize: 13,
//                                                                   // fontWeight: FontWeight.bold,
//                                                                 ),
//                                                               ),
//                                                               Text(
//                                                                 "All day",

//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         Container(
//                                                           // color: Colors.red,
//                                                           child: Text(
//                                                             "lakjddhklsjl234123412342lskjhglksjfdhgskdljfhgklsdjfhglsdkfj",
//                                                             style: TextStyle(
//                                                               fontSize: 16,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),

//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),


//                                                   Container(
//                                                     width: 50,
//                                                     // child: Icon(Icons.abc),
//                                                     // color: Colors.black,
//                                                     child: Center(
//                                                       child: Stack(
//                                                         children: [
//                                                           Center(
//                                                             child:InkWell(
//                                                               onTap: (){
//                                                                 setState(() {
//                                                                   isCompleteTask = !isCompleteTask;
//                                                                   // print(isCompleteTask);
//                                                                 });
//                                                               },
//                                                               child:
//                                                               Column(
//                                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                                 children: [
//                                                                   SizedBox(
//                                                                     height: 3,
//                                                                   ),
//                                                                   Container(
//                                                                     height: 27,
//                                                                     width: 27,
//                                                                     decoration: BoxDecoration(
//                                                                       shape: BoxShape.circle,
//                                                                       border: Border.all(
//                                                                         width: 1,
//                                                                         color: Colors.grey,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           isCompleteTask ?
//                                                           Center(
//                                                             child: 
                                                            
//                                                             InkWell(
//                                                               onTap: (){
//                                                                 setState(() {
//                                                                   isCompleteTask = false;
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                 height: 35,
//                                                                 width: 35,
//                                                                 // color: Colors.white,
//                                                                 child: Icon(Icons.check_circle_rounded,size: 35,color: Colors.green,),
//                                                               ),
//                                                             ),
//                                                           ) : Container(height: 1,),

//                                                         ],
//                                                       ),
//                                                     ),

//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),


//                     Container(height: variableData.screenHeight() * 0.099667,color: Colors.white,),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


