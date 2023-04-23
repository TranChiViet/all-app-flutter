import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/food.dart';

abstract class FoodRepository {
  Future<List<Recipe>> getFoods();
}

class FoodRepositoryImpl extends FoodRepository {
  @override
  Future<List<Recipe>> getFoods() async {
    var url =
      Uri.parse('https://forkify-api.herokuapp.com/api/search?q=pizza');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<Recipe> recipes = Food.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}
