import 'package:flutter/material.dart';
import 'package:mynewflutte_app/screen/services/auth.dart';

class Home extends StatelessWidget {
  AuthServices _auth=AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home Page"),
        actions: <Widget>[

          FlatButton.icon(
              onPressed: ()async{
                await _auth.SignOUT();
              },
              icon: Icon(Icons.person),
              label: Text("Logout"))
        ],
      ),


    );
  }
}
