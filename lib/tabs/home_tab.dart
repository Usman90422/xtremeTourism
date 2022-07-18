import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtreme_tourism/Screens/aboutUs_screen.dart';
import 'package:xtreme_tourism/Screens/faq_screen.dart';
import 'package:xtreme_tourism/Screens/home_screen.dart';
import 'package:xtreme_tourism/Screens/landing_screen.dart';
import 'package:xtreme_tourism/Screens/login_screen.dart';
import 'package:xtreme_tourism/Screens/search_screen.dart';
import 'package:xtreme_tourism/Screens/sendMessage_screen.dart';
import 'package:xtreme_tourism/Screens/tourDetails_Screen.dart';
import 'package:xtreme_tourism/tabs/profile_tab.dart';
import 'package:xtreme_tourism/widgets/categories_card.dart';
import 'package:xtreme_tourism/widgets/drawer_Items.dart';
import 'package:xtreme_tourism/widgets/featured_card.dart';
import 'package:xtreme_tourism/widgets/unfeatured_card.dart';

class home_tab extends StatefulWidget {
  @override
  _home_tabState createState() => _home_tabState();
}

class _home_tabState extends State<home_tab> {
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  final padding = EdgeInsets.all(20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: Scaffoldkey,
        drawer: Drawer(
          child: Material(
            color:  Color(0xffff6836),
            child: ListView(
              padding: padding,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("images/tourist.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Guest",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                listViewItems(
                  onClick: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SendMessage_Screen()));
                  },
                  icon: Icons.inbox,
                  title: "Send Message",
                ),
                SizedBox(
                  height: 10,
                ),
                listViewItems(
                  onClick: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Faq_screen()));
                  },
                  icon: Icons.question_answer,
                  title: "FAQ's",
                ),
                SizedBox(
                  height: 10,
                ),
                listViewItems(
                  onClick: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>About_Us() ));
                  },
                  icon: Icons.support_agent,
                  title: "About Us",
                ),
                SizedBox(
                  height: 10,
                ),
                listViewItems(
                  onClick: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login_screen()));
                  },
                  icon: Icons.login,
                  title: "Login",
                ),
                Divider(
                  color: Colors.white,
                ),
                listViewItems(
                  onClick: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Landing_screen()));
                  },
                  icon: Icons.door_back,
                  title: "Home",
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
              physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.red,
                  ),
                  margin: EdgeInsets.only(top: 20, right: 10),
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffoldkey.currentState.openDrawer();
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red,
                          child: Image(
                              height: 40,
                              width: 40,
                              image: AssetImage("images/tourist.png")),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hi, Guest!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Where do you want to go?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search_Screen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search for places.."),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.search,
                              color:  Color(0xffff6836),
                            )),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 10),

                //Categories list
                Container(
                  height: 120,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        categories_card(
                          image: Image(
                            image: AssetImage("images/city.png"),
                          ),
                          title: "City Tour",
                        ),
                        SizedBox(width: 10),
                        categories_card(
                          image: Image(
                            image: AssetImage("images/culture.png"),
                          ),
                          title: "Cultural Tour",
                        ),
                        SizedBox(width: 10),
                        categories_card(
                          image: Image(
                            image: AssetImage("images/historical.png"),
                          ),
                          title: "Historical & \n Heritage",
                        ),
                        SizedBox(width: 10),
                        categories_card(
                          image: Image(
                            image: AssetImage("images/days.png"),
                          ),
                          title: "Multi-day Tour",
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {},
                        child: Text(
                          "Explore",
                          style: TextStyle(
                              color:  Color(0xffff6836),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return Row(children: [
                      featured_card(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TourDetails(img: "images/dummypic1.jpg")));
                      },
                        image: AssetImage("images/dummypic1.jpg"),
                        price: "Rs.7000" ,
                        title: "Hunza Valley",
                        duration: "8 days & 7 nights",
                      ),
                      featured_card(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TourDetails(img: "images/dummypic2.jpg")));

                      },
                        image: AssetImage("images/dummypic2.jpg"),
                        price: "Rs.9000" ,
                        title: "Skardu",
                        duration: "6 days & 5 nights",
                      ),
                      featured_card(onTap: (){},
                        image: AssetImage("images/dummypic3.jpg"),
                        price: "Rs.5000" ,
                        title: "Gilgit",
                        duration: "3 days & 2 nights",
                      ),
                      SizedBox(width: 10,),
                    ],);
                  }),
            ),),



                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Other Tours",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {},
                        child: Text(
                          "Explore",
                          style: TextStyle(
                              color:  Color(0xffff6836),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    height: 270,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context,index){
                          return Row(children: [
                            unfeatured_card(onTap: (){},
                              image: AssetImage("images/dummypic4.jpg"),
                              price: "Rs.5000" ,
                              title: "Gabbin Jabba",
                              duration: "5 days & 4 nights",
                            ),
                            unfeatured_card(onTap: (){},
                              image: AssetImage("images/dummypic5.jpg"),
                              price: "Rs.8000" ,
                              title: "Neelum Valley, Kashmir",
                              duration: "6 days & 5 nights",
                            ),
                            unfeatured_card(onTap: (){},
                              image: AssetImage("images/dummypic6.jpg"),
                              price: "Rs.6000" ,
                              title: "Kalaam",
                              duration: "4 days & 3 nights",
                            ),
                            SizedBox(width: 10,),
                          ],);
                        }),
                  ),),

                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

