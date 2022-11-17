import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../Widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  //Creating  a Button List
  List button = [
    "AC",
    "DLT",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "=",
  ];
  //Expression method() create
  void expression() {
    Parser p = Parser();
    Expression exp = p.parse(userInput);
    ContextModel cm = ContextModel();
    var evalue = exp.evaluate(EvaluationType.REAL, cm);
    userInput = evalue.toString();
  }

  //Operations create
  isOperator(String x) {
    if (x == "%" || x == "+" || x == "-" || x == "*" || x == "/" || x == "=") {
      return true;
    }
    return false;
  }

  var userInput = "";
  var userOutput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 85.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        userInput,
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                    ),
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        userOutput,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 350,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: button.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              userInput = "";
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  button[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (index == 1) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  button[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (index == button.length - 1) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              expression();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  button[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              userInput = userInput + button[index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isOperator(button[index])
                                    ? Colors.amber
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  button[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ),
            )
          ],
        ));
  }
}
