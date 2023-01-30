import 'package:flutter/material.dart';
import 'package:wata_trip/screens/MainScreen.dart';
import 'package:wata_trip/screens/tourDetails.dart';
import '../constants/constants.dart';

class RecentSearch extends StatelessWidget {
  RecentSearch(
      {super.key,
      required this.name,
      required this.image,
      required this.api_id,
      required this.id});
  String name;
  String image;
  String api_id;
  int id;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MainScreen(index: 5, apiId: api_id, id: id)),
          );
        },
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: _size.width * 0.4,
            height: _size.width * 0.4,
            child: Container(
              width: _size.width * 0.4,
              height: _size.width * 0.4,
              decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          image,
                          height: _size.width * 0.28,
                          width: _size.width * 0.28,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Flexible(
                          child: Text(
                        name,
                        maxLines: 2,
                        style: style10,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
