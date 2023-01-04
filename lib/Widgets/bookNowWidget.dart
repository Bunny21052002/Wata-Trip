import 'package:flutter/material.dart';

class bookNow extends StatefulWidget {
  const bookNow({super.key});

  @override
  State<bookNow> createState() => _bookNowState();
}

class _bookNowState extends State<bookNow> {
  DateTime _sdt = DateTime.now();
  final DateTime _edt = DateTime.now().add(Duration(days: 1));
  DateTimeRange dateRange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 1)));

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );
  }
}
