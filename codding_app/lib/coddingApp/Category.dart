import 'package:codding_app/coddingApp/ExplainFullCode.dart';
import 'package:codding_app/coddingApp/ProjectModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}
final fb = FirebaseDatabase.instance.reference().child("PostData");
List<ModelProject> list = List();
List<ModelProject> myList=List();
String image_new;

class _CategoryState extends State<Category> {

  Vertical_view(ModelProject model,String image){
     return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExplainFullCodeHere(),
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
      ),
    );
  }

  HorizontalView(String language1,String image){
     return GestureDetector(
      onTap: (){
        myList.clear();
        for(int i=0;i<list.length;i++){
          var language=list[i].language;
          if(language==language1){
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
          image_new=image;
        });
      },
      child:  Container(
        child: Image.asset(
          image,
          scale: 1.1,
        ),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: new ListView.builder(
            itemCount: myList.length+1,
            itemBuilder: (context, index) {
              if(index==0){
                var singleChildScrollView = SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        HorizontalView('Flutter','assets/flutter.jpg'),
                        HorizontalView('C','assets/c.jpg'),
                        HorizontalView('C++','assets/cplus.jpg'),
                        HorizontalView('Android',"assets/android.jpg"),
                        HorizontalView('Python',"assets/python.jpg")
                      ],
                    ),
                    scrollDirection: Axis.horizontal);
                return singleChildScrollView;
              }
              else{
                return Column(
                  children: <Widget>[
                    Vertical_view(myList[index-1],image_new),
                  ],
                );
              }
            }
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    fb.once().then((DataSnapshot snap){
       var value=snap.value;
       list.clear();
       value.forEach((key,value) {
         ModelProject modelProject=new ModelProject(
           topic: value['topic'],
           language: value['language'],
           image: value['image'],
           code: value['code'],
           link: value['link'],
           key: key,
         );
         list.add(modelProject);
         if(value['language']=="Flutter"){
           myList.add(modelProject);
         }
       });
    });
  }
}
