/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_superchat/CustomChatTemplate.dart';

import 'package:super_chat/Models/ChatModel.dart';

class OnNewChatUpdatedBlocBloc extends Bloc<OnNewChatUpdatedBlocBlocModel, OnNewChatUpdatedBlocBlocModel> {

  @override
  // TODO: implement initialState
  OnNewChatUpdatedBlocBlocModel get initialState => OnNewChatUpdatedBlocBlocModel(event: OnNewChatUpdatedBlocEvent.nothing,index: 0,stringToAddIfAny: "");

  @override
  Stream<OnNewChatUpdatedBlocBlocModel> mapEventToState(OnNewChatUpdatedBlocBlocModel event) async* {
    // TODO: implement mapEventToState
    if(event.event == OnNewChatUpdatedBlocEvent.isAdd) {
      ListOfChatModels.chatModels.insert(
          0, ChatModel(event.stringToAddIfAny, false, CustomChatType.message));
    }else if(event.event == OnNewChatUpdatedBlocEvent.isDelete){
      ListOfChatModels.chatModels.removeAt(event.index);
    }
    yield OnNewChatUpdatedBlocBlocModel(stringToAddIfAny: event.stringToAddIfAny,index: event.index,event: event.event);
  }

}

class OnNewChatUpdatedBlocBlocModel{
  OnNewChatUpdatedBlocEvent event;
  String stringToAddIfAny;
  int index;
  OnNewChatUpdatedBlocBlocModel({this.event,this.index,this.stringToAddIfAny});
}

enum OnNewChatUpdatedBlocEvent{
  isAdd,
  isDelete,
  isUpdate,
  nothing
}