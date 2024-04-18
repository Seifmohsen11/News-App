import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryName: "Business",
      image: "assets/business.webp",
    ),
    CategoryModel(
      categoryName: "Entertainment",
      image: "assets/entertaiment.avif",
    ),
    CategoryModel(
      categoryName: "Science",
      image: "assets/science.jpeg",
    ),
    CategoryModel(
      categoryName: "Technology",
      image: "assets/technology.jpeg",
    ),
    CategoryModel(
      categoryName: "Sports",
      image: "assets/bball.jpg",
    ),
    CategoryModel(
      categoryName: "Health",
      image: "assets/health.avif",
    ),
    CategoryModel(
      categoryName: "General",
      image: "assets/general.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
