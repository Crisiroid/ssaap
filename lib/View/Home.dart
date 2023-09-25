// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ssaap/Model/RecipeCategory.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Category>> Categories;

  @override
  void initState() {
    super.initState();
    Categories = AllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SsAaP")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              FutureBuilder(
                future: Categories,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Set horizontal scroll
                      child: Row(
                        children: <Widget>[
                          for (var category in snapshot.data!)
                            Container(
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                ),
                              ], color: Colors.white),
                              width: 100,
                              height: 150,
                              margin: EdgeInsets.all(3),
                              padding: EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  Image.network(category.thumb),
                                  SizedBox(height: 8),
                                  Text(category.name),
                                ],
                              ),
                            )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
