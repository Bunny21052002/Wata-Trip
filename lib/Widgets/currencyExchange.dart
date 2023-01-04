

import 'package:flutter/material.dart';
import 'package:wata_trip/Widgets/button.dart';
import 'package:wata_trip/Widgets/partition.dart';


import '../constants/constants.dart';

class curExc extends StatefulWidget {
  Size size;
  curExc({super.key, required this.size});

  @override
  State<curExc> createState() => _curExcState(size: size);
}

class _curExcState extends State<curExc> {
  Size size;
  _curExcState({required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(

      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Currency Exchange Rates",
              style: style2,
            ),
            widget1(img: "images/img8.png", txt: "US Dollar USD", txt1: "1.00"),
            widget1(
                img: "images/img9.png",
                txt: "Phillippine Peso PHP",
                txt1: "59.14"),
                SizedBox(
height: size.height*0.016,
                ),
button(b_clr: Colors.red, t_clr: Colors.white, txt: "Nearby Forex Shop", onPressed: (){}, size: size)
          ],
        ),
      ),
    );
  }
}

class widget1 extends StatelessWidget {
  String img;
  String txt;
  String txt1;
  widget1({super.key, required this.img, required this.txt, required this.txt1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
          ),
          Text(txt, style: style3,),
          Text(txt1, style: style6),
        ],
      ),
    );
  }
}
