// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../config/config_export.dart';
import '../../model/movie.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              alignment: Alignment.center,
              width: size.width / 4,
              decoration: selectedIndex == index
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          GradientPalette.lightBlue1,
                          GradientPalette.lightBlue2,
                        ],
                      ),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
              child: Text(
                genres[index],
                style: TxtStyle.heading3Medium,
              ),
            ),
          );
        },
      ),
    );
  }
}
