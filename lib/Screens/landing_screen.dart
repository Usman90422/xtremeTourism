import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xtreme_tourism/Screens/home_screen.dart';
import 'package:xtreme_tourism/Screens/login_screen.dart';
import 'package:xtreme_tourism/Screens/signup_screen.dart';

class Landing_screen extends StatefulWidget {
  @override
  _Landing_screenState createState() => _Landing_screenState();
}

class _Landing_screenState extends State<Landing_screen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 800,
              child: Image(
                image: AssetImage("images/login_bg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
             padding: EdgeInsets.symmetric(vertical: 80,), //horizontal: 58 removed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Welcome to",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("XtremesTourism",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                )),
            Positioned(
              left: 50,
              right: 50,
              bottom: 150,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1 / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login_screen()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              bottom: 70,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1 / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signup_Screen()));
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    "Create a new account",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              bottom: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
