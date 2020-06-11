import 'package:flutter/material.dart';

class DrawerLayoutDesign extends StatefulWidget {
  @override
  _DrawerLayoutDesignState createState() => _DrawerLayoutDesignState();
}

class _DrawerLayoutDesignState extends State<DrawerLayoutDesign> {
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
                  Text("",
                  style: TextStyle(
                    color: Colors.white,)
                    ,
                  ),
                ],
              ),

              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage('assets/bg.jpg'),
                ),
              ),
            ),

            ListTile(
              title: Text("First",style: TextStyle(
                color: Colors.white,
              ),),
              leading: Icon(Icons.access_alarm,color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Second",style: TextStyle(
                color: Colors.white,
              ),),
              leading: Icon(Icons.category,color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Setting",style: TextStyle(
                color: Colors.white,
              ),),
              leading: Icon(Icons.settings,color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
