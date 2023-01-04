import 'package:flutter/material.dart';
import 'package:wata_trip/Services/FirebaseAuth.dart';
import 'package:wata_trip/Widgets/button.dart';
import 'package:wata_trip/Widgets/snackBar.dart';
import 'package:wata_trip/Widgets/textFieldWidget.dart';
import 'package:wata_trip/constants/constants.dart';
import 'package:wata_trip/screens/loginScreen.dart';

class forgotPassword extends StatefulWidget {
  forgotPassword({super.key, required this.email});
  String email;

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController _emailController = TextEditingController();

  bool _state = true;

  @override
  Widget build(BuildContext context) {
    _emailController.text = widget.email;

    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  "Forgot Password",
                  style: style12,
                ),
              ),
            ),
            height: _size.height * 0.2,
            width: _size.width,
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              children: [
                Container(
                  height: _size.height * 0.865,
                  width: _size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _state
                        ? [
                            SizedBox(
                              height: _size.height * 0.016,
                            ),
                            Text(
                              "Enter your Email to recover your password",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: _size.height * 0.016,
                            ),
                            textFieldWidget(
                                size: _size,
                                type: TextInputType.emailAddress,
                                controller: _emailController,
                                hideText: false,
                                readOnly: false,
                                txt: "Email"),
                            SizedBox(
                              height: _size.height * 0.016,
                            ),
                            button(
                                b_clr: Color(0xFFFFB100),
                                t_clr: Colors.white,
                                txt: "Reset Password",
                                onPressed: () {
                                  Auth()
                                      .ResetPassword(
                                          email: _emailController.text)
                                      .then((user) async {
                                    setState(() {
                                      _state = false;
                                    });
                                    await Future.delayed(Duration(seconds: 4));
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                loginScreen()),
                                        (Route<dynamic> route) => false);
                                  }).catchError((e) {
                                    functions().showSnackbar(
                                        context: context,
                                        content: ("Something went wrong"));
                                  });
                                },
                                size: _size)
                          ]
                        : [
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Container(
                                width: _size.width * 0.8,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Reset link has been sent to your email address ",
                                  style: style11,
                                ),
                              ),
                            )
                          ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
