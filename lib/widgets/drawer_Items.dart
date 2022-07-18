import 'package:flutter/material.dart';

class listViewItems extends StatelessWidget {
  listViewItems({this.title,this.icon,this.onClick});

  String title;
  IconData icon;
 VoidCallback onClick;
  final color=Colors.white;
  final hoverColor=Colors.white24;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(title,style: TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClick,
    );
  }
}
