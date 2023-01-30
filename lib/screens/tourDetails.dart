import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wata_trip/Widgets/button.dart';
import 'package:wata_trip/constants/constants.dart';

import '../Widgets/NavBar.dart';

class tourDetails extends StatefulWidget {
  tourDetails({super.key, required this.apiId, required this.id});
  String apiId;
  int id;
  @override
  State<tourDetails> createState() => _tourDetailsState(apiId: apiId, id: id);
}

class _tourDetailsState extends State<tourDetails> {
  bool _state = false;
  int id;
  _tourDetailsState({required this.apiId, required this.id});
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  String apiId;

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
        print("_true");
        break;
      }
    }

    setState(() {
      _state = true;
    });
    changeImg();
  }

  changeImg() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      if (_imgNo != 5) {
        _imgNo += 1;
      } else {
        _imgNo = 1;
      }
    });
    changeImg();
  }

  int _imgNo = 1;
  @override
  Widget build(BuildContext context) {
    print(id);
    Size _size = MediaQuery.of(context).size;

    return _state
        ? SafeArea(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    width: _size.width * 0.9,
                    child: Flexible(
                        child: Text(
                      _mainData[0]["name"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: style8,
                    ))),
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      _mainData[0]["image$_imgNo"],
                      height: _size.height * 0.25,
                      width: _size.width * 0.8,
                      fit: BoxFit.fill,
                    )),
              ),
              navBar(
                size: _size,
                id: id,
                apiId: apiId,
                aid: _mainData[0]["id"].toString(),
              ),
            ],
          ))
        : Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
  }
}
