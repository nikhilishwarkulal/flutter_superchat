/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_superchat/CustomChatTemplate.dart';


class ChatModel{
  String text;
  bool isLeftChat;
  CustomChatType type;
  ChatModel(this.text,this.isLeftChat,this.type);
}


class ListOfChatModels{
 static List<ChatModel> chatModels =  List();

 static loadDefaultValue(){
   chatModels.clear();
   chatModels.add(ChatModel("Nice! Give Your Own Text By Just inserting value to text parameter in LeftMessage class.", false,CustomChatType.video));
   chatModels.add(ChatModel("Nice! Give Your Own Text By Just inserting value to text parameter in RightMessage class.", false,CustomChatType.message));
   chatModels.add(ChatModel("Nice! Give Your Own Text By Just inserting value to text parameter in LeftMessage class.", true,CustomChatType.image));
   chatModels.add(ChatModel("Nice! Give Your Own Text By Just inserting value to text parameter in RightMessage class. Nice! Give Your Own Text By Just inserting value to text parameter in RightMessage class.", false,CustomChatType.message));
   chatModels.add(ChatModel("Nice! Give Your Own Text By Just inserting value to text parameter in LeftMessage class.", true,CustomChatType.message));

 }

}