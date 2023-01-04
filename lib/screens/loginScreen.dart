import 'package:flutter/material.dart';

import 'package:wata_trip/Services/GoogleServices.dart';
import 'package:wata_trip/Widgets/button.dart';

import 'package:wata_trip/Widgets/textFieldWidget.dart';
import 'package:wata_trip/constants/constants.dart';
import 'package:wata_trip/screens/HomeScreen.dart';
import 'package:wata_trip/screens/forgotPassword.dart';
import 'package:wata_trip/screens/MainScreen.dart';
import 'package:wata_trip/screens/signInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/FirebaseAuth.dart';
import '../Widgets/snackBar.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
              top: 70,
              left: 20,
              child: Text(
                "Login",
                style: style8,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                      child: Image.asset(
                    "assets/logo.png",
                    height: _size.height * 0.15,
                  )),
                ),
                SizedBox(
                  height: _size.height * 0.11,
                ),
                textFieldWidget(
                    hideText: false,
                    readOnly: false,
                    type: TextInputType.emailAddress,
                    size: _size,
                    controller: _emailController,
                    txt: "Email"),
                SizedBox(
                  height: _size.height * 0.016,
                ),
                textFieldWidget(
                    type: TextInputType.visiblePassword,
                    readOnly: false,
                    hideText: true,
                    size: _size,
                    controller: _passwordController,
                    txt: "Password"),
                SizedBox(
                  height: _size.height * 0.016,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: this.value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            }),
                        Text("Remember Me"),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgotPassword(
                                        email: _emailController.text,
                                      )));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: style11,
                        )),
                  ],
                ),
                SizedBox(
                  height: _size.height * 0.016,
                ),
                button(
                    onPressed: (){
                      if (_emailController.text != "" &&
                          _passwordController.text != "") {
                        Auth()
                            .signInwithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((user) async{
                      final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('email',_emailController.text);
                         Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen(id:0,index: 0,apiId: "0",)),
                                        (Route<dynamic> route) => false);
                        }).catchError((e) {
                          print("hello" + e.toString());
                          functions().showSnackbar(
                              context: (context),
                              content: "Something went Wrong");
                        });
                      } else {
                        functions().showSnackbar(
                            context: context,
                            content: ("Enter all the Fields"));
                      }
                    },
                    b_clr: Colors.red,
                    t_clr: Colors.white,
                    txt: "Login",
                    size: _size),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                Text(
                  "Or Connect with",
                  style: style9,
                ),
                SizedBox(
                  height: _size.height * 0.019,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button2(
                      size: _size,
                      icn: "assets/facebook.png",
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: _size.width * 0.06,
                    ),
                    button2(
                      size: _size,
                      icn: "assets/google plus.png",
                      onPressed: signIn,
                    ),
                  ],
                ),
                SizedBox(
                  height: _size.height * 0.019,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont Have an Account?",
                      style: style10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signInScreen()));
                        },
                        child: Text(
                          "Sign Up",
                          style: style11,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  signIn() async {
    try {
      await GoogleSignInApi.login();
    } catch (e) {
      print(e);
    }
    print("1");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(id:0,index: 0,apiId: "0",)),
        (Route<dynamic> route) => false);
  }
}
