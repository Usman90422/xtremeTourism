
import 'package:flutter/material.dart';


class carousel extends StatefulWidget {
  const carousel({this.imageList}) ;

  final imageList;

  @override
  _carouselState createState() => _carouselState();
}

class _carouselState extends State<carousel> {

  int _selectedPage=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30),),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 1,
            spreadRadius: 1,
          )]
      ),
      height: 300,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (num){
              setState(() {
                _selectedPage=num;
              });
            },
            children: [
              for(int i=0; i<widget.imageList.length; i++)
                Container(

                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30),),
                    child: Image(image: AssetImage("${widget.imageList[i]}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

            ],

          ),
          Positioned(
            bottom: 0,
            top: 250,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                for(int i=0; i<widget.imageList.length; i++)
                  if(_selectedPage==_selectedPage)
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeOutCubic,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: _selectedPage == i ? 35 : 12,
                      height: 8,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

