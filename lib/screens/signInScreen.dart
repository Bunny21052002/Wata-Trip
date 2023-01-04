import 'package:flutter/material.dart';

import 'package:wata_trip/utils/Lists.dart';
import '../Services/FirebaseAuth.dart';
import '../Widgets/button.dart';
import '../Widgets/snackBar.dart';
import '../Widgets/textFieldWidget.dart';
import '../constants/constants.dart';
import 'MainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});
  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _mnoController = TextEditingController();
  bool value = false;
  String _index = "0";
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _dobController.text = value!.day.toString() +
            "-" +
            value.month.toString() +
            "-" +
            value.year.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textWidget(size: _size, txt: "Personal Info"),
              SizedBox(
                height: _size.height * 0.02,
              ),
              textFieldWidget(
                  type: TextInputType.name,
                  hideText: false,
                  size: _size,
                  readOnly: false,
                  controller: _fnameController,
                  txt: "First Name"),
              SizedBox(
                height: _size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textFieldWidget2(
                      size: _size,
                      type: TextInputType.number,
                      controller: _dobController,
                      hideText: false,
                      readOnly: true,
                      txt: "Birthday"),
                  GestureDetector(
                    onTap: _showDatePicker,
                    child: Container(
                      width: _size.width * 0.21,
                      height: _size.height * 0.06,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black54),
                          bottom: BorderSide(color: Colors.black54),
                          right: BorderSide(color: Colors.black54),
                        ),
                      ),
                      child: Icon(Icons.calendar_month_rounded),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _size.height * 0.02,
              ),
              textFieldWidget(
                  type: TextInputType.name,
                  hideText: false,
                  readOnly: false,
                  size: _size,
                  controller: _lnameController,
                  txt: "Last Name"),
              SizedBox(
                height: _size.height * 0.02,
              ),
              textFieldWidget(
                  type: TextInputType.name,
                  hideText: true,
                  size: _size,
                  readOnly: false,
                  controller: _passwordController,
                  txt: "Password"),
              SizedBox(
                height: _size.height * 0.04,
              ),
              textWidget(size: _size, txt: "Contacts Info"),
              SizedBox(
                height: _size.height * 0.02,
              ),
              textFieldWidget(
                  type: TextInputType.name,
                  hideText: false,
                  size: _size,
                  readOnly: false,
                  controller: _emailController,
                  txt: "Email"),
              SizedBox(
                height: _size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54)),
                    width: _size.width * 0.21,
                    height: _size.height * 0.06,
                    child: DropdownButtonFormField(
                      value: countryCode[int.parse(_index)],
                      items: countryCode.map((e) {
                        // ignore: sort_child_properties_last
                        return DropdownMenuItem(child: Text(e), value: e);
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _index = (countryCode.indexOf(val)).toString();
                        });
                      },
                    ),
                  ),
                  textFieldWidget2(
                      size: _size,
                      type: TextInputType.number,
                      controller: _mnoController,
                      hideText: false,
                      readOnly: false,
                      txt: "Mobile No")
                ],
              ),
              SizedBox(
                height: _size.height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: _size.width * 0.09,
                  ),
                  Text(
                    "Agree to",
                    style: style10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Our Terms",
                        style: style11,
                      )),
                  Checkbox(
                      value: this.value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: _size.height * 0.02,
              ),
              button(
                  b_clr: Colors.red,
                  t_clr: Colors.white,
                  txt: "Create Account",
                  onPressed: () {
                    if (_emailController.text != "" &&
                        _passwordController.text != "" &&
                        _dobController != "" &&
                        _fnameController != "" &&
                        _lnameController != "") {
                      Auth()
                          .createUserwithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((user)async {
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
                            content: "Something went wrong");
                      });
                    } else {
                      functions().showSnackbar(
                          context: context, content: ("Enter all the Fields"));
                    }
                  },
                  size: _size)
            ],
          ),
        ]),
      ),
    );
  }
}

class textWidget extends StatelessWidget {
  const textWidget({
    Key? key,
    required this.size,
    required this.txt,
  });
  final Size size;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.84,
      child: Text(
        txt,
        style: style8,
      ),
    );
  }
}
