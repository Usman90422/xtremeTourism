import 'package:flutter/material.dart';

class profile_tab extends StatefulWidget {

  @override
  _profile_tabState createState() => _profile_tabState();
}

class _profile_tabState extends State<profile_tab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              overflow: Overflow.visible,
              children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffff6836),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                ),
                height: 200,
              ),
              Positioned(
                left: 50,
                right: 50,
                top: 110,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.yellowAccent,
                  backgroundImage: AssetImage("images/profile pic.jpg"),
                ),
                ),
              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],),
            SizedBox(height: 70),
            Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height*0.5,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("User ID",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("Email Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("Tours Booked",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ],),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("123927489127890"),
                          Text("Guest"),
                          Text("None"),
                          Text("0"),
                        ],),

                    ],
                  ),
            ),
          ],),
        ),
      ),
    );
  }
}
