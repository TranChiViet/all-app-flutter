import 'package:flutter/material.dart';

class CardMainStats extends StatelessWidget {
  final String title;

  CardMainStats(this.title);

  Widget buildTextBold(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                title,
                maxLines: 2,
              )),
              Icon(Icons.error_outline),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextBold('--'),
              buildTextBold('Không có dữ liệu'),
            ],
          ),
        ],
      ),
    );
  }
}
