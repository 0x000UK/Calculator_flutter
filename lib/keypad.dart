import 'package:flutter/material.dart';

class MyKeys extends StatelessWidget {

  final Function fun;
  final Size scrSize;

  const MyKeys({
      Key? key,
      required this.fun,
      required this.scrSize
    }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Expanded(
    
    child :Container(
    child : GridView.count(
      padding:const EdgeInsets.all(5),
      //mainAxisSpacing: (scrSize.height-300)/200,
      crossAxisCount: 4,
      children: [
          CalculatorButton(text: '(',function: fun,),
          CalculatorButton(text: ')',function: fun,),
          CalculatorButton(text: 'AC',function: fun,isAllClearButton: true),
          CalculatorButton(text: 'C',function: fun, isBackButton: true),
          CalculatorButton(text: '7',function: fun),
          CalculatorButton(text: '8',function: fun),
          CalculatorButton(text: '9',function: fun),
          CalculatorButton(text: '+',function: fun),
          CalculatorButton(text: '4',function: fun),
          CalculatorButton(text: '5',function: fun),
          CalculatorButton(text: '6',function: fun),
          CalculatorButton(text: '-',function: fun),
          CalculatorButton(text: '1',function: fun),
          CalculatorButton(text: '2',function: fun),
          CalculatorButton(text: '3',function: fun),
          CalculatorButton(text: 'x',function: fun),
          CalculatorButton(text: '.',function: fun),
          CalculatorButton(text: '0',function: fun),
          CalculatorButton(text: '=',function: fun, isEqualsButton: true),
          CalculatorButton(text: '/',function: fun),
        ],
      )
    )
      );
  }
}

class CalculatorButton extends StatelessWidget {

  final String text;
  final bool isEqualsButton;
  final bool isAllClearButton;
  final bool isBackButton;
  final Function function;

  static bool isDarkThemeEnabled = false;

  const CalculatorButton({
    Key? key,
    required this.function,
    required this.text,
    this.isEqualsButton = false,
    this.isAllClearButton = false,
    this.isBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(10),
    child: Ink(
      width: 60,
      height: 60,
      decoration:  BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:  isDarkThemeEnabled?Colors.black : Colors.white,
          ),
        ],
        borderRadius:const BorderRadius.all(
          Radius.circular(45)
        ),  
        color:  isEqualsButton?Colors.blue : 
                isAllClearButton?Colors.red: 
                isDarkThemeEnabled?Colors.black45 : 
                Colors.white70,
      ),
      child: InkWell(
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(45)),
        ),
        onTap:() {function(text);},
        child: Center(
          child: isBackButton?const Icon(Icons.backspace):Text(
            text,
            style: TextStyle(fontSize: 30,
              color: isDarkThemeEnabled?Colors.white : Colors.black54),
            ),
          )
        ),
      ),
    );
  }
}