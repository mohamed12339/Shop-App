import 'package:shop_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/categories_tab_view.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/favorite/presentation/screen/favorite_tab_view.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/home/presentation/home_tab_view.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/profile/profile_tab_view.dart';
import 'package:shop_app/features/screens_navigationBar_layout/widgets/home_appbar.dart';
import 'package:shop_app/features/screens_navigationBar_layout/widgets/home_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shop_app/core/theme/app_colors.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  ValueNotifier<int> index = ValueNotifier(0);

  List<Widget> pages = [
    const HomeTabView(),
    const CategoriesTabView(),
    const FavoriteTabView(),
    const ProfileTabView(),
  ];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).loadCart();
  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder:
          (context, value, child) => Scaffold(
            appBar: HomeAppbar(tabIndex: index.value),
            body: pages[value],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.blue,
                type: BottomNavigationBarType.fixed,
                onTap: changeSelectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.home_outline,
                    isSelected: value == 0,
                  ),
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.category_outline,
                    isSelected: value == 1,
                  ),
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.heart_outline,
                    isSelected: value == 2,
                  ),
                  HomeBottomNavigationBarItem(
                    icon: Iconsax.user_outline,
                    isSelected: value == 3,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void changeSelectedIndex(int value) {
    if (value == index.value) return;
    index.value = value;
  }
}
