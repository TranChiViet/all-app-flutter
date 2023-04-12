
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseDate extends StatefulWidget {

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  // final dates = [
  //   'Hôm nay',
  //   'Hôm qua',
  //   '7 ngày qua',
  //   '30 ngày qua',
  // ];

  // String? selectedValue;
  // int? groupValue;

  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickDate;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      // height: 70,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              _selectedDate == null
                  ? 'Choose Date'
                  : '${DateFormat('dd/MM/yyyy').format(_selectedDate!)} - ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
            ),
          ),
          IconButton(
            icon: Icon(Icons.date_range),
            onPressed: _presentDatePicker,
            
          ),
        ],
      ),
    );

    // return Container(
    //   margin: const EdgeInsets.all(5),
    //   child: DropdownButtonHideUnderline(
    //     child: DropdownButton2(
    //       hint: Text(
    //         'Select Item',
    //         style: TextStyle(
    //           fontSize: 14,
    //           color: Theme.of(context).hintColor,
    //         ),
    //       ),
    //       items: dates
    //           .map(
    //             (item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Row(
    //                 children: [
    //                   Radio(
    //                       value: item,
    //                       groupValue: groupValue,
    //                       onChanged: (value) {
    //                         setState(() {
    //                           groupValue = int.parse(value.toString());
    //                         });
    //                       }),
    //                   Text(
    //                     item,
    //                     style: const TextStyle(
    //                       fontSize: 14,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           )
    //           .toList(),
    //       value: selectedValue,
    //       onChanged: (value) {
    //         setState(() {
    //           selectedValue = value as String;
    //         });
    //       },
    //       buttonHeight: 40,
    //       buttonWidth: 370,
    //       itemHeight: 40,
    //     ),
    //   ),
    // );
  }
}
