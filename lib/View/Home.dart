// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ssaap/Model/RecipeCategory.dart';
import 'package:ssaap/View/Decoration/IngredientBox.dart';
import 'package:ssaap/View/FoodCategory.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Category>> categories;

  @override
  void initState() {
    super.initState();
    categories = AllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900], // Dark Blue background color
        title: Text(
          'SsAaP - Your Ultimate Food Recipe Solution!',
          style: TextStyle(
            fontSize: 24,
            color: Colors.grey[300], // Text color
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.blue[900],
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Choose Your Favorite Ingredient",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CategoryByIngredient(
                          name: "Chicken",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FoodCategory(name: "i=Chicken")));
                          },
                          color: Colors.white,
                          imageUrl:
                              "https://www.themealdb.com/images/category/chicken.png",
                        ),
                        SizedBox(width: 10),
                        CategoryByIngredient(
                          name: "Beef",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FoodCategory(name: "i=Beef")));
                          },
                          color: Colors.white,
                          imageUrl:
                              "https://www.themealdb.com/images/category/beef.png",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CategoryByIngredient(
                          name: "Salmon",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FoodCategory(name: "i=Salmon")));
                          },
                          color: Colors.white,
                          imageUrl:
                              "https://www.themealdb.com/images/category/seafood.png",
                        ),
                        SizedBox(width: 10),
                        CategoryByIngredient(
                          name: "Pork",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FoodCategory(name: "i=Pork")));
                          },
                          color: Colors.white,
                          imageUrl:
                              "https://www.themealdb.com/images/category/pork.png",
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Or choose one of the Following Categories: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder(
                future: categories,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          for (var category in snapshot.data!)
                            GestureDetector(
                              onTap: () {
                                String adr = "c=${category.name}";
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodCategory(name: adr)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 120,
                                height: 150,
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        category.thumb,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      category.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Text(
                    "Click at the Following Button to see a random Delicious Meal!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 87, 130, 194),
                      onPrimary: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: Text(
                      "Random Recipe",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
