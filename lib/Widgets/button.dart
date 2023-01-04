import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button3 extends StatelessWidget {
  button3(
      {super.key,
      required this.b_clr,
      required this.t_clr,
      required this.txt,
      required this.onPressed,
      required this.size});
  Color b_clr;
  Color t_clr;
  String txt;
  Size size;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: b_clr,
          ),
          alignment: Alignment.center,
          height: size.width * 0.09,
          width: size.width * 0.15,
          child: Text(
            txt,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600, fontSize: 13, color: t_clr),
          ),
        ),
      ),
    );
  }
}

class button2 extends StatelessWidget {
  button2({super.key, required this.size, required this.icn, required this.onPressed});
  Size size;
  String icn;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(2)),
        height: size.width * 0.13,
        width: size.width * 0.13,
        alignment: Alignment.center,
        child: Image.asset(
          icn,
          height: size.width * 0.1,
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  button(
      {super.key,
      required this.b_clr,
      required this.t_clr,
      required this.txt,
      required this.onPressed,
      required this.size});
  Color b_clr;
  Color t_clr;
  String txt;
  Size size;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: b_clr,
          ),
          alignment: Alignment.center,
          height: size.width * 0.13,
          width: size.width * 0.8,
          child: Text(
            txt,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600, fontSize: 20, color: t_clr),
          ),
        ),
      ),
    );
  }
}
