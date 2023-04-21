import 'package:bloc_coffee/config/config_export.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.item});
  final Item item;

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.item.image),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cappucino',
                              style: TxtStyle().txt_20_white,
                            ),
                            const Icon(
                              Icons.favorite_outline,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.item.name,
                              style: TxtStyle().txt_14_white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                Text(
                                  '4,5',
                                  style: TxtStyle().txt_14_white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Description',
                      style: TxtStyle().txt_14_white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choice of Milk',
                          style: TxtStyle().txt_20_white,
                        ),
                        SizedBox(height: 5,),
                        Container(
                            height: 40,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                               return  SizedBox(width: 5,);
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: choiceMilk.length,
                              itemBuilder: ((context, index) {
                                final milk = choiceMilk[index];
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      milk['selected'] = !milk['selected'];
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: milk['selected'] ? Colors.white : Colors.transparent,
                                        border: Border.all(
                                            width: 1.8, color: Colors.white)),
                                    child: Text(
                                      milk['name'],
                                      style: milk['selected'] ? TxtStyle().txt_14_blck : TxtStyle().txt_14_white,
                                    ),
                                  ),
                                );
                              }),
                            ))
                      ],
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'Price',
                          style: TxtStyle().txt_14_white
                        ),
                        Text(
                          '₹ 1500',
                          style: TxtStyle().txt_20_white
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorApp.cfMilk,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            'Buy Now'.toUpperCase(),
                            style: TxtStyle().txt_24_blck
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
