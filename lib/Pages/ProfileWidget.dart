import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tva/Pages/LoginPage.dart';
import 'VariablesDataClass.dart';

class ProfileWidget extends StatefulWidget {
  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool isPressedLogOut = false;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Container(
      height: variableData.screenHeight(),
      width: variableData.screenWidth(),
      // color: Colors.pink,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return Container(
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: variableData.screenHeight(),
                      width: variableData.screenWidth() * 0.65,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(250, 0, 0, 0),
                            Color.fromARGB(255, 100, 100, 100),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      // color: variableData.backgroundColor4_3D,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                        child: Container(
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: variableData.screenHeight() * 0.0872,
                                // color: Colors.blue,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      // color: Colors.green,
                                      width:
                                      variableData.screenWidth() * 0.41666,
                                      child: Column(
                                        children: [
                                          Container(
                                            height:
                                            variableData.screenHeight() *
                                                0.0498,
                                            width: variableData.screenWidth() *
                                                0.41666,
                                            // color: Colors.blue,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "${data['user_name']}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: variableData.screenWidth() *
                                                0.41666,
                                            // color: Colors.yellow,
                                            height:
                                            variableData.screenHeight() *
                                                0.03114,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${user.email!}",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 60,
                                      // color: Colors.yellow,
                                      child: Icon(
                                        Icons.supervised_user_circle,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 200,
                                // color: Colors.pink,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 29,
                                      child: const Text(
                                        "ACCOUNT",
                                        style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 0.8,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isPressedLogOut = !isPressedLogOut;
                                  });
                                },
                                child: Container(
                                  height: variableData.screenHeight() * 0.07,
                                  // color: Colors.blue,
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        width: 400,
                                        left: isPressedLogOut ? 300 : 0,
                                        duration: Duration(milliseconds: 200),
                                        // Sửa từ microseconds thành milliseconds
                                        child: Container(
                                          height: variableData.screenHeight() *
                                              0.07,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Center(
                                            child: Container(
                                              // color: Colors.green,
                                              width:
                                              variableData.screenWidth() *
                                                  0.41666,
                                              child: const Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Log Out",
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              _signOut();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const LoginPage()),
                                              );
                                            },
                                            icon: Icon(Icons.logout),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 0.8,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
