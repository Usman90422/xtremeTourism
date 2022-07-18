import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtreme_tourism/Screens/home_screen.dart';
import 'package:xtreme_tourism/data/aboutUs_desc.dart';
import 'package:xtreme_tourism/widgets/XtremeProjects_card.dart';
import 'package:xtreme_tourism/widgets/aboutUs_card.dart';

class About_Us extends StatefulWidget {

  @override
  _About_UsState createState() => _About_UsState();
}

 bool isVisible=true;

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(image:AssetImage("images/aboutus.jpg"),),
                Positioned(
                  left: 5,
                  top: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "About Us",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            AboutUsCard(title: "Xtremes Tourism",
              desc: "Explore the mesmerizing beauty of Pakistan with Xtreme Tourism,"
                  " the leading tourism website in Peshawar, KPK. Xtreme tourism is "
                  "founded with an aim to provide the best quality travel services to "
                  "tourists and promote the positive image of Pakistan in the world.Our focus "
                "is to empower the people to get the opportunity of traveling and take part in "
                  "the development of the largest industry in Pakistan.",),
            SizedBox(height: 20),
            AboutUsCard(title: "Our Mission",
            desc: "Xtreme Tourism’s mission is to strengthen its position in the tourism"
                " industry by providing unique travel experience in a sustainable, honest and transparent way.",),
            SizedBox(height: 20),
            AboutUsCard(title: "Vision",
            desc: "To be the leading tourism company offering quality, creative,"
                " innovative and socially responsible travel services in Pakistan.",),
            SizedBox(height: 20),
            AboutUsCard(title: "Core Values",
            desc: "• Professionalism \n"
                "• Trustworthiness\n"
                "• Honesty\n"
                "• Commitment\n"
                "• Corporate Social Responsibility\n",),
            SizedBox(height: 20),

             Center(
               child: Text(
                  "Xtremes Projects",
                  style: TextStyle(
                      color:  Color(0xffff6836),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
             ),
            SizedBox(height: 20),

             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                 SizedBox(width: 10),

                   XtremeProjects_Card(title: "Xtreme Software Services",
                     desc: kXtremeSoftDesc ,
                   image: AssetImage("images/XtremeSoft.png"),),

                   XtremeProjects_Card(title: "Xtremes Property",
                   desc: kXtremesPropertyDesc,
                     image: AssetImage("images/XtremeProperty.png"),),

                   XtremeProjects_Card(title: "Xtremes Tourism",
                     desc: kXtremesTourismDesc,
                     image: AssetImage("images/XtremeTourism.png"),),

                   SizedBox(width: 20,),

               ],),
             ),

            SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }
}
