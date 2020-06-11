
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mynewflutte_app/Teast/ModelClass.dart';
import 'package:mynewflutte_app/model/user.dart';

class AuthServices{
  final fb = FirebaseDatabase.instance.reference().child("Student");


  final FirebaseAuth _auth=FirebaseAuth.instance;
  User _userFromfirebaseUser(FirebaseUser user){
    return user !=null? User(uid:user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromfirebaseUser);
  }

//  Stream<User> get load{

//    return ref.snapshots();
//  }

  Future registerWithEmailPass(String email,String pass) async {
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user=result.user;
      return _userFromfirebaseUser(user);


    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //sigin code
  Future SignInEmailPass(String email,String pass) async {
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user=result.user;
      return _userFromfirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //signout
Future SignOUT()async{
  try{
    return await _auth.signOut();
  }catch(e){
    return null;
  }
}

//List<Model> _listMy(){
//  return Model(
//    name: "Ammatra",
//    pass: "aaa",
//    email: "ss",
//  );
}

