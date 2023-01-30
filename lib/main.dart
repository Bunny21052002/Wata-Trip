import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wata_trip/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;

void main() async {
  // sendReq2();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

sendReq() async {
  http.Response res;
  res =
      await http.post(Uri.parse("https://demo2.conscor.com/api/store-booking"),
          body: jsonEncode({
            "activity_id": "2",
            "activity_date_time": "02-12-2022,02:35",
            "booking_id": "318",
            "guest_name_1": "dhara",
            "email_1": "dhara1@gmail.com",
            "phone_no_1": "7043809756",
            "guest_name_2": "dhara",
            "email_2": "dhara1@gmail.com",
            "phone_no_2": "7043809756",
            "guest_name_3": "dhara",
            "email_3": "dhara1@gmail.com",
            "phone_no_3": "7043809756",
            "guest_name_4": "dhara",
            "email_4": "dhara1@gmail.com",
            "phone_no_4": "7043809756",
            "guest_name_5": "dhara",
            "email_5": "dhara1@gmail.com",
            "phone_no_5": "7043809756",
            "amount": "2000",
          }));
  print(res.statusCode);

  print(json.decode(res.body));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

sendReq2() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('https://demo2.conscor.com/api/store-booking'));
  request.body = json.encode({
    "activity_id": "2",
    "activity_date_time": "02-12-2022,02:35",
    "booking_id": "318",
    "guest_name_1": "dhara",
    "email_1": "dhara1@gmail.com",
    "phone_no_1": "7043809756",
    "guest_name_2": "dhara",
    "email_2": "dhara1@gmail.com",
    "phone_no_2": "7043809756",
    "guest_name_3": "dhara",
    "email_3": "dhara1@gmail.com",
    "phone_no_3": "7043809756",
    "guest_name_4": "dhara",
    "email_4": "dhara1@gmail.com",
    "phone_no_4": "7043809756",
    "guest_name_5": "dhara",
    "email_5": "dhara1@gmail.com",
    "phone_no_5": "7043809756",
    "amount": "2000"
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    
  } else {
    print(response.reasonPhrase);
  }
}
