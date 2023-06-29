import 'package:flutter/material.dart';

class MyKeys extends StatelessWidget {

  const MyKeys({super.key});

  @override
  Widget build(BuildContext context){
    return Expanded(
    
    child :Container(
      //color: Colors.blue,
    child : GridView.count(
      crossAxisCount: 4,
      children:const [

          CalculatorButton(text: '7'),
          CalculatorButton(text: '8'),
          CalculatorButton(text: '9'),
          CalculatorButton(text: '+'),
          CalculatorButton(text: '4'),
          CalculatorButton(text: '5'),
          CalculatorButton(text: '6'),
          CalculatorButton(text: '-'),
          CalculatorButton(text: '1'),
          CalculatorButton(text: '2'),
          CalculatorButton(text: '3'),
          CalculatorButton(text: 'x'),
          CalculatorButton(text: '.'),
          CalculatorButton(text: '0'),
          CalculatorButton(text: '=', isEqualsButton: true),
          CalculatorButton(text: '/'),
        ],
      )
    )
      );
  }
}

class CalculatorButton extends StatelessWidget {

  final String text;
  final bool isEqualsButton;


  const CalculatorButton({
    Key? key,
    required this.text,
    this.isEqualsButton = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(10),
    child: Ink(
      width: 60,
      height: 60,
      decoration:  BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color:  Colors.grey,
            offset: Offset(2, 1),
            blurRadius: 2
          ),
        ],
        borderRadius:const BorderRadius.all(
          Radius.circular(45)
        ),  
        color: isEqualsButton?Colors.blue : Colors.white70,
      ),
      child: InkWell(
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(45)),
        ),
        onTap:() {},
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.black54),
          )
        ),
      ),
    )
  );
  }
}