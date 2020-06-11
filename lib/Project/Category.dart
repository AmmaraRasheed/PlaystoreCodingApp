import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Project/FullCode.dart';
import 'package:mynewflutte_app/Project/ProjectModel.dart';
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}
String new_language;
dynamic image_new='asset/flutter.jpg';
class _CategoryState extends State<Category> {
  picture( ModelProject model,dynamic image) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullCode(),
            settings: RouteSettings(
              arguments: model,
            ),
          ),
        );
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Image.asset(
              image,
              scale: 3.3,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Text(model.topic,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      ),
    );
  }
  List<ModelProject> myList=List();
  picture2(String language,dynamic image){
    return GestureDetector(
      onTap: (){
        setState(() {
          image_new=image;
          new_language=language;
          myList.clear();
          for(int i=0;i<list.length;i++){
            var language=list[i].language;
            if( language==new_language){
              ModelProject model=new ModelProject(
                topic: list[i].topic,
                language: list[i].language,
                image: list[i].image,
                code: list[i].code,
                link: list[i].link,
                key: list[i].key,
              );
              myList.add(model);
            }
          }
          setState(() {
          });
        });
      },
      child: Container(
        child: Image.asset(
          image,
          scale: 1.1,
        ),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
    );
  }
  //gt data from database
  final fb = FirebaseDatabase.instance.reference().child("Mydata");
  List<ModelProject> list = List();
  ModelProject model;

  @override
  void initState() {
    super.initState();
    fb.once().then((DataSnapshot snap){
      print(snap);
      var data=snap.value;
      print(data);
      list.clear();
      data.forEach((key,value) {
        ModelProject model=new ModelProject(
          topic: value['topic'],
          language: value['language'],
          image: value['image'],
          code: value['code'],
          link: value['link'],
          key: key,
        );
        list.add(model);
        if(value['language']=="Flutter"){
          myList.add(model);
        }

      });
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scroller",
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: new ListView.builder(
            itemCount: myList.length+1,
            itemBuilder: (context, index) {
              if (index == 0) {
                //first row is horizontal scroll
                var singleChildScrollView = SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        picture2('Flutter','asset/flutter.jpg'),
                        picture2('C','asset/c.jpg'),
                        picture2('C++','asset/cplus.jpg'),
                        picture2('Android',"asset/android.jpg"),
                        picture2('Python',"asset/python.jpg"),
                      ],
                    ),
                    scrollDirection: Axis.horizontal);
                return singleChildScrollView;
              } else {
                return Column(
                  children: <Widget>[
                    picture(myList[index-1],image_new),

                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

