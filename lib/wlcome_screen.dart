import 'package:flutter/material.dart';
class welcomeScreen extends StatefulWidget {



  @override

  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  void initState(){
    Future.delayed(const Duration(seconds: 5),()=> Navigator.pushNamed(context, 'homescreen'));
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height:double.infinity,width: double.infinity,color: Color.fromRGBO(4, 99, 187, 1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              backgroundImage: AssetImage('assets/hd5.png'),
              radius: 50,
            ),
            SizedBox(height: 25,),
            Text('welcome to OET 2.0 app',style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20,color: Colors.white),)
          ],
        ),
      ),),
    )
    ;
  }
}
