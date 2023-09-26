import 'package:flutter/material.dart';
import 'package:ssaap/Model/Recipe.dart';

class ShowRecipe extends StatefulWidget {
  final String name;
  final String mode;
  const ShowRecipe({super.key, required this.name, this.mode = ""});

  @override
  State<ShowRecipe> createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {
  late Future<List<Recipe>> r;

  @override
  void initState() {
    super.initState();
    if (this.widget.mode == "") {
      r = showRecipe(this.widget.name);
    } else {
      r = randomRecipe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View recipe"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: r,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final recipe = snapshot.data![0];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Image.network(
                          recipe.strMealThumb,
                          height: 400,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.strMeal,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text("Category: ${recipe.strCategory}"),
                              SizedBox(height: 8),
                              Text("Area: ${recipe.strArea}"),
                              SizedBox(height: 8),
                              Text("Instructions:"),
                              Text(recipe.strInstructions),
                              SizedBox(height: 8),
                              Text("Ingredients:"),
                              if (recipe.strIngredient1.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure1} ${recipe.strIngredient1}"),
                              if (recipe.strIngredient2.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure2} ${recipe.strIngredient2}"),
                              if (recipe.strIngredient3.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure3} ${recipe.strIngredient3}"),
                              if (recipe.strIngredient4.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure4} ${recipe.strIngredient4}"),
                              if (recipe.strIngredient5.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure5} ${recipe.strIngredient5}"),
                              if (recipe.strIngredient6.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure6} ${recipe.strIngredient6}"),
                              if (recipe.strIngredient7.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure7} ${recipe.strIngredient7}"),
                              if (recipe.strIngredient8.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure8} ${recipe.strIngredient8}"),
                              if (recipe.strIngredient9.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure9} ${recipe.strIngredient9}"),
                              if (recipe.strIngredient10.isNotEmpty)
                                Text(
                                    "${recipe.strMeasure10} ${recipe.strIngredient10}"),
                              SizedBox(height: 8),
                              Text("Source: ${recipe.strSource}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
