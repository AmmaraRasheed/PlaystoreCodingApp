import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Teast/Login.dart';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
//  final fb = FirebaseDatabase.instance;
  var retrievedName="";
  String email = "";
  String pass="";
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
//    final ref = fb.reference().child("Student");
    return Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                  'Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.blue,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(child: TextField(
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                )),
                Flexible(child: TextField(
                  onChanged: (val){
                    setState(() {
                      pass=val;
                    });
                  },
                )),
                  ],
                ),

                RaisedButton(
                  onPressed: () async {
                    AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: pass);

                    if(result!=null){
                      retrievedName="success";
                    }
                  },
                  child: Text("Register"),
                ),
                RaisedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyLogin()),
                    );
                  },
                  child: Text("Login"),
                ),
                Text(retrievedName),
              ],
            )));
  }

}
