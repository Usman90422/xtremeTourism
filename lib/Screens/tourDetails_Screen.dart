import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:xtreme_tourism/Screens/sendMessage_screen.dart';
import 'package:xtreme_tourism/data/dummy_images.dart';
import 'package:xtreme_tourism/widgets/IconTextRow.dart';
import 'package:xtreme_tourism/widgets/SingleIconTextRow.dart';
import 'package:xtreme_tourism/widgets/carousel.dart';

class TourDetails extends StatefulWidget {
  TourDetails({this.img});

  String img;

  @override
  _TourDetailsState createState() => _TourDetailsState(img);
}

class _TourDetailsState extends State<TourDetails> {
  _TourDetailsState(this.img);

  bool isVisible = false;
  String img;
  DateRangePickerController _dateRangePickerController =
      DateRangePickerController();


  void onSelecionChanged(DateRangePickerSelectionChangedArgs) {
    print(DateRangePickerSelectionChangedArgs.value);
  }

  int _adultsCounter = 0;
  int _childrenCounter = 0;
  int _infantsCounter = 0;

  Future<void> showBookingDialog(context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Text(
                "Book Your Tour!",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Calender
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xffff6836),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(
                                    20,
                                  ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pick A Date",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
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
                          child: Container(
                            width: 300,
                            height: 230,
                            child: SfDateRangePicker(
                              controller: _dateRangePickerController,
                              view: DateRangePickerView.month,
                              selectionMode: DateRangePickerSelectionMode.range,
                              selectionColor: Color(0xffff6836),
                              rangeSelectionColor:
                                  Color(0xffff6836).withOpacity(0.3),
                              startRangeSelectionColor: Color(0xffff6836),
                              endRangeSelectionColor: Color(0xffff6836),
                              onSelectionChanged: onSelecionChanged,
                              showActionButtons: true,
                              showNavigationArrow: true,
                              enablePastDates: false,
                              confirmText: "Select",
                              cancelText: "Reset",
                              onSubmit: (val) {
                                print(val);
                              },
                              onCancel: () {
                                _dateRangePickerController.selectedRanges =
                                    null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Adults",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Age 18+"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if(_adultsCounter==0){
                                      setState(() {
                                        _adultsCounter=0;
                                      });
                                    }
                                    else
                                    setState(() {
                                      _adultsCounter--;
                                    });
                                  },
                                  hoverColor:
                                      Color(0xffff6836).withOpacity(0.2),
                                  icon: Icon(Icons.remove),
                                splashColor: Color(0xffff6836),
                              ),
                              Text(
                                "$_adultsCounter",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _adultsCounter++;
                                    });
                                  },
                                  splashColor: Color(0xffff6836),
                                  hoverColor:
                                      Color(0xffff6836).withOpacity(0.2),
                                  icon: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Children",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Age 6-17"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if(_childrenCounter==0)
                                    {setState(() {
                                      _childrenCounter=0;
                                    });
                                    }
                                  else
                                  setState(() {
                                    _childrenCounter--;
                                  });
                                },
                                hoverColor:
                                Color(0xffff6836).withOpacity(0.2),
                                icon: Icon(Icons.remove),
                                splashColor: Color(0xffff6836),
                              ),
                              Text(
                                "$_childrenCounter",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _childrenCounter++;
                                  });
                                },
                                splashColor: Color(0xffff6836),
                                hoverColor:
                                Color(0xffff6836).withOpacity(0.2),
                                icon: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Infants",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Age 0-5"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (_infantsCounter==0){
                                    setState(() {
                                      _infantsCounter=0;
                                    });
                                  }
                                  else
                                  setState(() {
                                    _infantsCounter--;
                                  });
                                },
                                hoverColor:
                                Color(0xffff6836).withOpacity(0.2),
                                icon: Icon(Icons.remove),
                                splashColor: Color(0xffff6836),
                              ),
                              Text(
                                "$_infantsCounter",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _infantsCounter++;
                                  });
                                },
                                splashColor: Color(0xffff6836),
                                hoverColor:
                                Color(0xffff6836).withOpacity(0.2),
                                icon: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: ()  {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.SCALE,
                          btnOkColor: Color(0xffFF6836),
                          headerAnimationLoop: false,
                          title: 'Tour Booked',
                          desc: 'Pack your bags!!',
                          autoHide: Duration(milliseconds: 3000) ,
                        )..show();
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
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: Text("Book Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    carousel(
                      imageList: images,
                    ),

                    //Back Button
                    Positioned(
                      top: 20,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Home()));
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
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "Hunza Valley",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Gilgit-Baltistan",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 20),
                              child: Text(
                                "Rs.9000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "per person",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                        child: Divider(
                          color: Colors.black.withOpacity(0.3),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: IconTextRow(
                                icon: Icons.schedule,
                                headingText: "Duration",
                                text: "8 Days & 7 Nights",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: IconTextRow(
                                icon: Icons.moving,
                                headingText: "Tour Type",
                                text: "City Tour",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 20),
                              child: IconTextRow(
                                icon: Icons.group,
                                headingText: "Group Size",
                                text: "18 people",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 20),
                              child: IconTextRow(
                                icon: Icons.translate,
                                headingText: "Language",
                                text: "Urdu/English",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                        child: Divider(
                          color: Colors.black.withOpacity(0.3),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "Overview",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Text(
                            "Hunza is the beautiful mountainous valley situated in the north/west of Hunza River. This valley is known as “Heaven on Earth”, and is surrounded by several peaks including Rakaposhi, Hunza peak, Ultar Sar, Darmiyani peak, Lady finger Peak. Hunza valley is blessed with many beautiful natural sights, which are attractions for tourists from all over the world. This area is also famous for its Ruby mines and Karimabad Bazaar where all handcrafted items including carpets, handcrafted rugs, and traditional embroidered caps, shawls, woven cloths, and gemstones are available.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() => isVisible = !isVisible);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
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
                          visible: isVisible,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleIconTextRow(
                                      icon: Icons.check,
                                      color: Colors.green,
                                      text: "Accommodation",
                                    ),
                                    SingleIconTextRow(
                                      icon: Icons.check,
                                      color: Colors.green,
                                      text: "Transportation",
                                    ),
                                    SingleIconTextRow(
                                      icon: Icons.check,
                                      color: Colors.green,
                                      text: "Guide",
                                    ),
                                    SingleIconTextRow(
                                      icon: Icons.check,
                                      color: Colors.green,
                                      text: "Meal",
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleIconTextRow(
                                      icon: Icons.close,
                                      color: Colors.red,
                                      text: "Insurance",
                                    ),
                                    SingleIconTextRow(
                                      icon: Icons.close,
                                      color: Colors.red,
                                      text: "Additional Services",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.red,
                                          child: Image(
                                              height: 35,
                                              width: 40,
                                              image: AssetImage(
                                                  "images/tourist.png")),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Usman",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Highly Recommended"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Container(
                                  height: 60,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                  ),
                                  child: TextFormField(
                                    cursorColor: Color(0xffff6836),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      hintText: "Leave a comment..",
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return "PLease enter something";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      name = value;
                                    },
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.SUCCES,
                                    animType: AnimType.SCALE,
                                    btnOkColor: Color(0xffFF6836),
                                    headerAnimationLoop: false,
                                    title: 'Done',
                                    desc: 'Thanks for your review',
                                    autoHide: Duration(milliseconds: 3000),
                                  )..show();
                                },
                                child: Container(
                                    height: 45,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Image(
                                      image: AssetImage("images/sendicon.png"),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            right: 25,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await showBookingDialog(context);
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
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: SingleIconTextRow(
                        text: "Book Now",
                        textColor: Colors.white,
                        icon: Icons.directions_car,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SendMessage_Screen()));
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
                      child: SingleIconTextRow(
                        text: "Inquiry",
                        textColor: Colors.white,
                        icon: Icons.support_agent,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
