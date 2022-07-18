import 'package:flutter/material.dart';
import 'package:xtreme_tourism/Screens/aboutUs_screen.dart';
import 'package:xtreme_tourism/data/aboutUs_desc.dart';

class XtremeProjects_Card extends StatefulWidget {

  bool isVisible=true;

  final String title;
  final String desc;
  final AssetImage image;

  XtremeProjects_Card({ this.title, this.desc, this.image});


  @override
  _XtremeProjects_CardState createState() => _XtremeProjects_CardState();
}

class _XtremeProjects_CardState extends State<XtremeProjects_Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          isVisible =!isVisible;
        });
      },
      child:  isVisible ?  Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 15,top: 10,bottom: 10),
        height: 200,
        width: 250,
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
        child: Image(
          image: widget.image,
        ),
      )
          : Visibility(
        visible: !isVisible,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(left: 15,top: 10,bottom: 10),
          height: 200,
          width: 250,
          decoration: BoxDecoration(
              color:  Color(0xffff6836),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ]),
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),),
              Text(widget.desc,style: TextStyle(color: Colors.white,fontSize: 10),)],),
        ),
      ),
    );
  }
}
