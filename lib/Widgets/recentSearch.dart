import 'package:flutter/material.dart';
import '../constants/constants.dart';


class recentSearchCont extends StatelessWidget {
  Size size;
  Image img;
  String txt;
  recentSearchCont(
      {super.key, required this.size, required this.img, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 15, left: 13),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        child: FittedBox(
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(153, 241, 239, 239),
                borderRadius: BorderRadius.circular(20)),
            height: size.width * 0.39,
            width: size.width * 0.39,
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  img,
                  Text(
                    txt,
                    style: style3,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
