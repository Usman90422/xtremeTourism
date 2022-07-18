import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtreme_tourism/Screens/home_screen.dart';
import 'package:xtreme_tourism/data/Onboard_slider.dart';
import 'package:xtreme_tourism/data/questions.dart';
import 'package:xtreme_tourism/data/questions_brain.dart';
import 'package:xtreme_tourism/widgets/question_answer.dart';

class Faq_screen extends StatefulWidget {
  @override
  _Faq_screenState createState() => _Faq_screenState();
}

bool isVisible = false;

Questions_brain questions_brain=Questions_brain();
Answers_brain answers_brain=Answers_brain();


class _Faq_screenState extends State<Faq_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
        ),
        title: Text("FAQ's",style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: questions_brain.questions_list.length,
              itemBuilder: (context,index){
                return Question_Answer(index: index,);
              }),
        ),
      ),
    );
  }
}

