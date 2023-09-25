import 'package:flutter/material.dart';

class CategoryByIngredient extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final String imageUrl;
  final Color color;
  const CategoryByIngredient(
      {super.key,
      required this.name,
      required this.onTap,
      required this.color,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
        child: Column(children: [Image.network(imageUrl), Text(name)]),
      ),
    );
  }
}
