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
    }
  ): super(key:key);

  Widget build(BuildContext context){

    //To check width of text span so that it does not over flow
    final textSpan = TextSpan(
      text: input,
      style: const TextStyle(fontSize: 70, color: Colors.white)
    );

    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();

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
                    style: TextStyle(
                      fontSize:  tp.width>screenSize.width?50.0: 40.0,
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
                    style: TextStyle(
                      fontSize: tp.width>screenSize.width? 35.0 : 70.0,
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