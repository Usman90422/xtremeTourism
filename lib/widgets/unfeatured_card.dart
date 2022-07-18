import 'package:flutter/material.dart';

class unfeatured_card extends StatelessWidget {

  unfeatured_card({
    this.price,this.title,this.duration,this.image,this.onTap
  }) ;

  final String title;
  final String price;
  final String duration;
  final AssetImage image;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 15),
        height: 260,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Image(
                  image: image,
                ),
            Padding(padding:EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(price,style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),),

            Padding(padding:EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.lock_clock),
                  SizedBox(width: 5,),
                  Text(duration,style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
