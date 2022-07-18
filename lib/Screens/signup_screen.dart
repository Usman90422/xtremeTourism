import 'package:flutter/material.dart';
import 'login_screen.dart';
class Signup_Screen extends StatefulWidget {

  @override
  _Signup_ScreenState createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  String email;
  String password;
  String role="";
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



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  width: MediaQuery.of(context).size.width * 2,
                  height: 150,
                  child: Image(
                    image: AssetImage("images/XtremeTourism.png"),
                  ),
                ),
                Text(
                  "Create a new account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
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
                  height: 20,
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
                    obscureText: true,
                    cursorColor:  Color(0xffff6836),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                    validator: (value) {
                      if (value.length<5)
                      {
                        return "Please enter a valid password";
                      }
                      return null;
                    },

                    onSaved: (value) {
                      password = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                    Radio(value: 'User' , groupValue: role,activeColor:  Color(0xffff6836), onChanged: (value){
                      role=value;
                      setState(() {

                      });
                    },
                    ),
                    Text("As User",style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(width: 20,),

                    Radio(value: 'Admin' , groupValue: role, activeColor:  Color(0xffff6836),onChanged: (value){
                      role=value;

                      setState(() {

                      });
                    },),
                    Text("As Admin", style: TextStyle(fontWeight: FontWeight.bold),),


                  ],),
                ),

                SizedBox(height: 20,),

                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1 / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:  Color(0xffff6836),
                    ),
                    onPressed: () {
                      if (!_formkey.currentState.validate()) {
                        return;
                      }
                      _formkey.currentState.save();
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_screen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color:  Color(0xffff6836)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
