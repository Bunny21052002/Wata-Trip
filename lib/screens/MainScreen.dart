import 'package:flutter/material.dart';
import 'package:wata_trip/screens/HomeScreen.dart';

import 'package:wata_trip/screens/ProfileScreen.dart';
import 'package:wata_trip/screens/activityScreen.dart';

import 'package:wata_trip/screens/calendarScreen.dart';
import 'package:wata_trip/screens/tourDetails.dart';

import 'ChatsScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key, required this.index, required this.apiId, required this.id});
  int index;
  String apiId;
  int id;
  @override
  State<MainScreen> createState() =>
      _MainScreenState(index: index, apiId: apiId, id: id);
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState(
      {required this.index, required this.apiId, required this.id});
  String apiId;
  int index;
  int id;

  bool _icn1 = true, _icn2 = false, _icn3 = false, _icn4 = false;
  @override
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = homeScreen();
  @override
  Widget build(BuildContext context) {
    List Screens = [
      homeScreen(),
      CalendarScreen(),
      Chats(),
      profileScreen(),
      activityScreen(
        apiId: apiId,
      ),
      tourDetails(apiId: apiId,id:id),
    ];
    print(index);
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: index > 3
          ? Screens[index]
          : PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: _screenSize.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _screenSize.width * 0.4,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            index = 0;

                            _icn1 = true;
                            _icn2 = false;
                            _icn3 = false;
                            _icn4 = false;
                            currentScreen = homeScreen();
                            Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(id:0,index: 0,apiId: "0",)),
        (Route<dynamic> route) => false);
                          });
                        },
                        icon: Icon(
                          Icons.home_outlined,
                          color: _icn1 ? Color(0xFF0F5862) : Color(0xFFAEAEAE),
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            index = 0;
                            _icn2 = true;
                            _icn1 = false;
                            _icn3 = false;
                            _icn4 = false;

                            currentScreen = CalendarScreen();
                          });
                        },
                        icon: Icon(Icons.calendar_month,
                            color:
                                _icn2 ? Color(0xFF0F5862) : Color(0xFFAEAEAE))),
                  ],
                ),
              ),
              Container(
                width: _screenSize.width * 0.4,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            index = 0;

                            _icn3 = true;
                            _icn2 = false;
                            _icn1 = false;
                            _icn4 = false;
                            currentScreen = Chats();
                          });
                        },
                        icon: Icon(Icons.chat,
                            color:
                                _icn3 ? Color(0xFF0F5862) : Color(0xFFAEAEAE))),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            index = 0;

                            _icn1 = false;
                            _icn4 = true;
                            _icn3 = false;
                            _icn2 = false;
                            currentScreen = profileScreen();
                          });
                        },
                        icon: Icon(Icons.person_rounded,
                            color:
                                _icn4 ? Color(0xFF0F5862) : Color(0xFFAEAEAE))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
    );
  }
}
