
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mynewflutte_app/Project/ProjectModel.dart';
import 'dart:io' show Platform;

class FullCode extends StatefulWidget {
  @override
  _FullCodeState createState() => _FullCodeState();
}

class _FullCodeState extends State<FullCode> {

  @override
  Widget build(BuildContext context) {
    final ModelProject model= ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Description"),
      ),
      body: LayoutBuilder(
        builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: new ConstrainedBox(
              constraints:
              BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          model.topic,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
//                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment:  Alignment.centerLeft,
                        child: Text(
                          "Watch Detail Video",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          _launchURL(model.link);
                        },
                        child: Text(
                          "click me",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment:  Alignment.centerLeft,
                        child: Text(
                          "Full Code",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment:  Alignment.centerLeft,
                        child: Text(
                          model.code,
                          style: TextStyle(
                            color: Colors.white,

                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment:  Alignment.centerLeft,
                        child: Text(
                          "Output",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    Container(
                      child: Image.network(
                        model.image,
                      ),
                    ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
//  void _showErrorSnackBar() {
//    Scaffold.of(context).showSnackBar(
//      SnackBar(
//        content: Text('Oops... the URL couldn\'t be opened!'),
//      ),
//    );
//  }
}

_launchURL(dynamic link) async {
  if (Platform.isIOS) {
    if (await canLaunch(
        link)) {
      await launch(link,
          forceSafariVC: false);
    } else {
      if (await canLaunch(
          link)) {
        await launch(
            link);
      } else {
        throw 'Could not launch your link';
      }
    }
  } else {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch link';
    }
  }
}
