import 'package:flutter/material.dart';
import 'package:wata_trip/constants/constants.dart';
import 'package:wata_trip/screens/joinActivityScreen.dart';




class form extends StatelessWidget {
  int index;
  form({super.key, required this.index});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _size= MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Text("Guest $index", style: style10,),
          SizedBox(
            height: 10,
          ),
          Text("Guest Name"),
          SizedBox(
            height: 5,
          ),
          Container(
            width:_size.width*0.9 ,
            decoration: BoxDecoration(
              border: Border(bottom:BorderSide(color: Colors.black,width: 1))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:2.0, left: 10, right: 10, bottom: 2),

              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "Name"),
                controller: nameController,
              keyboardType: TextInputType.name,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Guest E-mail"),
SizedBox(
            height: 5,
          ),
          Container(
            width:_size.width*0.9 ,
            decoration: BoxDecoration(
              border: Border(bottom:BorderSide(color: Colors.black,width: 1))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:2.0, left: 10, right: 10, bottom: 2),

              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "Email"),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Guest Contact-No"),
SizedBox(
            height: 5,
          ),
          Container(
            width:_size.width*0.9 ,
            decoration: BoxDecoration(
              border: Border(bottom:BorderSide(color: Colors.black,width: 1))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:2.0, left: 10, right: 10, bottom: 2),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "Phone"),
                keyboardType: TextInputType.number,
                controller: phoneController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}