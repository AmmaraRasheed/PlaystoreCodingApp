import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Project/LinkModel.dart';
import 'dart:io' show Platform;
import 'package:mynewflutte_app/Project/ProjectModel.dart';
import 'package:url_launcher/url_launcher.dart';
class ViewVideoLink extends StatefulWidget {



  @override
  _ViewVideoLinkState createState() => _ViewVideoLinkState();
}
class _ViewVideoLinkState extends State<ViewVideoLink> {
  final fb = FirebaseDatabase.instance.reference().child("Youtube Video Links");
  List<LinkMOdel> listdata=new List();
  List<LinkMOdel> send=new List();
  @override
  void initState() {
    super.initState();
    fb.once().then((DataSnapshot snap){
      var data=snap.value;
      listdata.clear();
      data.forEach((key,value) {
        LinkMOdel mOdel=new LinkMOdel(
          value['link'],
          value['topic'],
          key,
          value['language'],);
        listdata.add(mOdel);
      });
      setState(() {
        print(listdata.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String model= ModalRoute.of(context).settings.arguments;
//    print(model);
//    print(listdata.length);
    for(int i=0;i<listdata.length;i++){
      if(model==listdata[i].language){
          LinkMOdel mOdel=new LinkMOdel(
            listdata[i].links,
            listdata[i].topic,
            listdata[i].key,
            listdata[i].language,
            );
          send.add(mOdel);
      }
    }

    print(send.length);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Advance Topic " + model),
        backgroundColor: Colors.black,
      ),
      body: send.length ==0? Text("Data not fount",style: TextStyle(color: Colors.red),): ListView.builder(
          itemCount: send.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                _launchURL(send[index].links);
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Text((1+index).toString(),style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                    SizedBox(width: 10),
                    Text(send[index].topic,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        )
                    ),
                  ],
                ),
              ),
            );
          }
      ),

    );
  }
}


_launchURL(dynamic link) async {
  var string = link; // 'artlang'
  String RemoveHttp=string.substring(5);
  String IOS_link="youtube"+RemoveHttp;
  print(IOS_link);
  if (Platform.isIOS) {
    if (await canLaunch(
        IOS_link)) {
      await launch(IOS_link,
          forceSafariVC: true);
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
