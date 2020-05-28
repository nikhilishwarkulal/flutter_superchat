/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_chat/Resources/Resources.dart';

class CustomRaisedButton extends StatelessWidget {


  CustomRaisedButton({ this.text, this.onPressed,this.color,this.borderColor,this.textColor,this.borderRadius}) ;

  void Function() onPressed;
  final String text;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;



  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: new RoundedRectangleBorder(

          borderRadius: new BorderRadius.circular(borderRadius ?? 10.0),
          side: BorderSide(color: (borderColor ?? Colors.transparent))),
      onPressed: () {
        if(onPressed != null){  onPressed(); }
      },
      color:(color ?? R.colors.defaultButtonColor),

      textColor: Colors.white,
      child: Text(text ?? "",
          style: TextStyle(fontSize: 16,
              fontFamily: R.strings.fontName,
              fontWeight: FontWeight.w600,
            color: (textColor ?? Colors.white)
          )
      ),
    );
  }
}