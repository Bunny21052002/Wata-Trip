import 'package:flutter/material.dart';
import 'package:wata_trip/Constants/constants.dart';

class joinActivity2 extends StatefulWidget {
  joinActivity2(
      {super.key,
      required this.size,
      required this.icn,
      required this.txt,
      required this.txt1});
  Size size;
  IconData icn;
  String txt;
  String txt1;
  @override
  State<joinActivity2> createState() =>
      _joinActivity2State(size: size, icn: icn, txt: txt, txt1: txt1);
}

class _joinActivity2State extends State<joinActivity2> {
  _joinActivity2State(
      {required this.size,
      required this.icn,
      required this.txt,
      required this.txt1});
  IconData icn;
  Size size;
  String txt;
  String txt1;
    int x = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 0.6)),
        color: Colors.grey.shade100,
      ),
      height: size.height * 0.06,
      width: size.width,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
            ),
            Icon(
              icn,
              color: Colors.grey.shade500,
            ),
            SizedBox(
              width: 50,
            ),
            Flexible(
              child: GestureDetector(
                  onTap: () {
                    if (x == 1) {
                      setState(() {
                        x = 2;

                      });
                    } else {
                      setState(() {
                        x = 1;

                      });
                    }
                  },
                  child: Text(
                    txt,
                    maxLines: x,
                    overflow: TextOverflow.ellipsis,
                    style: style13,
                  )),
            ),
            Text(txt1),
          ],
        ),
      ),
    );
  }
}
