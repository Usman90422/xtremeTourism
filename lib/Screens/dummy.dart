import 'package:flutter/material.dart';
import 'package:xtreme_tourism/widgets/SingleIconTextRow.dart';

class dummy extends StatefulWidget {

  @override
  _dummyState createState() => _dummyState();
}

bool isVisible=false;

class _dummyState extends State<dummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
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
                  Flexible(
                    child: Text(
                      "Included/Excluded",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleIconTextRow(icon: Icons.check,color: Colors.green,text: "Accommodation",),
                      SingleIconTextRow(icon: Icons.check,color: Colors.green,text: "Transportation",),
                      SingleIconTextRow(icon: Icons.check,color: Colors.green,text: "Guide",),
                      SingleIconTextRow(icon: Icons.check,color: Colors.green,text: "Meal",),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleIconTextRow(icon: Icons.close,color: Colors.red,text: "Insurance",),
                      SingleIconTextRow(icon: Icons.close,color: Colors.red,text: "Additional Services",),
                    ],
                  ),
                ],
              ),
            ),),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
