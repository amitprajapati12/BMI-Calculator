import 'dart:async';

import 'package:b_m_i/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MyHomePage(title: 'MyHomePage',),) );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo.shade300,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcom to BMI Calculator",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 21,),

            Container(
              height: 100,
                width: 100,
                child: Image.asset("assets/images/bmi.png")),
          ],
        ),
      ),
    );
  }
}
