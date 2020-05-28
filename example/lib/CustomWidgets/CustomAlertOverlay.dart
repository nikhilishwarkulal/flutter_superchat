/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_chat/Blocs/OnNewChatUpdateBloc.dart';
import 'package:super_chat/Resources/Resources.dart';

class CustomAlertOverlay {

  int index=0;
  OnNewChatUpdatedBlocBloc _onNewChatUpdatedBlocBloc;
  void setIndex(int index){
    this.index = index;
  }


  void setOnNewChatUpdatedBlocBloc( OnNewChatUpdatedBlocBloc _onNewChatUpdatedBlocBloc){
    this._onNewChatUpdatedBlocBloc = _onNewChatUpdatedBlocBloc;
  }

  void showOverLay(BuildContext context){
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (BuildContext context){
      return Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: GestureDetector(
              onTap: () async{
                overlayEntry.remove();
              },
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          )
          ,
          Positioned(
            top: (MediaQuery.of(context).size.height/2) - 50,
            left: (MediaQuery.of(context).size.width/2) - ((MediaQuery.of(context).size.width/1.5)/2),
            child: Container(
              width: MediaQuery.of(context).size.width/1.5,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),

              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width/1.5,
                    height: 150,

                    child:  Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(R.strings.deleteHeader,textAlign: TextAlign.center, style: TextStyle(
                              decoration: TextDecoration.none,
                              color: R.colors.primaryColor,
                              fontFamily: R.strings.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: Text(R.strings.deleteMessage,textAlign: TextAlign.center, style: TextStyle(
                              decoration: TextDecoration.none,
                              color: R.colors.darkColor,
                              fontFamily: R.strings.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _onNewChatUpdatedBlocBloc.add(OnNewChatUpdatedBlocBlocModel(index: index,event: OnNewChatUpdatedBlocEvent.isDelete));
                      overlayEntry.remove();
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: R.colors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 49.5,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(R.strings.deletePositive,textAlign: TextAlign.center, style: TextStyle(
                            decoration: TextDecoration.none,
                            color: R.colors.backgroundColor,
                            fontFamily: R.strings.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });


    overlayState.insert(overlayEntry);
  }
}