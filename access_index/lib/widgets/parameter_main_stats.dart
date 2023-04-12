import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';

class ParameterMainStats extends StatefulWidget {
  const ParameterMainStats({Key? key}) : super(key: key);

  @override
  State<ParameterMainStats> createState() => _ParameterMainStatsState();
}

const listItems = [
  ItemObject('Tổng lượt xem', Colors.blue),
  ItemObject('Tỉ lệ chuyển đổi', Colors.orange),
  ItemObject('Tổng số người xem', Colors.red),
  ItemObject('Tổng số khách hàng mua', Colors.purple),
];
List<ItemObject> selectedItems = [];

class _ParameterMainStatsState extends State<ParameterMainStats> {
  Widget buildChooseChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đang hiện ${selectedItems.length}/2',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          // margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<ItemObject>(
              isExpanded: true,
              hint: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Select Items',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              items: listItems.map((item) {
                return DropdownMenuItem<ItemObject>(
                  value: item,
                  //disable default onTap to avoid closing menu when selecting an item
                  enabled: false,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final isSelected = selectedItems.contains(item);
                      return InkWell(
                        onTap: () {
                          isSelected
                              ? selectedItems.remove(item)
                              : selectedItems.add(item);
                          //This rebuilds the StatefulWidget to update the button's text
                          setState(() {});
                          //This rebuilds the dropdownMenu Widget to update the check mark
                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  isSelected
                                      ? const Icon(Icons.check_box_outlined)
                                      : const Icon(
                                          Icons.check_box_outline_blank),
                                  const SizedBox(width: 16),
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: item.color,
                                height: 20,
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
              value: selectedItems.isEmpty ? null : selectedItems.last,
              onChanged: (value) {
                // selectedItems = value as List<ItemObject>;
                // selectedItems.join('| ');
              },
              buttonHeight: 50,
              buttonWidth: 370,
              itemHeight: 40,

              itemPadding: EdgeInsets.zero,
              selectedItemBuilder: (context) {
                return selectedItems.map(
                  (item) {
                    return Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                color: item.color,
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );

                    // ListView.builder(
                    //   itemCount: selectedItems.length,
                    //   scrollDirection: Axis.horizontal,
                    //   itemBuilder: ((context, index) {
                    //     var item = selectedItems[index];
                    //     return Row(
                    //       children: [
                    //         Container(
                    //           color: item.color,
                    //           height: 20,
                    //           width: 20,
                    //         ),
                    //         const SizedBox(width: 10),
                    //         Text(
                    //           item.title,
                    //           style: const TextStyle(
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //         Text(
                    //           (selectedItems.length > 1) ? ' | ' : '',
                    //           style: const TextStyle(
                    //             fontSize: 20,
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   }),
                    // );

                    // Container(
                    //   width: 500,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Container(
                    //           color: item.color,
                    //           height: 20,
                    //           width: 20,
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           selectedItems.,
                    //           style: const TextStyle(
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                ).toList();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildData() {
    return Column(children: [
      SizedBox(
          width: 160,
          height: 160,
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/2456/2456758.png',
            fit: BoxFit.cover,
          )),
      const Text('Không có dữ liệu. Hãy chọn thời gian báo cáo khác'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          buildChooseChart(),
          buildData(),
        ],
      ),
    );
  }
}
