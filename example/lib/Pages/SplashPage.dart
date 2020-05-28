/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_chat/Pages/OnboardingPage.dart';
import 'package:super_chat/Resources/Resources.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  void startOnboarding() async{
    await new Future.delayed(new Duration(seconds: 3));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnboardingPage()),
    );
  }


  //-----------------------------------------
  //--- Do all your task before launching the startHomeTab
  void asyncDoSomeTaskBeforeLaunchingAnyScreen() async{


    startOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.backgroundColor,
      body: Center(
        child: Container(
          height: 200,
          child: Image(image: AssetImage(R.images.logo), fit: BoxFit.fill,),
        ),
      ),
    );
  }

  @override
  void initState() {
    asyncDoSomeTaskBeforeLaunchingAnyScreen();
  }
}