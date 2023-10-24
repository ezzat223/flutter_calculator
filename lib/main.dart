// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // two values for calculations
  int num1 = 0, num2 = 0;
  // operator
  String operator = "";
  String result = "", text = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      result = "0";
      text = "";
      num1 = num2 = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      // save values first
      num1 = int.parse(text);
      result = "";
      operator = btnText;
    } else if (btnText == "sqr" ||
        btnText == "exp" ||
        btnText == "sin" ||
        btnText == "cos") {
      num1 = int.parse(text);
      num2 = 0;
      operator = btnText;
      switch (operator) {
        case "sqr":
          result = (sqrt(num1)).toString();
          break;
        case "exp":
          result = (exp(num1)).toString();
          break;
        case "sin":
          result = (sin(num1*pi/180)).toString();
          break;
        case "cos":
          result = (cos(num1*pi/180)).toString();
          break;
      }
    } else if (btnText == "=") {
      // calculate result
      num2 = int.parse(text);
      switch (operator) {
        case "+":
          result = (num1+ num2).toString();
          break;
        case "-":
          result = (num1- num2).toString();
          break;
        case "x":
          result = (num1* num2).toString();
          break;
        case "/":
          result = (num1/ num2).toString();
          break;
        case "sqr":
          result = (sqrt(num1)).toString();
          break;
        case "exp":
          result = (exp(num1)).toString();
          break;
        case "sin":
          result = (sin(num1)).toString();
          break;
        case "cos":
          result = (cos(num1)).toString();
          break;
      }
    } else {
      // when press a number (eg: 9 and 8 => result 98)
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget customOutlineButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(25),
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [
              customOutlineButton("sqr"),
              customOutlineButton("exp"),
              customOutlineButton("sin"),
              customOutlineButton("cos"),
            ],
          ),
          Row(
            children: [
              customOutlineButton("7"),
              customOutlineButton("8"),
              customOutlineButton("9"),
              customOutlineButton("+"),
            ],
          ),
          Row(
            children: [
              customOutlineButton("4"),
              customOutlineButton("5"),
              customOutlineButton("6"),
              customOutlineButton("-"),
            ],
          ),
          Row(
            children: [
              customOutlineButton("1"),
              customOutlineButton("2"),
              customOutlineButton("3"),
              customOutlineButton("x"),
            ],
          ),
          Row(
            children: [
              customOutlineButton("C"),
              customOutlineButton("0"),
              customOutlineButton("="),
              customOutlineButton("/"),
            ],
          ),
        ],
      ),
    );
  }
}
