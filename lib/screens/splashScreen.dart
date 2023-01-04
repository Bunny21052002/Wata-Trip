import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wata_trip/screens/HomeScreen.dart';
import 'package:wata_trip/screens/MainScreen.dart';

import 'loginScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    navigator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splashScreen.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/logo.png",
              height: _size.height * 0.15,
            ),
          )
        ],
      ),
    );
  }

  navigator() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if(email==null){

    await Future.delayed(Duration(milliseconds: 1200), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => (loginScreen())));
    }
    else{
      await Future.delayed(Duration(milliseconds: 1200), () {});
       Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => (MainScreen(id:0,index: 0,apiId: "0",))));
    }
  }
}
