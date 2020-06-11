import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mynewflutte_app/Teast/loginesign.dart';
class MyLogin extends StatefulWidget {
  @override
  _MyLogin createState() => _MyLogin();
}

class _MyLogin extends State<MyLogin> {
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
                    AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: pass);
                     if(result!=null){
//                      FirebaseUser user = await FirebaseAuth.instance.currentUser();
//                      print(user.uid);
//                      Fluttertoast.showToast(
//                          msg: user.uid,
//                          toastLength: Toast.LENGTH_SHORT,
//                          gravity: ToastGravity.CENTER,
//                          timeInSecForIos: 1,
//                          backgroundColor: Colors.red,
//                          textColor: Colors.white
//                      );
                     }else{

                     }
                  },
                  child: Text("Login"),
                ),
                Text(retrievedName),
              ],
            )));
  }


//  void showToast() {
//    Fluttertoast.showToast(
//        msg: 'Some text',
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.red,
//        textColor: Colors.white
//    );

}
