import 'dart:core';
import "package:flutter/material.dart";
import 'package:xtreme_tourism/constants/constants.dart';

class Search_Screen extends StatefulWidget {
  @override
  _Search_ScreenState createState() => _Search_ScreenState();
}

//for search bar
TextEditingController searchBarController= TextEditingController();

//dropdown variable
String destination='';

//RangedSlider Variables
RangeValues _rangeValues=RangeValues(0, 90000);
RangeLabels _rangeLabels=RangeLabels("0", "90000");

//checkbox variables
var city="";
var cultural="";
var historical="";
var multiday="";

bool selectedValue1=false;
bool selectedValue2=false;
bool selectedValue3=false;
bool selectedValue4=false;


class _Search_ScreenState extends State<Search_Screen> {


  Future<void> showSearchFilter(context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Text(
                "Filter",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select Destination",style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[700].withOpacity(0.1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          disabledHint: Text("Select Destination",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          icon:  Icon(Icons.place, color: Color(0xffff6836),),
                          dropdownColor: Color(0xffff6836),
                          hint: destination == null
                              ? Text('Hunza Valley',style: TextStyle(color:Colors.black),)
                              : Text(
                            destination,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.white ),
                          items: ['Hunza Valley','Kashmir','Swaat'].map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                                  () {
                                destination = val;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Select Price Range",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 2),
                    SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: kDefaultColor,
                          thumbColor:  kDefaultColor,
                          valueIndicatorColor: kDefaultColor,
                          showValueIndicator: ShowValueIndicator.always),
                      child: RangeSlider(
                        divisions: 5,
                        activeColor: kDefaultColor,
                        inactiveColor: kDefaultColor.withOpacity(0.1),
                        values: _rangeValues,
                        min: 0,
                        max: 90000,
                        labels: _rangeLabels,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _rangeValues = values;
                            _rangeLabels=RangeLabels(values.start.toString(),values.end.toString() );
                          });
                        },),
                    ),
                    Text("Select Category",style: TextStyle(fontWeight: FontWeight.bold)),

                    CheckboxListTile(
                      title: Text("City"),
                      value: selectedValue1,
                      checkColor: Colors.white,
                   activeColor: kDefaultColor,
                   onChanged: (value){
                     setState(() {
                      selectedValue1=!selectedValue1;
                       city="city";
                     });
                   },
                    ),
                    CheckboxListTile(
                      title: Text("Cultural"),
                      value: selectedValue2,
                      checkColor: Colors.white,
                      activeColor: kDefaultColor,
                      onChanged: (value){
                        setState(() {
                          selectedValue2=!selectedValue2;
                          cultural="cultural";
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("Historical"),
                      value: selectedValue3,
                      checkColor: Colors.white,
                      activeColor: kDefaultColor,
                      onChanged: (value){
                        setState(() {
                          selectedValue3=!selectedValue3;
                          historical="historical";
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("Multi-Day"),
                      value: selectedValue4,
                      checkColor: Colors.white,
                      activeColor: kDefaultColor,
                      onChanged: (value){
                        setState(() {
                          selectedValue4=!selectedValue4;
                          multiday="multiday";
                        });
                      },
                    ),
                    SizedBox(height: 10,),
                    Divider(height: 2,),
                    SizedBox(height: 10,),

                    Center(
                      child: GestureDetector(
                        onTap: ()  {
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffff6836),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 1,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Center(
                            child: Text("Apply Filter",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],),
              ],
            );
          });
        });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                            Icons.arrow_back_rounded,color: Colors.black,   ),
                      ),
                    ),
                    Text("Search",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.55 ,
                            child: TextField(
                              controller: searchBarController,
                              decoration: InputDecoration(
                                focusColor: kDefaultColor,
                                hoverColor: kDefaultColor,
                                fillColor: kDefaultColor,
                                border: InputBorder.none,
                                hintText: "Search..",
                                suffixIcon: Icon(
                                  Icons.search,
                                  color:  Color(0xffff6836),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
                        await showSearchFilter(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.tune,
                            size: 40,
                            color:  Color(0xffff6836),
                          )),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );

  }

}

