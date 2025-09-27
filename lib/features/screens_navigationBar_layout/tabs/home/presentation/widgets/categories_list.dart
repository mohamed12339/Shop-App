import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:flutter/material.dart';



import 'category_widget.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories ; ///  بعتلها ال categories عشان تظهر في ال UI
  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) {
          return CategoryWidget(category: categories[index]);
        },
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      ),
    );
  }
}

