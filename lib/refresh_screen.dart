import 'package:flutter/material.dart';
import 'package:captcha/main_screen.dart';

class RefreshScreen extends StatelessWidget {

  RefreshScreen({@required this.verificationDone});

  final bool verificationDone;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MainScreen()));
      },
      child: Scaffold(
        body: Center(
          child:  Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: MediaQuery.of(context).size.height/5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/7.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Icon(
                           verificationDone ? Icons.mood : Icons.mood_bad,
                            size: 40.0,
                            color: verificationDone ? Color(0xff00e676) : Colors.redAccent,
                          ),
                        ),
                        VerticalDivider(width: 25.0, indent: 20.0, endIndent: 20.0,),
                        Flexible(
                          child: Container(
                            child: Text(
                            verificationDone ? "Verification completed" :
                            "That's a wrong answer. Tap anywhere on the screen to start again.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff595959),
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffDCDCE5),
                            spreadRadius: 3.0,
                            blurRadius: 10.0,
                            offset: Offset(3,5)
                          )
                        ]
                    ),
                  ),
                  Divider(
                    thickness: 4.0,
                    color: verificationDone ? Color(0xff00e676) : Colors.redAccent,
                    height: 0.5, indent: 0.25,
                    endIndent: 0.25,
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
