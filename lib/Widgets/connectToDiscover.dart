import 'package:flutter/material.dart';
import 'package:wata_trip/Widgets/button.dart';

import '../Constants/constants.dart';


class connectToDiscover extends StatefulWidget {
  final Size size;
  const connectToDiscover({super.key, required this.size});

  @override
  State<connectToDiscover> createState() => _connectToDiscoverState(size: size);
}

class _connectToDiscoverState extends State<connectToDiscover> {
  @override
  Size size;
  _connectToDiscoverState({required this.size});
  
  get style2 => null;
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height*0.016,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "Connect to Discover",
              style: style10,
            ),
          ),
          SizedBox(
            height: size.height*0.016,
          ),
          Image.asset("images/img3.png"),
          SizedBox(
            height: size.height*0.016,
          ),
button(b_clr: Colors.red, t_clr: Colors.white, txt: "Show Whats Near Me", onPressed: (){}, size: size),
SizedBox(
            height: size.height*0.016,
          ),
        ],
      ),
    );
  }
}
