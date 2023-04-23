import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/food.dart';
import '../screens/food_detail.dart';

Widget buildHintsList(List<Recipe> recipes) {
  return Container(
    child: ListView.builder(
        itemCount: recipes.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FoodDetail(recipes: recipes[index])));
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 90,
                        width: 100,
                        child: Image.network(recipes[index].imageUrl)),
                    // SizedBox(height: 30),
                    Text(recipes[index].title),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
