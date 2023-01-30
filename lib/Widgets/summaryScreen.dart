import 'package:flutter/material.dart';
import 'package:wata_trip/constants/constants.dart';

class summaryScreenWidget extends StatelessWidget {
  summaryScreenWidget(
      {super.key,
      required this.size,
      required this.i,
      required this.name,
      required this.email,
      required this.phone});
  int i;
  String email;
  String name;
  Size size;
  String phone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Guest $i",
            style: style17,
          ),
          SizedBox(
            height:7,
          ),
          Text("Name", style: style10),
          Text(name, style: style16),
          SizedBox(
            height:7,
          ),
          Text("Email", style: style10,),
          Text(email, style: style16),
          SizedBox(
            height:7,
          ),
          Text("Phone", style: style10),
          Text(phone, style: style16),
          Center(
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  color: Colors.black45, width: 1
                ))
              ),
              width: size.width*0.9,
            ),
          )
        ],

      ),
    );
  }
}
