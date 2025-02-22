import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //basic variables
  String _output = "";
  String _operand = "";
  double _num1 = 0;
  double _num2 = 0;

  //calculator functions
  void calculation(String value) {
    setState(() {
      if (value == "C") {
        //when press clear button set to initial value
        _output = "";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else if (value == "=") {
        // when press = button calculate
        if (_operand.isNotEmpty) {
          // as long as there is operand
          switch (_operand) {
            case "+": // when operand is +
              _output = (_num1 + _num2)
                  .toString(); //add num1 and num2 and convert it to string
              break;
            case "-": // when operand is -
              _output = (_num1 - _num2)
                  .toString(); //subtract num1 and num2 and convert it to string
              break;
            case "*": // when operand is *
              _output = (_num1 * _num2)
                  .toString(); //add num1 and num2 and convert it to string
              break;
            case "/": // when operand is +
              if (_num2 == 0) {
                "Error";
              } else {
                _output = (_num1 / _num2)
                    .toString(); //add num1 and num2 and convert it to string
                break;
              }
          }
        }
      } else if (["+", "-", "*", "/"].contains(value)) {
        // when operand button is pushed save thenm to operand
        _operand = value;
      } else {
        _output += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
