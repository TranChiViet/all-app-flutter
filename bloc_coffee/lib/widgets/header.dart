import 'package:flutter/material.dart';

import '../../config/config_export.dart';



class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 24, right: 24),
      child: SizedBox(
        height: size.height / 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'déjà', style: TxtStyle().txt_36_grey50),
                  TextSpan(text: '\nBrew', style: TxtStyle().txt_48_grey),
                ]
              )
              
            ),
            CircleAvatar(
              radius: size.height / 24,
              backgroundImage: const AssetImage(AssetPath.imageProfile),
            )
          ],
        ),
      ),
    );
  }
}
