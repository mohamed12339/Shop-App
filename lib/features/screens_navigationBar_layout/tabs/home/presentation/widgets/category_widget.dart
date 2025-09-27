import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:flutter/material.dart';




class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Implement category tap action
      },
      child: Column(
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: category.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
