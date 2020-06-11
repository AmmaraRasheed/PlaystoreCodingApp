import 'package:flutter/material.dart';

class DrawerLaoyout extends StatefulWidget {
  @override
  _DrawerLaoyoutState createState() => _DrawerLaoyoutState();
}

class _DrawerLaoyoutState extends State<DrawerLaoyout> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("ss"),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('asset/bg.jpg')),
              ),
            ),
            ListTile(
              title: Text("First",
                  style: TextStyle(
                    color: Colors.white,
                  )
              ),
              leading: Icon(Icons.access_alarm,color: Colors.white),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Second",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(Icons.settings,color: Colors.white),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Second",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(Icons.settings,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
