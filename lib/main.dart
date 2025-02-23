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
  String _operator = "";
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
        _operator = "";
      } else if (value == "=") {
        _num2 = double.tryParse(_output) ??
            0; // when = is pressed push output into numb2 (chaning to double) check if null or not
        // when press = button calculate
        if (_operator.isNotEmpty) {
          // as long as there is operator
          switch (_operator) {
            case "+": // when operator is +
              _output = (_num1 + _num2)
                  .toString(); //add num1 and num2 and convert it to string
              break;
            case "-": // when operator is -
              _output = (_num1 - _num2)
                  .toString(); //subtract num1 and num2 and convert it to string
              break;
            case "*": // when operator is *
              _output = (_num1 * _num2)
                  .toString(); //add num1 and num2 and convert it to string
              break;
            case "/": // when operator is +
              if (_num2 == 0) {
                _output = "Error";
              } else {
                _output = (_num1 / _num2)
                    .toString(); //add num1 and num2 and convert it to string
                break;
              }
          } // after calculation is done, save the output as numb 1 and set everything else as initial
          _num1 = double.tryParse(_output) ?? 0;
          _num2 = 0;
          _operator = "";
        }
      } else if (["+", "-", "*", "/"].contains(value)) {
        // when operator button is pushed save thenm to operator as well as updating num1 and clearing output
        _num1 = double.tryParse(_output) ?? 0;
        _operator = value;
        _output = "";
      } else {
        _output += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CalculatorApp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //building basic calculator layout
          children: [
            //output
            Container(
              color: Colors.lightBlue,
              child: Text(
                "Output: $_num1 $_operator $_num2",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            //buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => calculation('+'), child: Text('+')),
                  ElevatedButton(
                      onPressed: () => calculation('-'), child: Text('-')),
                  ElevatedButton(
                      onPressed: () => calculation('*'), child: Text('*')),
                  ElevatedButton(
                      onPressed: () => calculation('/'), child: Text('/'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => calculation('7'), child: Text('7')),
                  ElevatedButton(
                      onPressed: () => calculation('8'), child: Text('8')),
                  ElevatedButton(
                      onPressed: () => calculation('9'), child: Text('9')),
                  ElevatedButton(
                      onPressed: () => calculation('='), child: Text('='))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => calculation('4'), child: Text('4')),
                  ElevatedButton(
                      onPressed: () => calculation('5'), child: Text('5')),
                  ElevatedButton(
                      onPressed: () => calculation('6'), child: Text('6')),
                  ElevatedButton(
                      onPressed: () => calculation('C'), child: Text('C'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => calculation('1'), child: Text('1')),
                  ElevatedButton(
                      onPressed: () => calculation('2'), child: Text('2')),
                  ElevatedButton(
                      onPressed: () => calculation('3'), child: Text('3')),
                  ElevatedButton(
                      onPressed: () => calculation('0'), child: Text('0'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
