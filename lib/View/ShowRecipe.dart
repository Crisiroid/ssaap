import 'package:flutter/material.dart';
import 'package:ssaap/Model/Recipe.dart';

class ShowRecipe extends StatefulWidget {
  final String name;
  const ShowRecipe({super.key, required this.name});

  @override
  State<ShowRecipe> createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {
  late Future<Recipe> r;

  @override
  void initState() {
    super.initState();
    r = showRecipe(this.widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View recipe"),
      ),
      body: SingleChildScrollView(),
    );
  }
}
