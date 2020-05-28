/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_superchat/CustomChatTemplate.dart';
import 'package:super_chat/Blocs/OnNewChatUpdateBloc.dart';
import 'package:super_chat/Blocs/VideoHoverBloc.dart';
import 'package:super_chat/CustomWidgets/CustomAlertOverlay.dart';

import 'package:super_chat/Models/ChatModel.dart';
import 'package:super_chat/Pages/ImageDetailPage.dart';
import 'package:super_chat/CustomWidgets/CustomVideoHover.dart';
import 'package:super_chat/Resources/Resources.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  void startImageDetailPage(String heroTag) async{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImageDetailPage(heroTag)),
    );
  }



  void openVideoHoverScreen(String heroTag) async{
    _onVideoHoverBloc.add(VideoHoverHandler(isPlay: true,heroTag: heroTag,videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
  }

  final _onNewChatUpdateBBloc = OnNewChatUpdatedBlocBloc();
  final _onVideoHoverBloc = VideoHoverBloc();

  TextEditingController _textEditingController = TextEditingController();
  double y= 80;
  bool gestureStatus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              //----------------header Section--------------------------
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: R.colors.primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: Text(R.strings.homeScreenHeader,textAlign: TextAlign.center, style: TextStyle(
                          color: R.colors.backgroundColor,
                          fontFamily: R.strings.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 28
                      ),),
                    ),

                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                        height: 20,
                        child: Image(image: AssetImage(R.images.more_icon), fit: BoxFit.fitWidth,)),
                  ],
                ),


              ),

              //----------------Chat Template Section--------------------------
              Expanded(child:

                  BlocBuilder(
                    bloc: _onNewChatUpdateBBloc,
                    builder: (context,OnNewChatUpdatedBlocBlocModel test){
                      return CustomChatTemplate(ListOfChatModels.chatModels.length,
                        onTap: (int index){
                          if(ListOfChatModels.chatModels[index].isLeftChat){
                              if(ListOfChatModels.chatModels[index].type == CustomChatType.image){
                                startImageDetailPage(index.toString());
                              }
                              if(ListOfChatModels.chatModels[index].type == CustomChatType.video){
                                openVideoHoverScreen(index.toString());
                              }
                          }else{
                            if(ListOfChatModels.chatModels[index].type == CustomChatType.video){
                              openVideoHoverScreen(index.toString());
                            }
                          }
                        },
                        onLongTap: (int index){
                         CustomAlertOverlay()
                           ..setIndex(index)
                           ..setOnNewChatUpdatedBlocBloc(_onNewChatUpdateBBloc)
                           ..showOverLay(context);

                        },
                        itemBuilder: (context,index){

                         if(ListOfChatModels.chatModels[index].isLeftChat) {
                           if(ListOfChatModels.chatModels[index].type == CustomChatType.image){
                             return LeftImage(image:  getAnImage(),heroTag: index.toString(), );
                           }
                           if(ListOfChatModels.chatModels[index].type == CustomChatType.video){
                             return LeftVideo(thumbNail:  Image(image: AssetImage(R.images.thumbnail), fit: BoxFit.fitWidth,)
                               ,heroTag: index.toString(), );
                           }
                           return LeftMessage(fontName: R.strings.fontName,
                            text: ListOfChatModels.chatModels[index].text,
                            backgroundColor: R.colors.primaryColor,);
                        }else {
                           if(ListOfChatModels.chatModels[index].type == CustomChatType.video){
                             return RightVideo(thumbNail:  Image(image: AssetImage(R.images.thumbnail), fit: BoxFit.fitWidth,)
                               ,heroTag: index.toString(),
                               readText: "Read 12:25 AM",
                               tickImage: Image(image: AssetImage(
                                   R.images.subway_tick), fit: BoxFit.fitWidth,),
                             );
                           }
                           return RightMessage(fontName: R.strings.fontName,
                             text: ListOfChatModels.chatModels[index].text,
                             backgroundColor: R.colors.secondaryColor,
                             readText: "Read 12:25 AM",
                             tickImage: Image(image: AssetImage(
                                 R.images.subway_tick), fit: BoxFit.fitWidth,),);
                         }
                      },
                      );
                    },

                  )),


              //----------------Send Message Footer Section--------------------------
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: R.colors.fourthColor,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 50,

                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Write Something ...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if( _textEditingController.text.trim() == "")
                          return;
                        _onNewChatUpdateBBloc.add(OnNewChatUpdatedBlocBlocModel(event: OnNewChatUpdatedBlocEvent.isAdd,index: 0,stringToAddIfAny: _textEditingController.text));
                        _textEditingController.text = "";
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: 20,
                          child: Image(image: AssetImage(R.images.tall_right_arrow_icon), fit: BoxFit.fitWidth,)),
                    ),
                  ],
                ),
              )
            ],
            //Here is your code
          ),

          BlocBuilder(
              bloc: _onVideoHoverBloc,
              builder: (BuildContext context,VideoHoverHandler handler){
                if(handler.isPlay){
                  return showVideoPlayer(handler.videoUrl,handler.heroTag);
                }else{
                  return Container();
                }
              },
          )
          ,

        ],
      ),
    );
  }


  Image getAnImage(){
    return Image.network("https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",

      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          height: (MediaQuery.of(context).size.width / 2) - 10,
          color: R.colors.primaryColor,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
                  : null,
            ),
          ),
        );
      },
    );
  }

  AnimationController controller;
  @override
  void initState() {
    //Load Default value to chat.

    ListOfChatModels.loadDefaultValue();
    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 800,
      duration: Duration(milliseconds: 1000 ),

    );

    controller.animateTo(80);
  }


  Widget showVideoPlayer([String url,String hero]){
    return  Container(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context,widget){
          return Positioned(
              top: gestureStatus ? controller.value : y,
              width: MediaQuery.of(context).size.width,

              child: GestureDetector(
                  onHorizontalDragEnd: (drag){
                    gestureStatus = true;
                    if(y >= MediaQuery.of(context).size.height - 300) {
                      y= MediaQuery.of(context).size.height - 300;
                      controller.animateTo(y);
                    }
                    else if(y <= 120){
                      y = 120;
                      controller.animateTo(y);
                    }
                  },
                  onHorizontalDragUpdate: (drag){
                    gestureStatus = false;
                    y = drag.globalPosition.dy;
                    controller.value = y;
                    controller.animateTo(y);

                  },
                  child: CustomVideoHover(hero,url,_onVideoHoverBloc)));
        },
        child: Positioned(
            top: y,
            width: MediaQuery.of(context).size.width,

            child: GestureDetector(

                onHorizontalDragEnd: (drag){
                  gestureStatus = true;
                  if(y >= MediaQuery.of(context).size.height - 300) {
                    y= MediaQuery.of(context).size.height - 300;
                    controller.animateTo(y);
                  }
                  else if(y <= 120){
                    y = 120;
                    controller.animateTo(y);
                  }
                },
                onHorizontalDragUpdate: (drag){
                  gestureStatus = false;
                  y = drag.globalPosition.dy;
                  controller.value = y;
                  controller.animateTo(y);

                },
                child: CustomVideoHover(hero,url,_onVideoHoverBloc))),
      ),
    );
  }

}