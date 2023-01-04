import 'package:flutter/material.dart';

class joinActivity extends StatefulWidget {
joinActivity({super.key, required this.size});
  Size size;

  @override
  State<joinActivity> createState() => _joinActivityState(size: size);
}

class _joinActivityState extends State<joinActivity> {
_joinActivityState({required this.size});

  Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      height:size.height*0.05 ,
      width: size.width,
    );
  }
}