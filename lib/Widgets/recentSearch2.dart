

import 'package:flutter/material.dart';
import 'package:wata_trip/Constants/constants.dart';
import 'package:wata_trip/Widgets/recentSearch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wata_trip/utils/Lists.dart';


class RecentSearch extends StatefulWidget {
  const RecentSearch({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<RecentSearch> createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  bool _state = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  String email = "";
  getData() async {
    final prefs = await SharedPreferences.getInstance();
    email = await prefs.getString('email')!;
    setState(() {
      _state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return _state ? Padding(
      padding: const EdgeInsets.symmetric(vertical:18.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  
                  "Hello, "+ email,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: style8,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                iconSize: 35,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Recent Searches",
              style: style9,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
                  width: _size.width,

                  child: Center(child: Text("Plan Some thing!", style: style8,)),
                ),
                
        ],
      ),
    ):Container();
  }
}
