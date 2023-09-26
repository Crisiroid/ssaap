import 'package:flutter/material.dart';
import 'package:ssaap/Model/Food.dart';
import 'package:ssaap/View/ShowRecipe.dart';

class FoodCategory extends StatefulWidget {
  final String name;
  const FoodCategory({super.key, required this.name});

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  late Future<List<Food>> allFoods;
  List<Food> foodList = [];

  @override
  void initState() {
    super.initState();
    allFoods = AllFoods(this.widget.name);
    allFoods.then((foods) {
      setState(() {
        foodList = foods;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: foodList.length,
        itemBuilder: (BuildContext ctx, int index) {
          return FoodItemWidget(food: foodList[index]);
        },
      ),
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  final Food food;

  FoodItemWidget({required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowRecipe(name: food.idMeal)));
      },
      child: SizedBox(
        height: 100,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    food.strMealThumb,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      food.strMeal,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set the text color here
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
