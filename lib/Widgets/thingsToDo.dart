import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../screens/MainScreen.dart';

class thingsToDo extends StatelessWidget {
  Size size;
  thingsToDo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Things to Do",
                style: style2,
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                containers(
                    apiId: "1",
                    size: size,
                    img: Image.asset(
                      "assets/agriTour.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "Agri-tour"),
                containers(
                    apiId: "2",
                    size: size,
                    img: Image.asset(
                      "assets/city.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "City Sight"),
                containers(
                    apiId: "3",
                    size: size,
                    img: Image.asset(
                      "assets/concert.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "Concerts"),
                containers(
                    apiId: "4",
                    size: size,
                    img: Image.asset(
                      "assets/cultural.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "Cultural tools"),
                containers(
                    apiId: "5",
                    size: size,
                    img: Image.asset(
                      "assets/heritage.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "Heritage"),
                containers(
                    apiId: "6",
                    size: size,
                    img: Image.asset(
                      "assets/outdoorRelax.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "Outdoor Relax"),
                containers(
                    apiId: "7",
                    size: size,
                    img: Image.asset(
                      "assets/sports.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "Sports"),
                containers(
                    apiId: "8",
                    size: size,
                    img: Image.asset(
                      "assets/waterActivity.png",
                      height: size.height * 0.25,
                      width: size.width * 0.25,
                    ),
                    txt: "Water Activity"),
              ],
            ),
            SizedBox(
              height: size.height * 0.016,
            ),
          ],
        ),
      ),
    );
  }
}

class containers extends StatelessWidget {

  Image img;
  String txt;
  String apiId;
  containers(
      {Key? key,
      required this.size,
      required this.apiId,
      required this.img,
      required this.txt,
})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(id:0,
                    index: 4,
                    apiId: apiId,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        height: size.width * 0.25,
        width: size.width * 0.25,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(8.0), child: img),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Flexible(
                child: Text(
                  txt,
                  style: style4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
