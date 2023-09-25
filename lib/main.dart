// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ssaap/View/Home.dart';

void main() {
  runApp(ssaap());
}

class ssaap extends StatelessWidget {
  const ssaap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SSAAP - Your Ultimate Food Recipe Solution!",
      home: HomePage(),
    );
  }
}
