import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/config_export.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SizedBox(
        height: size.height / 15,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: size.height / 15,
                decoration: BoxDecoration(
                  color: ColorApp.black,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 12),
                      child: FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.search,
                        color: ColorApp.grey.withOpacity(0.5),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Browse your favorite coffee ...',
                          hintStyle: TxtStyle().txt_14_grey50,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
