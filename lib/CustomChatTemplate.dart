/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class CustomChatTemplate extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext,int) itemBuilder;
  final ScrollController scrollController;
  final void Function(int index) onTap;
  final void Function(int index) onLongTap;
  final ScrollController  _myScrollController = ScrollController();
  CustomChatTemplate(this.itemCount,{this.itemBuilder,this.scrollController,this.onTap,this.onLongTap});

  @override
  Widget build(BuildContext context) {
    return getChatTemplate();
  }


  void _scrollToLast() async{
    if(_myScrollController != null){
      await new Future.delayed(new Duration(milliseconds: 100));
      _myScrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  Widget getChatTemplate(){
    _scrollToLast();
    return Container(
      child: ListView.builder(
        itemCount: itemCount,
        reverse: true,
        controller: (this.scrollController != null) ? this.scrollController : _myScrollController,
        itemBuilder: (context,index){
           if(itemBuilder == null) {
             return ( index % 2 == 0 ? LeftMessage() : RightMessage());
           }
           else {

             Widget widget =  itemBuilder(context, index);

             return  _CustomDataWidget(child: widget,index: index,onTap: onTap,onLongTap: onLongTap,);
           }
        },
      ),
    );
  }

}

class _CustomDataWidget extends StatelessWidget{
  final Widget child;
  final int index;
  final void Function(int index) onTap;
  final void Function(int index) onLongTap;
  _CustomDataWidget({@required this.index,@required this.child,@required this.onTap,@required this.onLongTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        if(onTap!=null)
        onTap(index);
        print("tapped" + index.toString());
      },
      onLongPress: (){
        if(onLongTap!=null)
        onLongTap(index);
      },
      child: Container(
        child: child,
      ),
    );
  }

}



//--------Left Chat--------
class LeftMessage extends StatelessWidget {


  final String text;
  final Color backgroundColor;
  final Color textColor;
  final int fontSize;
  final Image tickImage;
  final String readText;
  final String fontName;
  LeftMessage({this.text,this.textColor,this.backgroundColor,this.fontSize,this.readText,this.tickImage,this.fontName});

  @override
  Widget build(BuildContext context) {
    return getLeftMessage(context);
  }


  Widget getLeftMessage(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, (MediaQuery.of(context).size.width / 2) - 10, 0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color:  backgroundColor ?? Color(0xFFFF9B70),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
          ),
          child: Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Text(text ?? "Nice! Give Your Own Text By Just inserting value to text parameter in LeftMessage class.", style: TextStyle(
                  color: textColor ?? Color(0xFFFFFFFF),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 16
              ),),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Text(readText ?? "" ,  style: TextStyle(
                  color: Color(0xFF707070),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
            ),
            tickImage==null ? Container( margin:  EdgeInsets.fromLTRB(5, 5, 10, 0),) :  Container(

                margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                height: 15,
                child: tickImage),
          ],
        ),
      ],
    );
  }
}


class LeftImage extends StatelessWidget{
  final Color backgroundColor;
  final Image tickImage;
  final String readText;
  final String fontName;
  final String heroTag;
  @required final Image image;
  LeftImage({this.backgroundColor,this.fontName,this.tickImage,this.readText,@required this.image,this.heroTag});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: (MediaQuery.of(context).size.width / 2) - 10
          ),
          child: Container(

            margin: EdgeInsets.fromLTRB(10, 15, (MediaQuery.of(context).size.width / 2) - 10, 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:  backgroundColor ?? Color(0xFFFF9B70),
                borderRadius: BorderRadius.only(

                )
            ),

              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),

                decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                ),
                child: Hero(
                    tag: heroTag ?? "",
                    child: image),
              ),

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Text(readText ?? "" ,  style: TextStyle(
                  color: Color(0xFF707070),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
            ),
            tickImage==null ? Container( margin:  EdgeInsets.fromLTRB(5, 5, 10, 0),) :  Container(

                margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                height: 15,
                child: tickImage),
          ],
        ),
      ],
    );
  }

}

class LeftVideo extends StatelessWidget{
  final Color backgroundColor;
  final Image tickImage;
  final String readText;
  final String fontName;
  final String heroTag;
  @required final Image thumbNail;
  LeftVideo({this.backgroundColor,this.fontName,this.tickImage,this.readText,@required this.thumbNail,this.heroTag});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: 100
          ),
          child: Container(

            margin: EdgeInsets.fromLTRB(10, 15, (MediaQuery.of(context).size.width / 2) - 10, 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:  backgroundColor ?? Color(0xFFFF9B70),
                borderRadius: BorderRadius.only(

                )
            ),

            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),

              decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.only(

                  )
              ),
              child: Hero(
                  tag: heroTag ?? "",
                  child: thumbNail),
            ),

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Text(readText ?? "" ,  style: TextStyle(
                  color: Color(0xFF707070),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
            ),
            tickImage==null ? Container( margin:  EdgeInsets.fromLTRB(5, 5, 10, 0),) :  Container(

                margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                height: 15,
                child: tickImage),
          ],
        ),
      ],
    );
  }

}


class RightVideo extends StatelessWidget{
  final Color backgroundColor;
  final Image tickImage;
  final String readText;
  final String fontName;
  final String heroTag;
  @required final Image thumbNail;
  RightVideo({this.backgroundColor,this.fontName,this.tickImage,this.readText,@required this.thumbNail,this.heroTag});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: 100
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width / 2) - 10, 15, 10, 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:  backgroundColor ?? Color(0xFFFF9B70),
                borderRadius: BorderRadius.only(

                )
            ),

            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),

              decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.only(

                  )
              ),
              child: Hero(
                  tag: heroTag ?? "",
                  child: thumbNail),
            ),

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(readText ?? "",  style: TextStyle(
                  color: Color(0xFF707070),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
            ),
            tickImage == null ? Container( margin: EdgeInsets.fromLTRB(5, 3, 10, 0),) : Container(

                margin: EdgeInsets.fromLTRB(5, 3, 10, 0),
                height: 15,
                child: tickImage),
          ],
        ),
      ],
    );
  }

}

class RightImage extends StatelessWidget{
  final Color backgroundColor;
  final Image tickImage;
  final String readText;
  final String fontName;
  final String heroTag;
  @required final Image image;
  RightImage({this.backgroundColor,this.fontName,this.tickImage,this.readText,@required this.image,this.heroTag});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: (MediaQuery.of(context).size.width / 2) - 10
          ),
          child: Container(

            margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width / 2) - 10, 15, 10, 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:  backgroundColor ?? Color(0xFFFF9B70),
                borderRadius: BorderRadius.only(

                )
            ),

            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),

              decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
              ),
              child: Hero(
                  tag: heroTag ?? "",
                  child: image),
            ),

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(readText ?? "",  style: TextStyle(
                  color: Color(0xFF707070),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
            ),
            tickImage == null ? Container( margin: EdgeInsets.fromLTRB(5, 3, 10, 0),) : Container(

                margin: EdgeInsets.fromLTRB(5, 3, 10, 0),
                height: 15,
                child: tickImage),
          ],
        ),
      ],
    );
  }

}

//-------------Right Chat---------
class RightMessage extends StatelessWidget {

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final int fontSize;
  final Image tickImage;
  final String readText;
  final String fontName;
  RightMessage({this.text,this.textColor,this.backgroundColor,this.fontSize,this.readText,this.tickImage,this.fontName});

  @override
  Widget build(BuildContext context) {
    return getRightMessage(context);
  }


  Widget getRightMessage(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width / 2) - 10, 0, 10, 0),
          width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
              color: backgroundColor ?? Color(0xFFF8B494),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
          ),
          child: Container(

            child: Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Text(text ??"Nice! Give Your Own Text By Just inserting value to text parameter in RightMessage class. Nice! Give Your Own Text By Just inserting value to text parameter in RightMessage class.", style: TextStyle(
                  color: textColor ?? Color(0xFFFFFFFF),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 16
              ),),
            ),

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(readText ?? "",  style: TextStyle(
                  color: Color(0xFF707070),
                  fontFamily: fontName ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
            ),
            tickImage == null ? Container( margin: EdgeInsets.fromLTRB(5, 3, 10, 0),) : Container(

                margin: EdgeInsets.fromLTRB(5, 3, 10, 0),
                height: 15,
                child: tickImage),
          ],
        ),
      ],
    );
  }
}


enum CustomChatType{
  message,
  image,
  video
}


