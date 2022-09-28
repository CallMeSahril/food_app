import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/models/food.dart';

class Recipe extends StatefulWidget {
  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filteredFood = dummy_food.where((food) {
      return food.category.contains(argsRecipe['id']);
    }).toList();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          argsRecipe['title'],
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: filteredFood.length,
            itemBuilder: ((context, index) {
              final food = filteredFood[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail_food', arguments: {
                    'title': food.title,
                    'ingredients': food.ingredients,
                    'image' : food.imageUrl,
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(food.imageUrl),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      ' ${food.duration} mins',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFav = !isFav;
                                      food.isFavorite = isFav;
                                    });
                                  },
                                  icon: Icon(
                                    food.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
