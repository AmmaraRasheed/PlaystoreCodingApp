import 'package:flutter/material.dart';

  String dropdownValue = 'Trending';

  List <String> spinnerItems = [
    'Trending',
    'Products',
    'Bollywood',
    'logos',
    'Design'
  ] ;

  Future<String> createDiaog(BuildContext context){
//    TextEditingController =TextEditingController();
    return showDialog(context: context,builder: (context){
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 99.0),
          child: AlertDialog(
            title: Text("What New topic you want"),
            content: Column(
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      style: TextStyle(color: Colors.red, fontSize: 18),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (data) {
                        dropdownValue=data;
                        print(dropdownValue);
                      },
                      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ]),
                ),
                RaisedButton(
                  child: Text("Select Image"),
                  onPressed: (){},
                ),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: (){
//              Navigator.of(context).pop(ed.text.toString());
                },
                child: Text("submit"),
              )
            ],
          ),
        ),
      );


    });

  }

