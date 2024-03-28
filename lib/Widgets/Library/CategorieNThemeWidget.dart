import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'VariableDataLibraryClass.dart';

class CategorieNTheme extends StatefulWidget {
  @override
  State<CategorieNTheme> createState() => _CategorieNThemeState();
}

class _CategorieNThemeState extends State<CategorieNTheme> {
  bool _isPressed = false;
  int Categorie = 0;
  int Theme = 0;
  @override
  Widget build(BuildContext context) {
    VariableData variableData = VariableData(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.black, Color.fromARGB(255, 100, 100, 100)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      height: variableData.screenHeight(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: variableData.screenHeight() * 0.1,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context, [Categorie, Theme]);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'Categories and Theme',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: variableData.screenHeight() * 0.88,
            width: variableData.screenWidth() - 20,
            child: ListView(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 90,
                    // color: Colors.blue,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Themes",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Choose a theme you like",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1220,
                  // color: Colors.blue,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        8,
                        (i) => Container(
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              2,
                              (j) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: InkWell(
                                  onTapDown: (_) {
                                    setState(() {
                                      Theme = i * 2 + j;
                                      _isPressed = !_isPressed;
                                    });
                                    if (_isPressed) {
                                      Timer(Duration(milliseconds: 200), () {
                                        setState(() {
                                          _isPressed = false;
                                        });
                                      });
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    width: _isPressed && Theme == i * 2 + j
                                        ? 145
                                        : 150,
                                    height: _isPressed && Theme == i * 2 + j
                                        ? 145
                                        : 150,
                                    alignment: Alignment.center,
                                    // color: Colors.green,
                                    child: Stack(
                                      children: [
                                        PhysicalModel(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          elevation: 10,
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            decoration: Theme == i * 2 + j
                                                ? BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                    border: Border.all(
                                                      color: Colors.blue,
                                                      width: 2,
                                                    ),
                                                  )
                                                : null,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                variableData
                                                        .MotivationPicturePath[
                                                    i * 2 + j],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Theme == i * 2 + j
                                                  ? Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      color: Colors.white,
                                                    )
                                                  : null,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 80,
                    // color: Colors.blue,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Select the type of quotes you prefer",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
