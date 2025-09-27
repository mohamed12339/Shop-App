import 'package:shop_app/core/di/di.dart';
import 'package:shop_app/core/widgets/custom_product_card.dart';
import 'package:shop_app/features/products/ui/cubit/category_products_cubit.dart';
import 'package:shop_app/features/products/ui/cubit/category_products_state.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';
import 'package:shop_app/features/screens_navigationBar_layout/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryId;
  final String subCategoryId;

  const CategoryProducts({
    super.key,
    required this.categoryId,
    required this.subCategoryId,
  });

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  var cubit = getIt<CategoryProductsCubit>(); ///  انا عملت كدا عشان اعرف getit نوع الحاجة الي هاستخدمها لازم اكتب get it كدا عشان اعرف النوع الحاجة

  @override
  void initState() {  /// وهنا بقا عرفتوا ال ui اني جبت من get it كل الحاجات الي هاستخدمها والفانكشن كمان اهي بس تظهر اول لما تفتح ال screen دية  ودا ال initSTATE عشان كدا حطيتها فيها
    super.initState();
    cubit.loadProducts(widget.categoryId, widget.subCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>( ///  دية consumer<تكتب اسم الحاجة الي تخليها تشتغل بس> معناها انها بتشتغل علي حاجة معينة يعني تخلي ال cubit  بتاع الشاشة  يشتغل علي حاجة في الشاشة دية ويعمل rebuild كل مرة لما تفتح الشاشة  بس وبتاخد builder ودية مع ال provider بس انما ال BlocBuilder زي ال consumer بالظبط  مع ال cubit وال bloc ولازم تبعت الحاجة الي بتقولوا عليها مع ال newviewModel اية كان بقا string او int اي كان وانا عامل احجة اسمها newsstate فيها variables بتتغير

        bloc: cubit, /// هوا هوا نفس ال changeNotiferProvider و ال blocProvider بعرفوا الحاجة الي هتشتغل بس

        builder: (context, state) {///     دية BlocBuilder بتاخد  حاجة اسمها builder فيها context and state ال state دية بيعرفني الايرور والداتا لو صح طب لو مفيش داتا اصلا يعمل اية كدا

          if (state.productsApiState.hasData) { /// هنا لو productsApiState جابت الدااتا ارسم بقا ال Ui بتاعك وهوا ال buildProductsGrid دا فانكشن مرسوم فية ال ui
            return buildProductsGrid(state.productsApiState.getData);

          } else if (state.productsApiState.hasError) {  /// هنا لو categoriesState جابت ايرور اطهر الايرور بس كدا
            return Text(state.productsApiState.getError.message);

          } else { /// طب مفيش ايرور ولا الداتا ظهرت اصلا خلاص اظهر ال loading بس
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildProductsGrid(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          return CustomProductCard(product: products[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( ///دي أهم حاجة، وهي اللي بتحدد تنسيق الاكونتات او الكروت مثلا شكل الأعمدة جنب بعض ولا تحت بعض كدا والمسافات
            childAspectRatio: .66, /// نسبة من العرض إلى الارتفاع يعني الشكل كلو او الكونت كلو ياخد مساحة قد اية بس
            crossAxisCount: 2, /// عدد الاكونتات الي هتتحط انا عامل اتنين عشان يبقوا جنب بعض
            mainAxisSpacing: 12, /// مسافة ما بين اكونت 1 واكونت 2 مثلا المسافة الي تحتيهم ببقا ما بينهم وما بين الاكونتين التانين تمم
            crossAxisSpacing: 12 /// نسبة من العرض إلى الارتفاع يعني الشكل كلو او الكونت كلو ياخد مساحة قد اية بس
        ),
      ),
    );
  }
}