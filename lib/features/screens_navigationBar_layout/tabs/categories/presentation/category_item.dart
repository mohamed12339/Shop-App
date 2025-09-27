import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onItemClick;

  const CategoryItem(
      this.title,
      this.isSelected,
      this.onItemClick, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Material( 
      color: isSelected ? AppColors.white : AppColors.white,
      child: InkWell(
        onTap: () => onItemClick(),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Visibility(
                visible: isSelected,
                child: Container(
                  width: 8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
