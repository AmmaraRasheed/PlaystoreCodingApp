import 'package:codding_app/coddingApp/LinksOfYoutubeVideo.dart';
import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

List <String> list = [
  'C',"C++","Python","Android","Flutter",
] ;

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder:  (context,pos){
            return Card(
              color: Colors.black87,
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                  title: Text(
                    list[pos],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.ondemand_video,
                          size: 20.0,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          Navigator
                              .push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => YoutubeVideoLinks(),
                              settings: RouteSettings(
                                arguments: list[pos],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
