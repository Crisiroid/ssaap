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
    // TODO: implement initState
    super.initState();
    Categories = AllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SsAaP")),
      body: Center(
        child: FutureBuilder(
          future: Categories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("data");
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
