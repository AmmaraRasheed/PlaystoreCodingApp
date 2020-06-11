import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Listview.dart';
class RegistrationScr extends StatefulWidget {
  @override
  _RegistrationScrState createState() => _RegistrationScrState();
}
class _RegistrationScrState extends State<RegistrationScr> {

  String email,pass,name;
  final fb = FirebaseDatabase.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child("Student");
    return Scaffold(
      appBar: AppBar(
        title: new Text('Registration'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
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
                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'email@example.com',
                        labelText: 'Email Address',
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
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        labelText: 'Enter your password',
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        ),
                        icon: new Icon(Icons.lock)
                    )
                ),
                Container(
                  height:50.0,
                  width: 210.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                  child: RaisedButton(
                    onPressed: () async {
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
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListItem()),
          );
        },
      ),
    );
  }
}
