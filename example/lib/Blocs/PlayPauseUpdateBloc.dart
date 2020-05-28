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

import 'package:super_chat/Models/ChatModel.dart';

class PlayPauseUpdateBloc extends Bloc<bool, bool> {

  @override
  // TODO: implement initialState
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(bool event) async* {
    // TODO: implement mapEventToState

    yield event;
  }

}
