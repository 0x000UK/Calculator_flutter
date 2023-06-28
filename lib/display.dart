import 'package:flutter/material.dart';

class MyDisplay extends StatelessWidget {

  final bool isEqualsButtonPressed;
  final Size screenSize;
  final String input;
  final String output;

  const MyDisplay(
    {Key? key,
      required this.screenSize,
      required this.input,
      required this.output,
      this.isEqualsButtonPressed = false
    }): super(key:key);

    Widget build(BuildContext context){
    return  Container(
      height: 200,
      color: Colors.black45,
      child :  Column(
        children: [
          isEqualsButtonPressed?
             SizedBox (
              width: screenSize.width,
              child : Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    output,
                    style:const  TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ) : 
            SizedBox (
              width: screenSize.width,
              child :Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   const Text(
                    '',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    input,
                    style:const TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            )
        ]
      )
      
    );
  }
}