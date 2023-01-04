import 'package:flutter/material.dart';
import '../constants/constants.dart';


class weather extends StatelessWidget {
  Size size;
  weather({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weather",
                style: style2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 15),
                child: Row(
                  children: [
                    Text("Pasig City, Philippines"),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "30°",
                    style: style1,
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Party Cloudy",
                    style: style3,
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    "images/img10.png",
                    height: size.height * 0.13,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Tomorrow",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top :10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget2(img: "images/img10.png",size: size,txt1: "30°",txt2: "Morning"),
                    widget2(img: "images/img10.png",size: size,txt1: "28°",txt2: "Afternoon"),
                    widget2(img: "images/img11.png",size: size,txt1: "26°",txt2: "Evening"),
                    widget2(img: "images/img12.png",size: size,txt1: "25°",txt2: "Night"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class widget2 extends StatelessWidget {
  Size size;
  String img;
  String txt1;
  String txt2;
  widget2(
      {super.key, required this.img, required this.txt1, required this.txt2, required this.size});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
      
        width: size.width*0.2,
    
        child: Column(children: [
          Image.asset(img),
          Text(txt1,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(txt2,style: TextStyle(fontSize: 16))
        ]),
      ),
    );
  }
}
