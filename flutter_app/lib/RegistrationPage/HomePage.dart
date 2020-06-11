import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/RegistrationPage/ModelClass.dart';
class MyHome extends StatefulWidget {
  @override
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome> {

  final fb=FirebaseDatabase.instance.reference().child("Mydata");
  List<Model> list = List();
  @override
  void initState() {
    super.initState();
    fb.once().then((DataSnapshot snap){
      var data=snap.value;
      list.clear();
      data.forEach((key,value) {
        Model model=new Model(
          name: value['name'],
          pass: value['password'],
          email: value['email'],
          key: key,
        );
        list.add(model);
      });
      setState(() {
      });
    });
  }

  Future<String> createDialog(BuildContext context){
    TextEditingController ed=TextEditingController();
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Update Data"),
        content: TextField(
          controller: ed,
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: (){
              Navigator.of(context).pop(ed.text.toString());
            },
            child: Text("submit"),
          )
        ],
      );

    });
  }
  DeleteData(BuildContext context,String key){
    Widget okButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        setState(() {
          fb.child(key).remove();
          Navigator.of(context).pop();
        });
      },
    );
    Widget no = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Delete Data"),
      content: Text("Do you want to delete?"),
      actions: [
        okButton,
        no,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    Widget UI(String name,String email,String pass, String key){
      return new GestureDetector(
        onLongPress: (){
          createDialog(context).then((value){
            if(value!=null){
              Map<String, Object> createDoc = new HashMap();
              createDoc['name'] = value;
              fb.child(key).update(createDoc);
            }
          });
        },
        onTap: (){
          DeleteData(context,key);
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 17,
                ),
              ),
              Text(
                pass,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child: list.length==0?Text("Data is null"): new ListView.builder(
          itemCount: list.length,
            itemBuilder: (_,index){
            return UI(list[index].name, list[index].email, list[index].pass, list[index].key);
            }
        ),
      ),
    );
  }
}
