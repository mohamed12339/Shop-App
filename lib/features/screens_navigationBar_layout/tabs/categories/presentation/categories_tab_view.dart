import 'package:shop_app/core/di/di.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/cubit/categories_cubit.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/cubit/categories_state.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/sub_catgories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'categories_list.dart';


class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  var cubit = getIt<CategoriesCubit>(); ///  انا عملت كدا عشان اعرف getit نوع الحاجة الي هاستخدمها لازم اكتب get it كدا عشان اعرف النوع الحاجة

  @override
  void initState() { /// وهنا بقا عرفتوا ال ui اني جبت من get it كل الحاجات الي هاستخدمها والفانكشن كمان اهي بس تظهر اول لما تفتح ال screen دية  ودا ال initSTATE عشان كدا حطيتها فيها
    super.initState();
    cubit.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocBuilder<CategoriesCubit, CategoriesState>( ///  دية consumer<تكتب اسم الحاجة الي تخليها تشتغل بس> معناها انها بتشتغل علي حاجة معينة يعني تخلي ال cubit  بتاع الشاشة  يشتغل علي حاجة في الشاشة دية ويعمل rebuild كل مرة لما تفتح الشاشة  بس وبتاخد builder ودية مع ال provider بس انما ال BlocBuilder زي ال consumer بالظبط  مع ال cubit وال bloc ولازم تبعت الحاجة الي بتقولوا عليها مع ال newviewModel اية كان بقا string او int اي كان وانا عامل احجة اسمها newsstate فيها variables بتتغير

          builder: (context, state){ ///     دية BlocBuilder بتاخد  حاجة اسمها builder فيها context and state ال state دية بيعرفني الايرور والداتا لو صح طب لو مفيش داتا اصلا يعمل اية كدا

            if(state.categoriesApiState.hasData){ /// هنا لو categoriesState جابت الدااتا ارسم بقا ال Ui بتاعك وهوا ال CategoriesList دا فايل مرسوم فية ال ui
              return showCategoriesList(state.categoriesApiState.getData);

            }else if(state.categoriesApiState.hasError){  /// هنا لو categoriesState جابت ايرور اطهر الايرور بس كدا
              return Text(state.categoriesApiState.getError.message);

            }else { /// طب مفيش ايرور ولا الداتا ظهرت اصلا خلاص اظهر ال loading بس
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }

  Padding showCategoriesList(List<Category> categories) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12, vertical: 12),
      child: Row(
        children: [
          CategoriesList(categories: categories,),
          SizedBox(
            width: 16,
          ),
      BlocBuilder<CategoriesCubit, CategoriesState>( /// نفس فكرة الي فوق بس الفرق اني بقولوا بقا لما بدوس علي تابة تجيبلي ال category بتاعها بس
        builder: (context, state) {
          if(state.subCategoriesApiState.hasData){
            return SubCategoriesList(subCategories: state.subCategoriesApiState.getData,
              selectedCategory: state.categoriesApiState.getData[state.selectedCategoryIndex],);
          }else if(state.subCategoriesApiState.hasError){
            return Text(state.subCategoriesApiState.getError.message);
          }else {
            return Center(child: CircularProgressIndicator(),);
          }
        }
          ),
        ],
      ),
    );
  }
}