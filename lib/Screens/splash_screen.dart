import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xtreme_tourism/Screens/onBoardScreen.dart';

class Splash_Screen extends StatefulWidget {

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();

}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Onboard_Screen()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffFF4B0F),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                child: CircleAvatar(
                  radius: 200,
                  child:Lottie.asset("lottie/lottie2.json",) ,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Xtremes Tourism",style: TextStyle(color: Colors.white,fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
