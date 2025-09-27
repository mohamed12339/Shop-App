import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/app_colors.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final Function onItemClick;
  const SubCategoryItem(this.title, this.image, this.onItemClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
       color: AppColors.white,
      child: InkWell(
        onTap: () {
          onItemClick();
        },
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.blue, width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.blue, fontSize: 16),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}