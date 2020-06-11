import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Decoration/DecorationFilw.dart';
import 'package:mynewflutte_app/Decoration/loading.dart';
import 'package:mynewflutte_app/screen/services/auth.dart';
class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  AuthServices _auth=AuthServices();
  String email,pass;
  final fb = FirebaseDatabase.instance;

  bool loading=false;
  String error="";
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child("Student");
    return loading ? Loading(): Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Sign up Now"),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: (){
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text("Login"))
          ],
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  decoration:textDecoration.copyWith(hintText: "Email"),
                  validator: (val) => val.isEmpty? "Enter value" :null,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: textDecoration.copyWith(hintText: "Password"),
                  validator: (val) => val.length<6? "Enter value" :null,
                  onChanged: (val){
                    setState(() {
                      pass=val;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(height: 15),
                RaisedButton(
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      setState(() {
                        loading=true;
                      });
                      dynamic result=await _auth.registerWithEmailPass(email,pass);
                      if(result==null){
                        setState(() {
                          loading=false;
                          error="error";
                        });
                      }
                      else{
                        ref.child("home").child(result).set({
                          "email":email,
                          "password":pass,
                        });
                      }
                    }else{
                      print("wrong");
                    }
                  },
                  color: Colors.brown,
                  textColor: Colors.white,
                  child: Text("Registration"),

                ),
                SizedBox(height: 10.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.lightBlue,fontSize: 14),
                )
              ],
            ),
          ),
        )
    );
  }
}
