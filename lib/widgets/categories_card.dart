import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class categories_card extends StatelessWidget {
  const categories_card({this.title,this.image});

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ]),
        width: 200,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10,),
            Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ]),
                child: image),
            SizedBox(width: 15,),
            Center(child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          ],
        ),
      ),
    );
  }
}