import 'package:flutter/material.dart';
import 'package:xtreme_tourism/Screens/faq_screen.dart';

class Question_Answer extends StatefulWidget {

  final int index;

  const Question_Answer({Key key, this.index}) : super(key: key);
  @override
  _Question_AnswerState createState() => _Question_AnswerState();
}

class _Question_AnswerState extends State<Question_Answer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() =>isVisible =!isVisible );
          },
          child: Container(
            margin:EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: !isVisible
                  ? BorderRadius.circular(20)
                  : BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color(0xffff6836),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.question_answer,
                  color: Colors.white,
                ),
                SizedBox(width: 5,),
                Flexible(
                  child: Text(
                    "${questions_brain.questions_list[widget.index].questionText}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),

        Visibility(
          visible: isVisible ,
          child: Container(
            margin:EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ]),
            width: double.infinity,
            child: Text("${answers_brain.answers_list[widget.index].answerText}"),
          ),),
        SizedBox(height: 20,),
      ],
    );
  }
}
