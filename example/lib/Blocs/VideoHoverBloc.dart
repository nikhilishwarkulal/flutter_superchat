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

class VideoHoverBloc extends Bloc<VideoHoverHandler, VideoHoverHandler> {

  @override
  // TODO: implement initialState
  VideoHoverHandler get initialState => VideoHoverHandler(isPlay: false,heroTag: "",videoUrl: "");

  @override
  Stream<VideoHoverHandler> mapEventToState(VideoHoverHandler event) async* {
    // TODO: implement mapEventToState

    yield VideoHoverHandler(isPlay: event.isPlay,videoUrl: event.videoUrl,heroTag: event.heroTag);
  }

}

class VideoHoverHandler{
  bool isPlay = false;
  String videoUrl = "";
  String heroTag = "";
  VideoHoverHandler({this.videoUrl,this.heroTag,this.isPlay});
}

