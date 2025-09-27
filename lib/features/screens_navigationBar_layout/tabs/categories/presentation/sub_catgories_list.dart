import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theme/app_colors.dart';
import 'package:shop_app/core/utils/app_assets.dart';
import 'package:shop_app/features/products/ui/category_products/screens/category_products_args.dart';

import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/category_card_item.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/sub_category_item.dart';
import 'package:flutter/material.dart';


class SubCategoriesList extends StatelessWidget {
  final Category selectedCategory; /// هنا بعتلوا انواع ال category عشان لما ادوس عليها
  final List<Category> subCategories; /// هنا بعتها في ليستة عشان يظهرلي ال categories كلها

  const SubCategoriesList({
    super.key,
    required this.selectedCategory,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              selectedCategory.name,
              style: TextStyle(color: AppColors.blue, fontSize: 14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem(
              selectedCategory.name,
              selectedCategory.image,

            ),
          ),
          // the grid view of the subcategories
          if (subCategories.isNotEmpty)
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: subCategories.length,
                (context, index) => SubCategoryItem(
                  subCategories[index].name,
                  AppImages.advertisement1,
                    (){ /// هنا بقا هاستخدم ال route بتاعة ال pusNamed عشان انادي علي طريقة ال routes الانا عملتها
                    Navigator.pushNamed(context, Routes.categoryProductsRoutes , arguments: CategoryProductArgs(selectedCategory.id, subCategories[index].id)); /// هنا بقا عشان ابعتلها بطريقة ال routeSettings وعشان ابعتلها category and subCategory بس هاعمل فايل عشان ابعتها واقولوا اني هابعت اي
                    }
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            )
          else
            SliverToBoxAdapter(
              child: Text(
                "No subcategories found",
                style: TextStyle(color: AppColors.darkBlue),
              ),
            ),
        ],
      ),
    );
  }

}
