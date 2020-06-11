import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mynewflutte_app/Teast/ModelClass.dart';

class myList extends StatefulWidget {
  @override
  _myListState createState() => _myListState();
}


class _myListState extends State<myList> {
  List<String> notes = [
    "Ammara",
    "easycoding",
    "Sara",
    "Maham",
    "khan",
    "munnef",
    "hi my name is easycoding with ammara",
  ];
  @override
  Widget build(BuildContext context) {
//    final ref = fb.reference().child("Student");
//    Map<dynamic, dynamic> values;
//    Model data;
//    int a=0;
//    List<Model> list=new List();
//    Future naa() async{
//      await ref.once().then(( DataSnapshot snapshot){
//        values = snapshot.value;
//        values.forEach((key,value) {
//          print(value["email"]);
//          Model m=new Model(name: value["name"],pass: value["email"],email: value["password"]);
//          list.add(m);
//
//        });
//      });
//    }
    return Scaffold(
      appBar: AppBar(
      title: Text("Listview"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, pos) {
          return new GestureDetector(
            onTap: (){
            },
            child: Card(
              margin: EdgeInsets.all(8),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(notes[pos], style: TextStyle(
                  fontSize: 18.0,
                  height: 2,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          );
        },
      ),
    );
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("hello"),
//      ),
//      body: ListView.builder(itemBuilder: null)
//    );
  }
}

//class DetailScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final String todo = ModalRoute.of(context).settings.arguments;
//
//    // Use the Todo to create the UI.
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("My Listview"),
//      ),
//      body: Padding(
//        padding: EdgeInsets.all(16.0),
//        child: Text(todo),
//      ),
//    );
//  }
//}

