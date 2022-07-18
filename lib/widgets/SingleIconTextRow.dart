import 'package:flutter/material.dart';

class SingleIconTextRow extends StatelessWidget {

  SingleIconTextRow({this.icon,this.text,this.color,this.textColor});
  final IconData icon;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Icon(icon,color:color,size: 20,),
          SizedBox(width: 10,),
          Text(
            text,
            style:
            TextStyle(fontSize: 12,color: textColor),),
        ],
      ),
    );
  }
}
