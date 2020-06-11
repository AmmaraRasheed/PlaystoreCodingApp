import 'package:codding_app/coddingApp/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: FirstCallPage(),
      title: Text("Codding App",
      style:TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      ),
      image: Image.asset('assets/bg.jpg'),
      backgroundColor: Colors.black,
      photoSize: 100.0,
      onClick: ()=> print("hello splash"),
      loaderColor: Colors.white,
    );
  }
}
