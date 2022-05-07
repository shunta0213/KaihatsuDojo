import 'package:flutter/material.dart';

import 'package:kaihatsudojo/const/images.dart';

class DateWidget extends StatelessWidget {
  final String year;
  final String youbi;
  final String date;

  const DateWidget({
    Key? key,
    required this.year,
    required this.youbi,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFFFFFDE7), Color(0xFFFFE0B2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            //color: Color(0xFFFFF9C4), //色
            color: Colors.black26,
            spreadRadius: 0.00005,
            blurRadius: 19,
            offset: Offset(5.9, 7.5),
          ),
        ],
      ),
      width: 282.514,
      height: 178.539,
      margin: const EdgeInsets.only(top: 35, left: 61, right: 40),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(-0.885, -0.489),
            child: Text(
              year,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: const Alignment(-1, -0.042),
            child: Text(
              date,
              style: const TextStyle(
                  fontSize: 64,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Align(
            alignment: const Alignment(-0.78, 0.405),
            child: Text(
              youbi,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Align(
            alignment: const Alignment(0.85, -0.82),
            child: Container(
              height: 29,
              width: 29,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  scale: 1,
                  image: MyImage.topPageDeco,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
