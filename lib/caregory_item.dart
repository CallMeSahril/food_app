import 'package:flutter/material.dart';
import 'package:food_app/recipe.dart';

class CategoryItem extends StatelessWidget {
  final String id, title, images;
  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe',arguments: {
          'id' : id,
          'title' : title,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(63, 0, 0, 0),
              blurRadius: 8,
              offset: Offset(0, 5),
            ),
          ],
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            alignment: Alignment.center,
            fit: BoxFit.cover,
            image: NetworkImage(images),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.1, 0.6],
            ),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
