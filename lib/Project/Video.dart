import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Project/LinkModel.dart';
import 'package:mynewflutte_app/Project/ViewLinkDetail.dart';

class ViewAlLinks extends StatefulWidget {
  @override
  _ViewAlLinksState createState() => _ViewAlLinksState();
}

class _ViewAlLinksState extends State<ViewAlLinks> {
  @override
  List <String> list = [
    'C',"C++","Python","Android","Flutter",
  ] ;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,pos){
            return GestureDetector(
              onTap: (){
                Navigator
                    .push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewVideoLink(),
                    settings: RouteSettings(
                      arguments: list[pos],
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.black87,
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(
                      list[pos],
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.web,
                            size: 20.0,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //   _onDeleteItemPressed(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.ondemand_video,
                            size: 20.0,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //   _onDeleteItemPressed(index);
                          },
                        ),
                      ],
                    ),
                  ),
//                  child: Row(
//                    children: <Widget>[
//                      Text(list[pos],style: TextStyle(
//                        fontSize: 18.0,
//                        height: 2,
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                      )
//                      ),
//                      SizedBox(width: 10),
//
//                    ],
//                  ),
                ),
              ),
            );
          }
      ),
    );
  }

}
