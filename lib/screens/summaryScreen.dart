import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wata_trip/Constants/constants.dart';
import 'package:wata_trip/Widgets/button.dart';
import 'package:wata_trip/Widgets/joinAcitivity.dart';
import 'package:wata_trip/Widgets/summaryScreen.dart';

import 'package:http/http.dart' as http;

class summaryScreen extends StatefulWidget {
  summaryScreen(
      {super.key,
      required this.NameList,
      required this.aid,
      required this.Date,
      required this.name,
      required this.EmailList,
      required this.PhoneNoList});
  List NameList;
  List EmailList;
  List PhoneNoList;
  String aid;
  String name;
  String Date;
  @override
  State<summaryScreen> createState() => _summaryScreenState(
      Date: Date,
      NameList: NameList,
      name: name,
      EmailList: EmailList,
      PhoneNoList: PhoneNoList,
      aid: aid);
}

class _summaryScreenState extends State<summaryScreen> {
  _summaryScreenState(
      {required this.NameList,
      required this.Date,
      required this.aid,
      required this.name,
      required this.EmailList,
      required this.PhoneNoList});
  String name;
  List NameList;

  List EmailList;
  List PhoneNoList;
  String Date;
  String aid;
  @override
  bookReq() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://demo2.conscor.com/api/store-booking'));
    for (int i = NameList.length; i < 8; i++) {
      NameList.insert(i, " ");
      PhoneNoList.insert(i, " ");
      EmailList.insert(i, " ");
      
    }
    request.body = json.encode({
      "activity_id": aid,
      "activity_date_time": "02-12-2022,02:35",
      "booking_id": "318",
      "guest_name_1": NameList[0],
      "email_1": EmailList[0],
      "phone_no_1": PhoneNoList[0],
      "guest_name_2": NameList[1],
      "email_2": EmailList[1],
      "phone_no_2": PhoneNoList[1],
      "guest_name_3": NameList[2],
      "email_3": EmailList[2],
      "phone_no_3": PhoneNoList[2],
      "guest_name_4": NameList[3],
      "email_4": EmailList[3],
      "phone_no_4": PhoneNoList[3],
      "guest_name_5": NameList[4],
      "email_5": EmailList[4],
      "phone_no_5": PhoneNoList[4],
      "guest_name6": NameList[5],
      "email_6 ": EmailList[5],
      "phone_no6": PhoneNoList[5],
      "guest_name_7": NameList[6],
      "email_7": EmailList[6],
      "phone_no_7": PhoneNoList[6],
      "guest_name_8": NameList[7],
      "email_8": EmailList[7],
      "phone_no_8": PhoneNoList[7],
      "amount": "2000"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Booking Succes");
    } else {}
  }

  Widget build(BuildContext context) {
    print(aid);
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
              width: _size.width * 0.8,
              child: Text(
                "Summary",
                style: style1,
              )),
          joinActivity2(
            size: _size,
            icn: Icons.location_on,
            txt: name,
            txt1: "",
          ),
          joinActivity2(
            size: _size,
            icn: Icons.calendar_month_sharp,
            txt: Date,
            txt1: "Date",
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: NameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return summaryScreenWidget(
                      size: _size,
                      i: index + 1,
                      name: NameList[index],
                      email: EmailList[index],
                      phone: PhoneNoList[0]);
                }),
          ),
          button(
              b_clr: Colors.green,
              t_clr: Colors.white,
              txt: "Confirm",
              onPressed: () {
                bookReq();
              },
              size: _size)
        ]),
      ),
    );
  }
}
