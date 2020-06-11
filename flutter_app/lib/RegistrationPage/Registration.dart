import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DesignUI/Home.dart';
import 'package:flutter_app/RegistrationPage/HomePage.dart';
class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  String email,pass,name;
  final fb = FirebaseDatabase.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final ref=fb.reference().child("Mydata");
    return Scaffold(
      appBar: AppBar(
        title: new Text('Registration'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('asset/b.jpg',
                    height: 100,
                    width: 100,)
                ],
              ),
              TextFormField(
                  onChanged: (val){
                    name=val;
                  },
                  decoration: new InputDecoration(
                    hintText: 'User Name',
                    labelText: 'Enter your name',
                    labelStyle: TextStyle(
                      color: Colors.purple,
                    ),
                    icon: new Icon(Icons.person),
                  )
              ),
              TextFormField(
                  onChanged: (val){
                    email=val;
                  },
                  decoration: new InputDecoration(
                    hintText: 'Email',
                    labelText: 'Enter your Email',
                    labelStyle: TextStyle(
                      color: Colors.purple,
                    ),
                    icon: new Icon(Icons.email),
                  )
              ),
              TextFormField(
                  onChanged: (val){
                    pass=val;
                  },
                  decoration: new InputDecoration(
                    hintText: 'User Password',
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(
                      color: Colors.purple,
                    ),
                    icon: new Icon(Icons.lock),
                  )
              ),
              Container(
                height:50.0,
                width: 210.0,
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                child: RaisedButton(
                  onPressed: () async {
                    print("Easycoding with ammara");
                    AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: pass);
                    if(result!=null){
                      FirebaseUser user = await FirebaseAuth.instance.currentUser();
                      ref.child(user.uid).set({
                        "name": name,
                        "password": pass,
                        "email":email,
                      }
                      );

                    }
                  },
                  child: new Text(
                    'Register',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.purple,
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
          );
        },
      ),
    );
  }
}
