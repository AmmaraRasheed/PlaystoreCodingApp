
import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Decoration/DecorationFilw.dart';
import 'package:mynewflutte_app/Decoration/loading.dart';
import 'package:mynewflutte_app/screen/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email="";
  String pass="";
  AuthServices _auth=AuthServices();
  String error="";
  bool loading =false;

  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():  Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Sign In Now"),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: (){
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text("Register"))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textDecoration.copyWith(hintText: "Email"),
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
                      dynamic result=await _auth.SignInEmailPass(email, pass);
                      if(result==null){
                        setState(() {
                          loading=false;
                          error='Could not sign in';
                        });
                      }else{

                      }
                    }else{
                      print("wrong");
                    }
                  },
                  color: Colors.brown,
                  textColor: Colors.white,
                  child: Text("Login"),

                ),
                SizedBox(height: 10.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.lightBlue,fontSize: 14),
                ),

              ],
            ),
          ),
        )
    );
  }
}
