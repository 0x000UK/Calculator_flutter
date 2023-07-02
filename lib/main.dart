import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'display.dart';
import 'keypad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String input = '0';
  String output = '0';
  bool isEqualsButton = false;

  void _onButtonPressed(String buttonText){
      setState(() {
        if(buttonText == '=') {
          _calculateResult();
          isEqualsButton = true;
        }else if(buttonText == 'C') {
          _clearInput();

        }else if(buttonText == 'AC') {
          _allClear();
        }else{
          if (input == '0') {
            input = buttonText;
          }else {
            input += buttonText;
          }
        }
      }
    );
  }

  void _calculateResult() {
    try {
      final expression = input.replaceAll('÷', '/').replaceAll('x', '*');
      final evalResult = eval(expression);
      output = evalResult.toString();
    } catch (e) {
      output = 'Error';
    }
  }

  void _clearInput() {
    if ( input.isNotEmpty || input != '0') {
      input = input.substring(0, input.length - 1);
      isEqualsButton = false;
      if(input.isEmpty) {
        input = '0';
      }
    }
    if(input.isEmpty && output.isNotEmpty) {
      output = '';
      isEqualsButton = false;
    }
  }
  
  void _allClear(){
    input = '0';
    isEqualsButton = false;
  }

  double eval(String expression) {
    try {
      Parser parser = Parser();
      ContextModel contextModel = ContextModel();
      Expression exp = parser.parse(expression);
      double result = exp.evaluate(EvaluationType.REAL, contextModel);

      return result;
    }catch (e){
      return double.nan; // Return NaN (Not a Number) for invalid expressions
    }
  }

  void _onMoreButtonPressed(BuildContext context){}

  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          MyDisplay(
            screenSize: size,
            input: input, 
            output: output,
            moreButtonFunc: _onMoreButtonPressed,
            isEqualsButtonPressed: isEqualsButton
          ),
          MyKeys(fun: _onButtonPressed, scrSize: size,)
        ],
      )
    );
  }
}
