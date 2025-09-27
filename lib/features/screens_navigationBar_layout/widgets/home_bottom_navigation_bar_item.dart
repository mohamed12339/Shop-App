import 'package:flutter/cupertino.dart';
import 'package:shop_app/core/theme/app_colors.dart';

class HomeBottomNavigationBarItem extends BottomNavigationBarItem {
  HomeBottomNavigationBarItem({
    required IconData icon,
    required bool isSelected,
  }) : super(
         icon: AnimatedSwitcher(
           transitionBuilder:
               (child, animation) =>
                   ScaleTransition(scale: animation, child: child),
           duration: const Duration(milliseconds: 300),
           child:
               isSelected
                   ? Container(
                     padding: const EdgeInsets.all(8),
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: AppColors.white,
                     ),
                     child: Icon(icon, color: AppColors.blue),
                   )
                   : Icon(icon, color: AppColors.white),
         ),
         label: "",
       );
}
