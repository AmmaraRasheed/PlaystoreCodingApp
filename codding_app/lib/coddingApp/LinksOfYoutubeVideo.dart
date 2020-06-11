import 'package:codding_app/coddingApp/LinkMOdel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class YoutubeVideoLinks extends StatefulWidget {
  @override
  _YoutubeVideoLinksState createState() => _YoutubeVideoLinksState();
}

List<LinkMOdel> listdata=new List();

class _YoutubeVideoLinksState extends State<YoutubeVideoLinks> {
  List<LinkMOdel> send=new List();
  final fb = FirebaseDatabase.instance.reference().child("YoutubeLinks");
  @override
  Widget build(BuildContext context) {
    String model= ModalRoute.of(context).settings.arguments;
    send.clear();
    for(int i=0;i<listdata.length;i++){
      String language=listdata[i].language;
      if(language==model){
        LinkMOdel mOdel=new LinkMOdel(
          listdata[i].links,
          listdata[i].topic,
          listdata[i].key,
          listdata[i].language,
        );
        send.add(mOdel);
      }
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Advance Topic " + model),
        backgroundColor: Colors.black,
      ),
        body: send.length ==0? Text("Loading",style:
              TextStyle(color: Colors.white))
            : ListView.builder(
          itemCount: send.length,
          itemBuilder: (context,pos){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  _launchURL(send[pos].links);
                },
                child: Row(
                  children: <Widget>[
                    Text((1+pos).toString(),style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                    SizedBox(width: 10),
                    Text(send[pos].topic,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }

  @override
  void initState() {
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
//        print(listdata.length);
      });
    });
  }
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
