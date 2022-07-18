
import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {

IconTextRow({this.headingText,this.icon,this.text});
  final IconData icon;
  final String text;
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Color(0xffff6836),size: 30,),
        SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headingText,
              style:
              TextStyle( fontWeight: FontWeight.bold,fontSize: 15),
            ),
            Text(
              text,
              style:
              TextStyle( fontSize: 15),),
          ],
        ),
      ],
    );
  }
}
