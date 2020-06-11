import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  List<String> title = List();
  List<String> post = List();
  List<String> link = List();

  void _getDataFromWeb() async {
    final response = await http.get('https://arprogramming.blogspot.com/');
    dom.Document document = parser.parse(response.body);
    final link2 = document.getElementsByClassName('entry-title');
    final content = document.getElementsByClassName('entry-content');
    final elements = document.getElementsByClassName('entry-header blog-entry-header');
    setState(() {
      title = elements
          .map((element) =>
      element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      post = content
          .map((element) =>
      element.getElementsByTagName("p")[0].innerHtml)
          .toList();
      link = link2
          .map((element) =>
      element.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    });
}

  @override

  void initState() {
    _getDataFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: post.length==0? Text("No data",
        style: TextStyle(color: Colors.white)) : ListView.builder(
        itemCount: post.length,
          itemBuilder: (context, index){
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () async {
                        dynamic url=link[index];
                        if (await canLaunch(url))
                        launch(url);
                        else
                        {
                        print('error');
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Container(
                            color: Colors.black87,
                            child: Column(
                              children: <Widget>[

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(title[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  post[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  )
              ),
            );
          },
      ),
    );
  }
}
