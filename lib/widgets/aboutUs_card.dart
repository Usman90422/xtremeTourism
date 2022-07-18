import 'package:flutter/material.dart';


class AboutUsCard extends StatelessWidget {
  AboutUsCard({this.title,this.desc,this.point,});

  final String title;
  final String point;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                  color:  Color(0xffff6836),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              desc,
              style: TextStyle(
                  color:  Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 10,),


        ],
      ),
    );
  }
}
