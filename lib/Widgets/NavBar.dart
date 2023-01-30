import 'package:flutter/material.dart';
import 'package:wata_trip/screens/about.dart';
import 'package:wata_trip/screens/mapScreen.dart';
import 'package:wata_trip/screens/reviews.dart';

import '../constants/constants.dart';

class navBar extends StatefulWidget {
  navBar({super.key, required this.size, required this.id, required this.apiId,required this.aid});
  Size size;
  int id;
  String aid;
  String apiId;

  @override
  State<navBar> createState() => _navBarState(size: size, id: id,apiId: apiId, aid: aid);
}

class _navBarState extends State<navBar> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = aboutScreen(id: 0,apiId: "0",aid:"0" );
  _navBarState({required this.size, required this.id, required this.apiId, required this.aid});
  bool _state = false;
  int id;
  String aid;
  bool _sel1 = true;
  bool _sel2 = false;
  bool _sel3 = false;
  Size size;
  String apiId;

  @override
  Widget build(BuildContext context) {
    
    if (_state == false) {
      currentScreen = aboutScreen(
        aid: aid.toString(),
        apiId: apiId,
        id: id,
      );
      _state = true;
    }
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sel1 = true;
                    _sel3 = false;
                    _sel2 = false;
                    currentScreen = aboutScreen(
                      aid:aid ,
                      apiId: apiId,
                      id: id,
                    );
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.08,
                  width: size.width / 3,
                  decoration: _sel1
                      ? BoxDecoration(
                          border: Border(
                          bottom: BorderSide(
                              width: 3.0, color: Colors.lightBlue.shade600),
                        ))
                      : null,
                  child: Text(
                    "About",
                    style: style10,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sel3 = false;
                    _sel2 = true;
                    _sel1 = false;
                    currentScreen = mapScreen();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.08,
                  width: size.width / 3,
                  decoration: _sel2
                      ? BoxDecoration(
                          border: Border(
                          bottom: BorderSide(
                              width: 3.0, color: Colors.lightBlue.shade600),
                        ))
                      : null,
                  child: Text(
                    "Map",
                    style: style10,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sel1 = false;
                    _sel2 = false;
                    _sel3 = true;
                    currentScreen = reviews();
                  });
                },
                child: Container(
                  height: size.height * 0.08,
                  alignment: Alignment.center,
                  width: size.width / 3,
                  decoration: _sel3
                      ? BoxDecoration(
                          border: Border(
                          bottom: BorderSide(
                              width: 3.0, color: Colors.lightBlue.shade600),
                        ))
                      : null,
                  child: Text(
                    "Review",
                    style: style10,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: PageStorage(bucket: bucket, child: currentScreen)),
        ],
      ),
    );
  }
}
