import 'package:flutter/material.dart';

class Calender extends StatefulWidget {

  @override
  _CalenderState createState() => _CalenderState();
}

int _counter=0;

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(

        children: [

          Text("$_counter"),
          ElevatedButton(onPressed: (){
            setState(() {
              _counter++;
            });
          }, child: Text("add")),
          ElevatedButton(onPressed: (){setState(() {
            _counter--;
          });}, child: Text("minus")),
        ],
      ),
    );
  }
}
