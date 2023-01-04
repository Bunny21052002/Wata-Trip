import 'package:flutter/material.dart';

import 'package:wata_trip/Widgets/Promos.dart';
import 'package:wata_trip/Widgets/connectToDiscover.dart';
import 'package:wata_trip/Widgets/currencyExchange.dart';

import 'package:wata_trip/Widgets/thingsToDo.dart';
import 'package:wata_trip/screens/activityScreen.dart';

import 'package:wata_trip/screens/tourDetails.dart';

import '../Widgets/partition.dart';

import '../Widgets/recentSearch2.dart';
import '../Widgets/weather.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ListView(
      children: [
        RecentSearch(screenSize: _size),
        Partition(screenSize: _size),
        thingsToDo(size: _size),
        Partition(screenSize: _size),
        connectToDiscover(size: _size),
        Partition(screenSize: _size),
        weather(size: _size),
        Partition(screenSize: _size),
        curExc(size: _size),
        Partition(screenSize: _size),
        promos(size: _size),
        
      ],
    );
  }
}
