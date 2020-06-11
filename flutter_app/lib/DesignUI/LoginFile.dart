import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Decoration/textDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DesignUI/Home.dart';
import 'package:flutter_app/DesignUI/Registration.dart';
class LOginPage extends StatefulWidget {
  @override
  _LOginPage createState() => _LOginPage();
}

class _LOginPage extends State<LOginPage> {
  String email = "";
  String pass="";
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Login Page"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Login Page",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.purple,
                      backgroundColor: Colors.black12,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
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
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
                decoration: Textdecoration,
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
                onChanged: (val){
                  setState(() {
                    pass=val;
                  });
                },
                decoration: Textdecoration,
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(60,0,0,0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () async {
                        AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: pass);
                        if(result!=null){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }
                        else{
                          print("Error");
                        }
                      },
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text("Login"),
                    ),
                    SizedBox(width: 30),
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrationPage()),
                        );
                      },
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
