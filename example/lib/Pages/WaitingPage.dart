/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_chat/Pages/HomePage.dart';
import 'package:super_chat/Resources/Resources.dart';

class WaitingPage extends StatefulWidget {

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {

  void startHomePage() async{
    await new Future.delayed(new Duration(seconds: 4));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }


  //-----------------------------------------
  //--- Do all your task before launching the startHomeTab
  void asyncDoSomeTaskBeforeLaunchingAnyScreen() async{


    startHomePage();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(R.strings.waitingHeader,textAlign: TextAlign.center, style: TextStyle(
                  color: R.colors.primaryColor,
                  fontFamily: R.strings.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
              ),),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: MediaQuery.of(context).size.width - 60,
               child: Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                   child: FlareActor(R.images.meditate, alignment:Alignment.center, fit:BoxFit.contain, animation:"idle")),
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: R.colors.thirdColor,
               ),
            )
            ,
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(R.strings.waitingFooterHeader,textAlign: TextAlign.center, style: TextStyle(
                        color: R.colors.darkColor,
                        fontFamily: R.strings.fontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                    child: Text(R.strings.waitingFooterFooter,textAlign: TextAlign.center, style: TextStyle(
                        color: R.colors.darkColor,
                        fontFamily: R.strings.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                    ),),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  @override
  void initState() {
    asyncDoSomeTaskBeforeLaunchingAnyScreen();
  }
}