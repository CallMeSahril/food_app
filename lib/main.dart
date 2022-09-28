import 'package:flutter/material.dart';
import 'package:food_app/catagory_screen.dart';
import 'package:food_app/detail_food.dart';
import 'package:food_app/recipe.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/recipe': (context) => Recipe(),
        '/detail_food': (context) => DetailFood()
      },
    );
  }
}
