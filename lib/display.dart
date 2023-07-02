import 'package:flutter/material.dart';

class MyDisplay extends StatelessWidget {

  final bool isEqualsButtonPressed;
  final Size screenSize;
  final String input;
  final String output;
  final Function moreButtonFunc;

  const MyDisplay(
    {Key? key,
      required this.screenSize,
      required this.input,
      required this.output,
      required this.moreButtonFunc,
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
      height: 300,
      color: Colors.black45,
      child :  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, size: 30,),
                onPressed: (){},
                tooltip: "Menu",
              ),
              const Text("Calculator",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500
                )
              ),
              IconButton(
                  icon: const Icon(Icons.more_vert_rounded, size: 30,),
                  onPressed: (){moreButtonFunc (context);},
                  tooltip: "more",
              )
            ],
          ),
          isEqualsButtonPressed?
            SizedBox (
              width: screenSize.width,
              child : Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                      '',
                      style:TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
//                3. overflow bug fix
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child : Text(
                      input,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const Text(
                      '',
                      style:TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      output,
                      style:const  TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              )
            ) : 
            SizedBox (
              width: screenSize.width,
              child :Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: tp.width>screenSize.width?100.0: 90.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child :Text(
                      input,
                      style: TextStyle( 
                        fontSize: tp.width>screenSize.width? 35.0 : 60.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            )
        ]
      )
      
    );
  }
}