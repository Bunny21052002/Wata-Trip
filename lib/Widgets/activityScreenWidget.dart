import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wata_trip/Widgets/button.dart';
import 'package:wata_trip/Widgets/thingsToDo.dart';
import 'package:wata_trip/constants/constants.dart';
import 'package:wata_trip/screens/MainScreen.dart';
import 'package:wata_trip/utils/Lists.dart';

class activityScreenWidget extends StatefulWidget {
  activityScreenWidget({
    super.key,
    required this.size,
    required this.img,
    required this.rating,
    required this.name,
    required this.location,
    required this.price,
    required this.id,
    required this.apiid,
    required this.offerPrice,
  });
  Size size;
  String img;
  double rating;
  String name;
  String price;
  String offerPrice;
  String apiid;
  String location;
  int id;

  @override
  State<activityScreenWidget> createState() => _activityScreenWidgetState(
      img: img,
      size: size,
      rating: rating,
      name: name,
      location: location,
      price: price,
      id: id,
      apiid: apiid,
      offerPrice: offerPrice);
}

class _activityScreenWidgetState extends State<activityScreenWidget> {
  _activityScreenWidgetState(
      {required this.size,
      required this.price,
      required this.offerPrice,
      required this.location,
      required this.img,
      required this.rating,
      required this.id,
      required this.apiid,
      required this.name});
  String name;
  int id;
  String location;
  String price;
  String offerPrice;
  String apiid;
  Size size;
  String img;
  double rating;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 2,
          child: Container(
            width: size.width * 0.85,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreen(
                                id: id,
                                index: 5,
                                apiId: apiid,
                              )),
                    );
                    RecentSearchList().recentSearchList(
                        name: name, image: img, id: id, apiId: apiid);
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        img,
                        width: size.width * 0.85,
                        height: size.height * 0.2,
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    name,
                    style: style10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 25,
                    child: FittedBox(
                      child: RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 10,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(location),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.0, left: 25, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              offerPrice,
                              style: style13,
                            ),
                          ),
                          Text(
                            price,
                            style: style15,
                          ),
                        ],
                      ),
                      button3(
                          b_clr: Colors.green,
                          t_clr: Colors.white,
                          txt: "Book",
                          onPressed: () {},
                          size: size)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
