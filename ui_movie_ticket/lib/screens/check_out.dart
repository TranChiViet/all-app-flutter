import 'package:flutter/material.dart';
import 'package:ui_movie_ticket/widgets/common/export.dart';

import '../config/config_export.dart';
import '../constants/constants_export.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(title: 'CheckOut\nMovie'),
            Container(
              height: size.height*0.9,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: DarkTheme.white, width: 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width / 2.5,
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetPath.posterRalphx2,
                            scale: 1.2,
                          ),
                        ),
                        const MovieInfo(),
                      ],
                    ),
                  ),
                  _buildPriceTag('ID Order', '2323791'),
                  _buildPriceTag('Cinema', 'FX Sudirman XXI'),
                  _buildPriceTag('Date & Time', 'Sun May 22, 16:40'),
                  _buildPriceTag('Seat Number', 'D7, D8, D9'),
                  _buildPriceTag('Price', '50.000 VND x 3'),
                  _buildPriceTag('Total', '150.000 VND'),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    // padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: DarkTheme.white, width: 1))),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Your Wallet',
                            style: TxtStyle.heading4Light,
                          ),
                          Text(
                            '200.000 VND',
                            style: TxtStyle.heading3
                                .copyWith(color: DarkTheme.blueMain),
                          )
                        ]),
                  ),
                   Container(
                        height: size.height / 16,
                        width: size.width / 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: DarkTheme.blueMain,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Check Out',
                          style: TxtStyle.heading3,
                        ),
                      ),
                    
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildPriceTag(String content, String price) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            content,
            style: TxtStyle.heading4Light,
          ),
          Text(
            price,
            style: TxtStyle.heading4,
          )
        ],
      ),
    );
  }
}
