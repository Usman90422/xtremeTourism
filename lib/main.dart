import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtreme_tourism/Screens/aboutUs_screen.dart';
import 'package:xtreme_tourism/Screens/dummy.dart';
import 'package:xtreme_tourism/Screens/faq_screen.dart';
import 'package:xtreme_tourism/Screens/home_screen.dart';
import 'package:xtreme_tourism/Screens/landing_screen.dart';
import 'package:xtreme_tourism/Screens/signup_screen.dart';
import 'package:xtreme_tourism/Screens/splash_screen.dart';
import 'package:xtreme_tourism/Screens/tourDetails_Screen.dart';
import 'package:xtreme_tourism/tabs/home_tab.dart';
import 'package:xtreme_tourism/tabs/profile_tab.dart';
import 'package:xtreme_tourism/widgets/calender.dart';
import 'Screens/search_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xffff6836)));
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Splash_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
