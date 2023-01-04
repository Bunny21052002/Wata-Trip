import 'package:flutter/material.dart';

class Partition extends StatelessWidget {
  const Partition({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(height: screenSize.height*0.02,
    width: screenSize.width,
    color: Color.fromARGB(255, 228, 222, 222),);
  }
}