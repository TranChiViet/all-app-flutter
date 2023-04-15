import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/config_export.dart';
import '../../model/movie.dart';
import '../../screens/movie_detail.dart';
import '../common/star.dart';

class SliderBar extends StatelessWidget {
  const SliderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: movies
          .map((movie) => Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MovieDetailScreen()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.only(left: 10, bottom: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(movie.backgroundImg),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              GradientPalette.black1,
                              GradientPalette.black2,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: size.width,
                              padding:
                                  const EdgeInsets.only(bottom: 8, left: 8),
                              child: Text(
                                movie.title,
                                style: TxtStyle.heading2,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 8, bottom: 8),
                              child: Row(
                                children: const [
                                  Star(),
                                  Star(),
                                  Star(),
                                  Star(),
                                  Star(),
                                  Text(
                                    "(5.0)",
                                    style: TxtStyle.heading4,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }))
          .toList(),
      options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
    );
  }
}

