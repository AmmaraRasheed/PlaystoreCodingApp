import 'package:flutter/material.dart';
import 'package:mynewflutte_app/model/user.dart';
import 'package:mynewflutte_app/screen/home/home.dart';
import 'package:provider/provider.dart';
import '';
import 'authenticate/authentication.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
