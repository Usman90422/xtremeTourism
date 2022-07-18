import 'package:flutter/material.dart';

class featured_card extends StatefulWidget {
  featured_card({
    this.price,this.title,this.duration,this.image,this.onTap
  }) ;

  final String title;
  final String price;
  final String duration;
  final AssetImage image;
  final VoidCallback onTap;

  @override
  _featured_cardState createState() => _featured_cardState();
}

class _featured_cardState extends State<featured_card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
            Stack(
              children: [
                Image(
                  image: widget.image,
                ),
                Positioned(
                  left:0,
                  top: 10,
                  child: Container(
                    height: 35,
                    padding: EdgeInsets.all(10),
                    color:  Color(0xffff6836),
                    child: Text("Featured",style: TextStyle(color: Colors.white),),
                  ),),
              ],
            ),
            Padding(padding:EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(widget.price,style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),),

            Padding(padding:EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.lock_clock),
                  SizedBox(width: 5,),
                  Text(widget.duration,style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
