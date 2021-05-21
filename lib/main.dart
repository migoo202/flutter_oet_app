import 'package:flutter/material.dart';
import 'package:oet20/home_screen.dart';
import 'package:oet20/wlcome_screen.dart';

void main(){
  runApp(megoo());
}
class megoo extends StatefulWidget {
  @override
  _megooState createState() => _megooState();
}

class _megooState extends State<megoo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:"welcomescreen" ,
      routes: {
        "welcomescreen":(context)=>welcomeScreen(),
        'homescreen':(context)=> homeScreen()

      },
    );
  }
}
