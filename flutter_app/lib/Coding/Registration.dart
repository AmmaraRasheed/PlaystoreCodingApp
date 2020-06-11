import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final fb = FirebaseDatabase.instance;
  var retrievedName="";
  String name = "";

  @override
  Widget build(BuildContext context) {
    final ref=fb.reference().child("Student");
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(
                    blurRadius: 10,
                    color: Colors.blue,
                  )]
                ),
              ),
            ),
            Flexible(child: TextField(
              onChanged: (val){
                setState(() {
                  name=val;
                });
              },
            )),
            RaisedButton(
              onPressed: (){
                ref.child("name").set(name);
              },
              child: Text("Registration"),
            ),
            RaisedButton(
              onPressed: (){},
              child: Text("Retrieve data"),
            ),
            Text("EasyCoding"),
          ],
        ),
      ),
    );
  }
}
