/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomOnboardingIndicator extends StatelessWidget {

  final int selectedIndex;
  final int count;
  final double width;
  final double height;
  final Color selectedColor;
  final Color unselectedColor;

  CustomOnboardingIndicator(this.selectedIndex,this.count,{this.selectedColor,this.unselectedColor,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return getArrayOfCircled(selectedIndex,count,width: width,height: height,unselectedColor: unselectedColor,selectedColor: selectedColor);
  }

  Widget getArrayOfCircled(int selectedIndex,int count,{double width,double height, Color selectedColor, Color unselectedColor}){
    if(selectedIndex >= count){
      return null;
    }
    if(selectedIndex < 0){
      return null;
    }
    List<Widget> widgets = new List();
    Row row = new Row();
    for(int i =0 ;i<count ; i++){
      Color color = unselectedColor ?? Colors.deepOrangeAccent;
      if(selectedIndex == i){
        color = selectedColor ?? Colors.grey;
      }
      widgets.add(
          Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: getCircled(width ?? 10,height ?? 10, color,)
          )
      );
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets
    );
  }
  Widget getCircled(double width,double height,Color color){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}