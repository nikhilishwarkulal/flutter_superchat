/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Developer : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_chat/Blocs/ViewPagerEventBloc.dart';
import 'package:super_chat/CustomClippers/CustomOnboardingBottomCurveClipper.dart';
import 'package:super_chat/CustomWidgets/CustomOnboardingIndicator.dart';
import 'package:super_chat/CustomWidgets/CustomRaisedButton.dart';
import 'package:super_chat/Pages/WaitingPage.dart';
import 'package:super_chat/Resources/Resources.dart';

class OnboardingPage extends StatefulWidget {

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _viewPagerEventBloc = ViewPagerEventBloc();

  void onStartButtonClicked() async{
    // do your task here

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WaitingPage()),
    );
  }

  Widget getBackground(){
    return Stack(
      children: <Widget>[

        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: R.colors.primaryColor ,
        ),

        ClipPath(
          clipper: CustomOnboardingBottomCurveClipper(),
          child: Container(
            width: (MediaQuery.of(context).size.width + 150),
            height: (MediaQuery.of(context).size.width + 150),
            color: R.colors.secondaryColor ,
          ),
        ),

        ClipPath(
          clipper: CustomOnboardingBottomCurveClipper(),
          child: Container(
            width: (MediaQuery.of(context).size.width + 110),
            height: (MediaQuery.of(context).size.width + 110),
            color: R.colors.thirdColor ,
          ),
        ),
        ClipPath(
          clipper: CustomOnboardingBottomCurveClipper(),
          child: Container(
            width: (MediaQuery.of(context).size.width + 50),
            height: (MediaQuery.of(context).size.width + 50),
            color: R.colors.fourthColor ,
          ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
          width: (MediaQuery.of(context).size.width - 30),
          height: (MediaQuery.of(context).size.width - 30),

          decoration: BoxDecoration(
            color: R.colors.backgroundColor,
            shape: BoxShape.circle
          ),
        )


      ],
    );
  }

  Widget sliderCode(int page){
    return Stack(

      children: <Widget>[
        Container(

          margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
         width:MediaQuery.of(context).size.width ,
          height: (MediaQuery.of(context).size.width - 30),
          child: Image(image: AssetImage( (page == 0) ? R.images.slider_one : R.images.slider_two), fit: BoxFit.fitHeight,),
        ),
      ],
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        //Here is your code
        children: <Widget>[
            getBackground(),
          PageView.builder(
              itemCount: 2,
              onPageChanged: (index){
                _viewPagerEventBloc.add(index);
              },
              itemBuilder: (context,index){
            return sliderCode(index);
          }),

          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 60),
                  child: BlocBuilder(
                    bloc: _viewPagerEventBloc,
                    builder: (context , int index){
                      return Text(R.strings.onboardingText[index],textAlign: TextAlign.center, style: TextStyle(
                          color: R.colors.backgroundColor,
                          fontFamily: R.strings.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),);
                    },
                  ),

                ),
                BlocBuilder(
                   bloc: _viewPagerEventBloc,
                   builder: (context,int index){
                     return Container(
                         margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                         child: CustomOnboardingIndicator(index, 2,unselectedColor: R.colors.secondaryColor, selectedColor: R.colors.backgroundColor));
                   },

                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
                    child: CustomRaisedButton(text: "Start",textColor: R.colors.primaryColor, color: R.colors.defaultButtonColor,borderRadius: 22.5,onPressed: (){
                      onStartButtonClicked();
                    },)),

              ],
          )
        ],
      ),
    );
  }


}

