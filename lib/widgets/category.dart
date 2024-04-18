import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryView(
            category: category.categoryName,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: 110,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ),
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
