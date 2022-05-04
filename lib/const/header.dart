import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kaihatsudojo/preparation/color.dart';

class beauty_header extends StatelessWidget {
  const beauty_header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.5, -1),
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 290,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [kLightOrangeColor, kDarkOrangeColor],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
