import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Project/Category.dart';
import 'package:mynewflutte_app/Project/CodePage.dart';
import 'package:mynewflutte_app/Project/Video.dart';

class TabLayoutOption extends StatefulWidget {
  @override
  _TabLayoutOptionState createState() => _TabLayoutOptionState();
}

class _TabLayoutOptionState extends State<TabLayoutOption> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[],
          title: new TabBar(
            tabs: [
              new Tab(
                child: Text("Post"),
              ),
              new Tab(
                child: Text("CATEGORIE"),
              ),
              new Tab(
                  child: Text("Video")),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: new TabBarView(
          children: [
            new Container(
              child: MyHomepage(),
            ),
            new Container(
              child: Category(),
            ),
            new Container(
              child: ViewAlLinks(),
            ),
          ],
        ),
      ),
    );
  }
}
