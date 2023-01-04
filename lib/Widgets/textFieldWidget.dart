import 'package:flutter/material.dart';

class textFieldWidget2 extends StatelessWidget {
  textFieldWidget2(
      {super.key,
      required this.size,
      required this.type,
      required this.controller,
      required this.hideText,
      required this.readOnly,
      required this.txt});
  final Size size;
  TextInputType type;
  String txt;
  bool hideText;
  bool readOnly;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: size.height * 0.06,
      width: size.width * 0.64,
      decoration: BoxDecoration(border:readOnly ? 
           Border(
            top: BorderSide(color: Colors.black54),
            bottom: BorderSide(color: Colors.black54),
            left: BorderSide(color: Colors.black54),
            
          )
          
        : Border.all(color: Colors.black54)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          readOnly: readOnly,
          keyboardType: type,
          obscureText: hideText,
          obscuringCharacter: "*",
          decoration: InputDecoration.collapsed(
                  hintText: txt,
                ),
          controller: controller,
        ),
      ),
    );
  }
}
class textFieldWidget extends StatelessWidget {
  textFieldWidget(
      {super.key,
      required this.size,
      required this.type,
      required this.controller,
      required this.hideText,
      required this.readOnly,
      required this.txt});
  final Size size;
  TextInputType type;
  String txt;
  bool hideText;
  bool readOnly;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: size.height * 0.06,
      width: size.width * 0.85,
      decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          readOnly: readOnly,
          keyboardType: type,
          obscureText: hideText,
          obscuringCharacter: "*",
          decoration: InputDecoration.collapsed(
                  hintText: txt,
                ),
          controller: controller,
        ),
      ),
    );
  }
}
