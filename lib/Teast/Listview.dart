import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Teast/ModelClass.dart';


class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  List<Model> list = List();
  Model itemShop;
  DatabaseReference itemRefShop;
  final fb = FirebaseDatabase.instance.reference().child("Student");

  @override
  void initState() {
    super.initState();
    fb.once().then((DataSnapshot snap){
      var data=snap.value;
      list.clear();
      data.forEach((key,value) {
        print(value["email"]);
        Model model=new Model(
          name: value['name'],
          pass: value['password'],
          email: value['email'],
          key: key,
        );
        print(key);
        print("ss");
        list.add(model);
      });
      setState(() {
      });
    });
  }


  Future<String> createDiaog(BuildContext context){
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

  showAlertDialog(BuildContext context,String key) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
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

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Data"),
      content: Text("Do you want to delete?"),
      actions: [
        okButton,
        no,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget UI(String pass,String email,String name,String key){
      return new GestureDetector(
        onLongPress: (){
          showAlertDialog(context, key);
        },
        onTap: (){
          createDiaog(context).then((value){
            if(value!=null){
              Map<String, Object> createDoc = new HashMap();
              createDoc['name'] = value;
              fb.child(key).update(createDoc);
              setState(() {
              });
            }
          });
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(email,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),),
              Text(pass,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("my app"),
        backgroundColor: Colors.red,
      ),
      body: new Container(

        child: list.length==0? Text("list null"): new ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            return UI(list[index].pass,list[index].email,list[index].name,list[index].key);
          },
        ),
      ),
    );



  }
}
