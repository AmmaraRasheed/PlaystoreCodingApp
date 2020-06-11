import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Decoration/TextDesign.dart';


class TextDesign extends StatefulWidget {
  @override
  _TextDesignState createState() => _TextDesignState();

}

class _TextDesignState extends State<TextDesign> {

  Widget first=Column(
    children: <Widget>[
      Container(
          child: Row(
            children: [Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("jjj"),
                  Text("sss"),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            Text('41'),
            ],
          )
      ),
    ],
  );


  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
//        _buildButtonColumn(Colors.red, Icons.call, 'CALL'),
//        _buildButtonColumn(Colors.red, Icons.near_me, 'ROUTE'),
//        _buildButtonColumn(Colors.red, Icons.share, 'SHARE'),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Design"),
      ),
      body: Column(
        children: <Widget>[
          first,

        ],
      ),
    );
  }
}
