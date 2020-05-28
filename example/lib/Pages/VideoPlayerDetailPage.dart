/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_chat/Blocs/PlayPauseUpdateBloc.dart';
import 'package:super_chat/Blocs/VideoHoverBloc.dart';
import 'package:super_chat/Resources/Resources.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerDetailPage extends StatefulWidget {
  final String heroTag;
  final String videoUrl;
  VideoPlayerDetailPage(this.heroTag,this.videoUrl);
  @override
  _VideoPlayerDetailPageState createState() => _VideoPlayerDetailPageState(this.heroTag,this.videoUrl);
}


class _VideoPlayerDetailPageState extends State<VideoPlayerDetailPage> {


  final String heroTag;
  final String videoUrl;
  _VideoPlayerDetailPageState(this.heroTag,this.videoUrl);

  VideoPlayerController _controller;
  PlayPauseUpdateBloc _playPauseUpdateBloc = PlayPauseUpdateBloc();
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      videoUrl,
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(

        body: getPlayer(),
      ),
    );
  }


  Widget getPlayer(){
    return Stack(
      children: <Widget>[
        GestureDetector(

          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: R.colors.backgroundColor,

            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: Hero(
                          tag: heroTag,
                          child: VideoPlayer(_controller)),
                    ),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container(



                      child: Center(child: CircularProgressIndicator()));
                }
              },
            ),
          ),
        ),

        Positioned(
          right: 0,
          top: 50,
          child: Container(

            child: Row(

              children: <Widget>[

                IconButton(icon: Icon(Icons.close), onPressed: (){
                  _controller.pause();
                  _controller.dispose();
                 Navigator.pop(context);
                }),
              ],
            ),
          ),
        )
        ,
        Positioned(
          left: 10,
          top: 50,
          child: IconButton(icon: getIcon(), onPressed: (){
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();

            _playPauseUpdateBloc.add(_controller.value.isPlaying);
          }),
        )
      ],
    );
  }

  Widget  getIcon(){
    return BlocBuilder(
        bloc: _playPauseUpdateBloc,
        builder: (context,bool status){
          if(status)
            return Icon(Icons.pause_circle_outline,size: 30,);
          else
            return Icon(Icons.play_circle_outline,size: 30,);

        });
  }
}