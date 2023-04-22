import 'package:bloc_coffee/config/config_export.dart';
import 'package:bloc_coffee/widgets/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../bloc/item_bloc.dart';
import '../models/item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Cart',
            style: TxtStyle().txt_20_white,
          ),
          Expanded(
            flex: 5,
            child: BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                List<Item> listItems = state.cartItems;
                return ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    Item item = listItems[index];
                    return ItemCart(item: item);
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 4,

            // color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomDottedDivider(),
                  _buildCoupon(),
                  Column(
                    children: [
                      buildPrice('Delivery Charges', 49),
                      buildPrice('Taxes', 64.87),
                    ],
                  ),
                  const CustomDottedDivider(),
                  buildTotal(),
                  buildButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildCoupon() {
    return Stack(
      children: [
        Container(
          height: 50,
          color: ColorApp.brown,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Apply Coupon Code',
                style: TxtStyle().txt_16_cfMilk,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 20,
              )
            ],
          ),
        ),
        const Positioned(
            left: -8,
            top: 15,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: ColorApp.darkBackground,
            )),
        const Positioned(
            right: -8,
            top: 15,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: ColorApp.darkBackground,
            )),
      ],
    );
  }

  ElevatedButton buildButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.cfMilk,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: () {},
        child: Text(
          'PAY NOW',
          style: TxtStyle().txt_16_blckThird,
        ));
  }

  Widget buildTotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Grand Total',
            style: TxtStyle().txt_20_white,
          ),
          Text(
            '₹ 1009.87',
            style: TxtStyle().txt_20_white,
          ),
        ],
      ),
    );
  }

  Widget buildPrice(String title, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TxtStyle().txt_14_white,
          ),
          Text(
            '₹ ${price.toString()}',
            style: TxtStyle().txt_14_white,
          ),
        ],
      ),
    );
  }
}

class CustomDottedDivider extends StatelessWidget {
  const CustomDottedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
          children: List.generate(400 ~/ 10, (index) {
        return Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.transparent : Colors.grey,
            height: 1.5,
          ),
        );
      })),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double r = 24;
    Paint paint0 = Paint()
      ..color = ColorApp.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, h);

    path0.lineTo(w, h);

    path0.lineTo(w, 0);

    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
