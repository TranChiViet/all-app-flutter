import 'dart:convert';


import 'package:http/http.dart' as http;

import '../models/food.dart';

abstract class SearchRepository {
  Future<List<Recipe>> searchFoods(String query);
}

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<List<Recipe>> searchFoods(String query) async {
    var url =
      Uri.parse('https://forkify-api.herokuapp.com/api/search?q=$query');
      var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Recipe> recipes = Food.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}
