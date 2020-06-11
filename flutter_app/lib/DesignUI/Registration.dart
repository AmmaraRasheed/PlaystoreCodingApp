import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Decoration/textDecoration.dart';
import 'package:flutter_app/DesignUI/LoginFile.dart';
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  String email = "";
  String pass="";
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Registration Page"),
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
                    "Registration Page",
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
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LOginPage()),
                        );
                      },
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text("Login"),
                    ),
                    SizedBox(width: 30),
                    RaisedButton(
                      onPressed: () async {
                        AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: pass);
                        if(result!=null){
//                          retrievedName="success";
                        }
                        else{
                          print("error");
                        }
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
