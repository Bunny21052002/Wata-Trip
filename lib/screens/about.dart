import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wata_trip/Widgets/bookNowWidget.dart';
import 'package:wata_trip/constants/constants.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;

class aboutScreen extends StatefulWidget {
  aboutScreen({super.key, required this.id, required this.apiId});
  String apiId;
  int id;

  @override
  State<aboutScreen> createState() => _aboutScreenState(id: id, apiId: apiId);
}

class _aboutScreenState extends State<aboutScreen> {
  bool _state = false;
  String apiId;
  _aboutScreenState({required this.id, required this.apiId});
  @override
  void initState() {
    getData();
    super.initState();
  }

  List _mainData = [];

  getData() async {
    http.Response res;
    List _Data = [];
    res = await http
        .get(Uri.parse("https://demo2.conscor.com/api/activity/$apiId"));
    List _res = [];
    _res.add(jsonDecode(res.body));

    _Data = _res[0]["Data"];
    for (int i = 0; i < _Data.length; i++) {
      if (_Data[i]["id"] == id) {
        _mainData.add(_Data[i]);
        break;
      }
    }
    print(_mainData);
    setState(() {
      _state = true;
    });
  }

  int id;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return _state
        ? ListView(
            children: [
              SizedBox(
                height: 100,
                width: 125,
                child: ClipRRect(
                    child: Image.network(
                  _mainData[0]["logo"],
                  height: 100,
                  width: 125,
                )),
              ),
              TextWidgetAbout(
                txt1: "Address",
                txt2: _mainData[0]["address"],
              ),
              TextWidgetAbout(
                  txt1: "Contact No", txt2: _mainData[0]["contact_number"]),
              TextWidgetAbout(txt1: "FB Page", txt2: _mainData[0]["fb"]),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12, top: 6, bottom: 20),
                child: Container(
                    width: _size.width,
                    child: ReadMoreText(
                      _mainData[0]["details"],
                      trimLines: 4,
                      textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Show More",
                      trimExpandedText: "Show Less",
                      lessStyle: style14,
                      moreStyle: style14,
                      style: style10,
                    )),
              ),
            ],
          )
        : Container();
  }
}

class TextWidgetAbout extends StatelessWidget {
  TextWidgetAbout({
    Key? key,
    required this.txt1,
    required this.txt2,
  }) : super(key: key);
  String txt2;
  String txt1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt1 + ":- ",
            style: style10,
          ),
          Flexible(
              child: Text(
            txt2,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: style10,
          )),
        ],
      ),
    );
  }
}
