import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class ChooseEquipment extends StatefulWidget {
  // static var Equipment;

  // const ChooseEquipment({Key? key}) : super(key: key);

  @override
  State<ChooseEquipment> createState() => _ChooseEquipmentState();
}

class _ChooseEquipmentState extends State<ChooseEquipment> {
  final List<String> equipments = [
    'Tất cả',
    'Điện thoại',
    'Máy tính',
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
        dropdownWidth:  170,
        hint: 'Select Item',
        dropdownItems: equipments,
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
