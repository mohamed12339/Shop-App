import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/category_item.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/cubit/categories_cubit.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';

class CategoriesList extends StatefulWidget { /// دا عملتها عشان لو حصل success في السكرينة بتاعة categoriesTabView خلاص يعرض الليستة
  final List<Category> categories; /// وانا اديتوا الليتسة
  const CategoriesList({super.key, required this.categories});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoriesCubit, CategoriesState>( ///  دية consumer<تكتب اسم الحاجة الي تخليها تشتغل بس> معناها انها بتشتغل علي حاجة معينة يعني تخلي ال cubit  بتاع الشاشة  يشتغل علي حاجة في الشاشة دية ويعمل rebuild كل مرة لما تفتح الشاشة  بس وبتاخد builder ودية مع ال provider بس انما ال BlocBuilder زي ال consumer بالظبط  مع ال cubit وال bloc ولازم تبعت الحاجة الي بتقولوا عليها مع ال newviewModel اية كان بقا string او int اي كان وانا عامل احجة اسمها newsstate فيها variables بتتغير
      builder: (context , state) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                  width: 2,
                  color: AppColors.blue.withValues(alpha: 0.3),
                ),
                left: BorderSide(
                  width: 2,
                  color: AppColors.blue.withValues(alpha: 0.3),
                ),
                bottom: BorderSide(
                  width: 2,
                  color: AppColors.blue.withValues(alpha: 0.3),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            // the categories items list
            child: ClipRRect(
              // clip the corners of the container that hold the list view
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: ListView.builder(
                itemCount: widget.categories.length,
                itemBuilder: (context, index) => CategoryItem(
                  widget.categories[index].name, /// بعتلوا اسامي ليستة ال categories
                  state.selectedCategoryIndex == index, /// هنا بعتلوا ال selected index بس من ال cubit بقا
                      () { /// هنا في ال click لما تدوس علي تابة
                    var cubit = BlocProvider.of<CategoriesCubit>(context); /// دية بالظبط زي ال provider.of(context) بس دية مع bloc <> وطبعا تعرفوا ال cubit بتاعك
                    cubit.updateSelectedCategoryIndex(index); /// وهنا بقلوا اعمل updete بال index الجديد
                  },
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
