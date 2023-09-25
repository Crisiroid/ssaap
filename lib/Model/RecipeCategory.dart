import 'dart:convert';

import 'package:http/http.dart' as http;

class Category {
  final String id;
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
      id: json['idCategory'] ?? "",
      name: json['strCategory'] ?? "",
      thumb: json['strCategoryThumb'] ?? "",
      description: json['strCategoryDescription'] ?? "",
    );
  }
}

Future<List<Category>> AllCategories() async {
  List<Category> list = [];
  var res = await http
      .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));

  if (res.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(res.body);
    final categories = data['categories'];

    for (final categoryData in categories) {
      list.add(Category.fromJson(categoryData));
    }
  } else {
    throw Exception(res.body);
  }

  return list;
}
