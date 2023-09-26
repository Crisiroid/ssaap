import 'dart:convert';

import 'package:http/http.dart' as http;

class Food {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  const Food({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}

Future<List<Food>> AllFoods(String name) async {
  final List<Food> list = [];
  final res = await http.get(Uri.parse(
      "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + name));

  if (res.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(res.body);
    final foods = data['meals'];
    for (final foodData in foods) {
      list.add(Food.fromJson(foodData));
    }
  } else {
    throw Exception(res.body);
  }
  return list;
}
