import 'dart:convert';

import 'package:http/http.dart' as http;

class Category {
  final int id;
  final String name;
  final String thumb;
  final String description;

  const Category({
    required this.id,
    required this.name,
    required this.thumb,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['idCategory'],
      name: json['strCategory'],
      thumb: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}

Future<List<Category>> AllCategories() async {
  List<Category> list = [];
  var res = await http
      .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));

  if (res.statusCode == 200) {
    for (int i = 0; i <= 13; i++) {
      list.add(Category.fromJson(jsonDecode(res.body)));
    }
  } else {
    throw Exception(res.body);
  }

  return list;
}
