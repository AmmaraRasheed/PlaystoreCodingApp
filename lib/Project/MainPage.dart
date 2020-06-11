import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mynewflutte_app/Project/Category.dart';
import 'package:mynewflutte_app/Project/DrawerLayout.dart';
import 'package:mynewflutte_app/Project/CodePage.dart';
import 'package:mynewflutte_app/Project/TabLayoutOption.dart';
import 'package:mynewflutte_app/Project/Video.dart';

//void main() => runApp(new MyApp());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Coding App"),
        ),
        drawer: DrawerLaoyout(),
        body: TabLayoutOption(),
    );
  }
}

class MyApp3 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}