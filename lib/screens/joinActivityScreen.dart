import 'package:flutter/material.dart';
import 'package:wata_trip/Widgets/incDec.dart';
import 'package:wata_trip/Widgets/joinAcitivity.dart';
import 'package:wata_trip/Widgets/joinActivityForm.dart';
import 'package:wata_trip/Widgets/snackBar.dart';
import 'package:wata_trip/constants/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:wata_trip/screens/summaryScreen.dart';

class joinActivity extends StatefulWidget {
  String name;
  String Location;
  String Date;
  String aid;
  int i = 0;
  joinActivity(
      {super.key,
      required this.aid,
      required this.name,
      required this.Location,
      required this.Date});

  @override
  State<joinActivity> createState() => joinActivityState(
      i: i, Date: Date, Location: Location, Name: name, aid: aid);
}

class joinActivityState extends State<joinActivity> {
  @override
  void initState() {
    // TODO: implement initState
    formlst.clear();
  }

  static List name = [];
  static List email = [];
  static List phone = [];
  int i;
  joinActivityState(
      {required this.i,
      required this.Name,
      required this.Location,
      required this.aid,
      required this.Date});
  String Name;
  String aid;
  String Location;
  String Date;
  static List<form> formlst = [];

  int _item = 1;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    addList() {
      i = i + 1;
      formlst.add(new form(index: i));
      setState(() {});
    }

    deleteList() {
      formlst.removeLast();
      setState(() {});
    }

    save1() {
      name.clear();
      email.clear();
      phone.clear();
      formlst.forEach((widget) {
        name.add(widget.nameController.text);
        email.add(widget.emailController.text);
        phone.add(widget.phoneController.text);
      });

      if (emailValidation() == false) {
        functions()
            .showSnackbar(context: context, content: "Enter valid email");
      } else if (phoneValidation() == false) {
        functions()
            .showSnackbar(context: context, content: "Enter valid phoneNo");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => summaryScreen(
                    name: Name,
                    Date: Date,
                    EmailList: email,
                    PhoneNoList: phone,
                    NameList: name,
                    aid: aid,
                  )),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: _size.width * 0.8,
                child: Text(
                  "Activity",
                  style: style1,
                )),
            joinActivity2(
              size: _size,
              icn: Icons.location_on,
              txt: Name,
              txt1: "",
            ),
            joinActivity2(
              size: _size,
              icn: Icons.add_location_rounded,
              txt: Location,
              txt1: "(Meetup Location)",
            ),
            joinActivity2(
              size: _size,
              icn: Icons.calendar_month_sharp,
              txt: Date,
              txt1: "Date",
            ),
            joinActivity2(
              size: _size,
              icn: Icons.person_outline_outlined,
              txt: "",
              txt1: "8-10",
            ),
            Container(
                width: _size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Row(
                    children: [
                      incDec(
                        wdt: Icon(Icons.remove),
                        onPressed: () {
                          if (i > 0) {
                            deleteList();
                            i = i - 1;
                          }
                        },
                      ),
                      incDec(
                        wdt: Text(i.toString()),
                        onPressed: () {},
                      ),
                      incDec(
                        wdt: Icon(Icons.add),
                        onPressed: () {
                          if (i < 8) {
                            addList();
                          } else {}
                        },
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: formlst.length,
                  itemBuilder: (BuildContext context, int index) {
                    return formlst[index];
                  }),
            ),
            GestureDetector(
              onTap: () {
                if (i > 0) {
                  save1();
                } else {
                  functions()
                      .showSnackbar(context: context, content: "Add Guests");
                }
              },
              child: Container(
                color: Colors.red,
                width: _size.width,
                height: _size.height * 0.065,
                child: Text(
                  "Book Now",
                  style: style5,
                ),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  bool emailValidation() {
    for (int i = 0; i < email.length; i++) {
      if (EmailValidator.validate(email[i]) == false) {
        return false;
      }
    }
    return true;
  }

  bool phoneValidation() {
    try {
      for (int i = 0; i < phone.length; i++) {
        print(phone);
        if (int.parse(phone[i]) < 999999999 ||
            int.parse(phone[i]) > 9999999999) {
          return false;
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
