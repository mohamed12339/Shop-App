import 'package:flutter/material.dart';

import 'package:shop_app/core/utils/app_assets.dart';
import 'package:shop_app/core/widgets/search_and_cart_widget.dart';

import '../../../core/theme/app_colors.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int tabIndex;
  const HomeAppbar({super.key, this.tabIndex = 0 });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // عشان ما يضيفش سهم back
      leadingWidth: 180,
      leading: Padding(
        padding: const EdgeInsets.only(left: 25), // تحكم في المسافة من الشمال
        child: Image.asset(
          AppImages.logo,
          color: AppColors.blue,
        ),
      ),
      centerTitle: false,

      bottom: tabIndex == 3
          ? PreferredSize(
        preferredSize: preferredSize,
        child: const SizedBox(),
      )
          : PreferredSize(
        preferredSize: preferredSize,
        child: const SearchAndCartWidget(),
      ),
    );
  }

  @override
  Size get preferredSize =>
      tabIndex == 3 ? const Size.fromHeight(56) : const Size.fromHeight(96);
}
