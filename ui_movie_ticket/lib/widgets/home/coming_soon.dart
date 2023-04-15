import 'package:flutter/material.dart';
import 'package:ui_movie_ticket/screens/select_cinema.dart';

import '../../model/movie.dart';


class ComingSoon extends StatelessWidget {
  const ComingSoon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: movies
            .map((e) => Builder(builder: (context) {
                  return Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectCinemaScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(e.posterImg),
                    ),
                  ));
                }))
            .toList(),
      ),
    );
  }
}
