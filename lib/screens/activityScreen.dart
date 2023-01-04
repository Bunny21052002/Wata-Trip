import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wata_trip/Widgets/activityScreenWidget.dart';
import 'package:wata_trip/constants/constants.dart';
import 'package:http/http.dart' as http;

class activityScreen extends StatefulWidget {
  activityScreen({
    super.key,
    required this.apiId,
  });
  String apiId;
  @override
  State<activityScreen> createState() => _activityScreenState(apiId: apiId);
}

class _activityScreenState extends State<activityScreen> {
  _activityScreenState({required this.apiId});
  String apiId;
  bool _state = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  List _Data = [];
  getData() async {
    http.Response res;
    res = await http
        .get(Uri.parse("https://demo2.conscor.com/api/activity/$apiId"));
    List _res = [];
    _res.add(jsonDecode(res.body));
    _Data = _res[0]["Data"];
    print(_Data);
    setState(() {
      _state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return _state
        ? Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Book Now!",
                    style: style8,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _Data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return activityScreenWidget(
                          apiid: apiId,
                          id: _Data[index]["id"],
                          location: _Data[index]["address"],
                          offerPrice: _Data[index]["offer_price"],
                          price: _Data[index]["price"],
                          name: _Data[index]["name"],
                          size: _screenSize,
                          img: _Data[index]["image1"],
                          rating: 2.5,
                        );
                      }),
                ),
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ));
  }
}
