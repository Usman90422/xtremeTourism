import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SendMessage_Screen extends StatefulWidget {



  @override
  _SendMessage_ScreenState createState() => _SendMessage_ScreenState();
}


String name;
String email;
String message;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex =  RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return null;
}

class _SendMessage_ScreenState extends State<SendMessage_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image(image: AssetImage("images/sendMessage.jpg"),),
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
                  Positioned(
                    top: 50,
                    left: 50,
                    right: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WE WOULD LOVE TO HEAR FROM YOU!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      Text("Send us a message",style: TextStyle(color: Colors.white,),),
                    ],
                  ),),
                ],
              ),
              SizedBox(
                  height: 20
              ),

              Form(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: TextFormField(
                        cursorColor:  Color(0xffff6836),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: "Name",
                        ),
                        validator: (value){
                          if (value==null){
                            return "Please provide a name";
                          }
                          return null;
                        },
                        onSaved: (value)
                        {
                          name = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20
                    ),

                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: TextFormField(
                        cursorColor:  Color(0xffff6836),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                        validator: validateEmail,
                        onSaved: (value)
                        {
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20                  ),

                    Container(
                     height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      padding: EdgeInsets.only(left: 7,top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 30,
                        cursorColor:  Color(0xffff6836),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: "Message",
                        ),
                        validator: (value){
                          if(value==null)
                            {
                              return "Please type a message";
                            }
                          return null;
                        },
                        onSaved: (value)
                        {
                         message = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10
                    ),

                    GestureDetector(
                      onTap: (){

                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.SCALE,
                            btnOkColor: Color(0xffFF6836),
                            headerAnimationLoop: false,
                            title: 'Success',
                            desc: 'Message Sent',
                            autoHide: Duration(milliseconds: 3000) ,
                          )..show();


                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                          child: Image(image: AssetImage("images/sendicon.png"),)),
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
