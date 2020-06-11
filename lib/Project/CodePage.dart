import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<String> title = List();
  List<String> post = List();
  List<String> link = List();
  List<String> image = List();
  void _getData() async {
    final response = await http.get('https://arprogramming.blogspot.com/');
    dom.Document document = parser.parse(response.body);
    final elements = document.getElementsByClassName('entry-header blog-entry-header');
    final element2= document.getElementsByClassName('entry-content');
    final linkElemnt=document.getElementsByClassName('entry-title');
    final ForImage=document.getElementsByClassName('entry-image-link');

    setState(()  {
      title = elements
          .map((element) =>
      element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      post = element2
          .map((element) =>
      element.getElementsByTagName("p")[0].innerHtml)
          .toList();
      link = linkElemnt
          .map((element) =>
      element.getElementsByTagName("a")[0].attributes['href'])
          .toList();
      image = ForImage
          .map((element) =>
      element.getElementsByTagName("span")[0].attributes['data-image'])
          .toList();
    });
  }

  Future<void> share(dynamic link,String title) async {
    await FlutterShare.share(
        title: 'Codding Application',
        text: title,
        linkUrl: link,
        chooserTitle: 'Where You Want to Share'
    );
  }


  @override
  // ignore: must_call_super
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: post.length == 0 ? Text("zeroo"): ListView.builder(
          itemCount: post.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: () async{
                    dynamic url=link[index];
                    if (await canLaunch(url))
                      launch(url);
                    else
                    {
                      print('error');
                    }

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Card(
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Image.network(
                                  image[index],
                                  scale: 0.1,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(title[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                post[index],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
//                                  mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
//                                  crossAxisAlignment: CrossAxisAlignment.center ,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: (){
                                      share(link[index],title[index]);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.0),
                                        side: BorderSide(color: Colors.red),
                                    ),
                                    child: Text("Share With Friends",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  FlatButton(
                                    onPressed: () async{
                                      dynamic url=link[index];
                                      if (await canLaunch(url))
                                      launch(url);
                                      else
                                      {
                                      print('error');
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.0),
                                        side: BorderSide(color: Colors.white)
                                    ),
                                    child: Text("Explore Post",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
              ),
              ),
            );
          },
        ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {
//          // Add your onPressed code here!
//        },
//        label: Text('upload',style: TextStyle(color: Colors.black,),),
//        icon: Icon(Icons.file_upload,color: Colors.black,),
//        backgroundColor: Colors.white,
//      ),
    );
  }
}

