import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Model{
  String name,email,pass,key;
  Model({this.name,this.email,this.pass,this.key});

//  Model.fromSnapshot(DataSnapshot snapshot)
//      :key = snapshot.key,
//        name = snapshot.value["name"],
//        email=snapshot.value["email"],
//        pass=snapshot.value["password"];
//
//  toJson() {
//    return {
//      "name": name,
//      "email":email,
//      "password":pass,
//    };
//  }

}