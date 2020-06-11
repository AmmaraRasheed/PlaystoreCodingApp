import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Decoration/DecorationFilw.dart';
class Design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                "Registration Page",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.purple,
                  backgroundColor: Colors.black12,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),

              ),
              SizedBox(height: 15),
              Text(
                "Enter Email",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple
                ),
              ),
              SizedBox(height: 1),
              TextField(
                decoration: textDecoration,
              ),
              SizedBox(height: 15),
              Text(
                "Enter Password",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple
                ),

              ),
              SizedBox(height: 1),
              TextField(
                decoration: textDecoration,
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(60,0,0,0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){},
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text("Login"),
                    ),
                    SizedBox(width: 20),
                    RaisedButton(
                      onPressed: (){},
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text("Registration"),
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
