import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';

class ChoosePage extends StatefulWidget {
  // static var Page;

  // const ChoosePage({Key? key}) : super(key: key);

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
   final List<String> pages = [
    'Tất cả',
    'Các trang sản phẩm',
    'Các gian hàng',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: CustomDropdownButton2(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
          size: 25,
        ),
        buttonPadding: const EdgeInsets.only(left: 10, right: 5),
        buttonHeight: 40,
        buttonWidth: 170,
        dropdownWidth: 170,
        hint: 'Select Item',
        dropdownItems: pages,
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
      ),
    );
  }
}
