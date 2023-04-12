import 'dart:async';

import 'package:animation_loading_logo/constant/constant_export.dart';
import 'package:flutter/material.dart';

class AnimationLoadingLogo extends StatefulWidget {
  const AnimationLoadingLogo({super.key});

  @override
  State<AnimationLoadingLogo> createState() => _AnimationLoadingLogoState();
}

class _AnimationLoadingLogoState extends State<AnimationLoadingLogo> {
  final List<String> _listLogo = [
    'assets/images/image1.png',
    'assets/images/image1.png',
    'assets/images/image1.png',
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image2.png',
    'assets/images/image2.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image3.png',
    'assets/images/image3.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image4.png',
    'assets/images/image4.png',
    'assets/images/image4.png',
  ];

  PageController _pagecontroller = PageController();
  late Timer _timer;
  int _indexPage = 0;
  int itemCount = 16;
  bool _nextPage = true;
  int speed = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagecontroller = PageController(initialPage: _indexPage);

    _timer = Timer.periodic(Duration(milliseconds: speed), (timer) {
      if (_nextPage) {
        _pagecontroller.nextPage(
            duration: const Duration(microseconds: 10),
            curve: Curves.easeOutExpo);
        _indexPage == 15 ? _nextPage = false : _nextPage = true;
      } else {
        _pagecontroller.jumpToPage(_indexPage - 3);
        _indexPage == 0 ? _nextPage = true : _nextPage = false;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pagecontroller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          color: ColorApp.colorWhite,
          child: SizedBox(
            height: 100,
            width: 250,
            child: PageView.builder(
                controller: _pagecontroller,
                itemCount: itemCount,
                onPageChanged: (index) {
                  setState(() {
                    _indexPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    _listLogo[index],
                    fit: BoxFit.fill,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
