

import 'package:flutter/material.dart';

class Maker extends StatefulWidget {
  const Maker({super.key});

  @override
  State<Maker> createState() => _MakerState();
}

class _MakerState extends State<Maker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: Colors.red,
          height: 400,
        )),
    );
  }
}

class CustomClipPath extends CustomClipper<Path>{
  @override
  getClip(Size size){
     double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, 30);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 30);
    path.close();

    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}