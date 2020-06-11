import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:mynewflutte_app/Project/MainPage.dart';
import 'package:splashscreen/splashscreen.dart';
//void main(){
//  runApp(new MaterialApp(
//    home: new MyApp(),
//  ));
//}


class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => new _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new MyApp3(),
        title: new Text('Coding  App',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0
          ),),
        image: new Image.asset('asset/bg.jpg'),
        backgroundColor: Colors.black,
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.white
    );
  }
}

//class AfterSplash extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//          title: new Text("Welcome In SplashScreen Package"),
//          automaticallyImplyLeading: false
//      ),
//      body: new Center(
//        child: new Text("Done!",
//          style: new TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 30.0
//          ),),
//
//      ),
//    );
//  }
//}

//void main() => runApp(new MyApp1());

//class MyApp1 extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        title: 'Flutter Demo',
//        theme: new ThemeData(
//        primarySwatch: Colors.blue,
//    ),
//    home: new MyHomePage(title: 'ListView with Search')
//
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController editingController = TextEditingController();
//
//  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
//  var items = List<String>();
//
//  @override
//  void initState() {
//    items.addAll(duplicateItems);
//    super.initState();
//  }
//
//  void filterSearchResults(String query) {
//    List<String> dummySearchList = List<String>();
//    dummySearchList.addAll(duplicateItems);
//    if(query.isNotEmpty) {
//      List<String> dummyListData = List<String>();
//      dummySearchList.forEach((item) {
//        if(item.contains(query)) {
//          dummyListData.add(item);
//        }
//      });
//      setState(() {
//        items.clear();
//        items.addAll(dummyListData);
//      });
//      return;
//    } else {
//      setState(() {
//        items.clear();
//        items.addAll(duplicateItems);
//      });
//    }
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: TextField(
//                onChanged: (value) {
//                  filterSearchResults(value);
//                },
//                controller: editingController,
//                decoration: InputDecoration(
//                    labelText: "Search",
//                    hintText: "Search",
//                    prefixIcon: Icon(Icons.search),
//                    border: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//              ),
//            ),
//            Expanded(
//              child: ListView.builder(
//                shrinkWrap: true,
//                itemCount: items.length,
//                itemBuilder: (context, index) {
//                  return ListTile(
//                    title: Text('${items[index]}'),
//                  );
//                },
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}