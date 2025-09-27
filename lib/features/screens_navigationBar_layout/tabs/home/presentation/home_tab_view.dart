import 'package:shop_app/core/di/di.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/home/presentation/cubit/home_tab_cubit.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/home/presentation/cubit/home_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/advertisements_list.dart';
import 'widgets/categories_list.dart';
import 'widgets/products_list.dart';
import 'widgets/section_title.dart';

class HomeTabView extends StatefulWidget {

  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  var homeCubit = getIt<HomeTabCubit>(); ///  انا عملت كدا عشان اعرف getit نوع الحاجة الي هاستخدمها لازم اكتب get it كدا عشان اعرف النوع الحاجة
  @override
  void initState() { /// وهنا بقا عرفتوا ال ui اني جبت من get it كل الحاجات الي هاستخدمها والفانكشن كمان اهي بس تظهر اول لما تفتح ال screen دية  ودا ال initSTATE عشان كدا حطيتها فيها
    super.initState();
    homeCubit.loadCategories();
    homeCubit.loadProducts();
  }
  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const AdvertisementsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SectionTitle(title: locale.categories, viewAllVisibility: true),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        // const CategoriesList(),
        SliverToBoxAdapter(  /// ولازم تحط دية عشان انتا مستخدم CustomScrollView ودية لازم معاها silvers و SliverToBoxAdapter هيا عاملة بالظبط زي listView and SingleScrollChild بتسكرول يعني بس اقوي

          child: BlocBuilder<HomeTabCubit, HomeTabState>( ///  دية consumer<تكتب اسم الحاجة الي تخليها تشتغل بس> معناها انها بتشتغل علي حاجة معينة يعني تخلي ال cubit  بتاع الشاشة  يشتغل علي حاجة في الشاشة دية ويعمل rebuild كل مرة لما تفتح الشاشة  بس وبتاخد builder ودية مع ال provider بس انما ال BlocBuilder زي ال consumer بالظبط  مع ال cubit وال bloc ولازم تبعت الحاجة الي بتقولوا عليها مع ال newviewModel اية كان بقا string او int اي كان وانا عامل احجة اسمها newsstate فيها variables بتتغير

            bloc: homeCubit, /// دية زي ال ChangeNotifierProvider بالظبط وبردوا ممكن تكتبها هنا او  تكتبها في ال maindart ويد حلاوة ال cubit انك مش لازم تمتبها في ال main dart  زي ال ChangeNotifierProvider

            builder: (context, state) {  ///     دية BlocBuilder بتاخد  حاجة اسمها builder فيها context and state ال state دية بيعرفني الايرور والداتا لو صح طب لو مفيش داتا اصلا يعمل اية كدا

              if (state.categoriesState.hasError) { /// هنا لو categoriesState جابت ايرور اطهر الايرور بس كدا
                return Text(state.categoriesState.getError.message);

              } else if (state.categoriesState.hasData) { /// هنا لو categoriesState جابت الدااتا ارسم بقا ال Ui بتاعك وهوا ال CategoriesList دا فايل مرسوم فية ال ui
                return CategoriesList(categories: state.categoriesState.getData);

              } else { /// طب مفيش ايرور ولا الداتا ظهرت اصلا خلاص اظهر ال loading بس
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SectionTitle(title: locale.homeAppliance),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        // const ProductsList(),
        SliverToBoxAdapter( /// ولازم تحط دية عشان انتا مستخدم CustomScrollView ودية لازم معاها silvers و SliverToBoxAdapter هيا عاملة بالظبط زي listView and SingleScrollChild بتسكرول يعني بس اقوي

          child: BlocBuilder<HomeTabCubit, HomeTabState>( ///  دية consumer<تكتب اسم الحاجة الي تخليها تشتغل بس> معناها انها بتشتغل علي حاجة معينة يعني تخلي ال cubit  بتاع الشاشة  يشتغل علي حاجة في الشاشة دية ويعمل rebuild كل مرة لما تفتح الشاشة  بس وبتاخد builder ودية مع ال provider بس انما ال BlocBuilder زي ال consumer بالظبط  مع ال cubit وال bloc ولازم تبعت الحاجة الي بتقولوا عليها مع ال newviewModel اية كان بقا string او int اي كان وانا عامل احجة اسمها newsstate فيها variables بتتغير

            bloc: homeCubit, ///  دية consumer<تكتب اسم الحاجة الي تخليها تشتغل بس> معناها انها بتشتغل علي حاجة معينة يعني تخلي ال cubit  بتاع الشاشة  يشتغل علي حاجة في الشاشة دية ويعمل rebuild كل مرة لما تفتح الشاشة  بس وبتاخد builder ودية مع ال provider بس انما ال BlocBuilder زي ال consumer بالظبط  مع ال cubit وال bloc ولازم تبعت الحاجة الي بتقولوا عليها مع ال newviewModel اية كان بقا string او int اي كان وانا عامل احجة اسمها newsstate فيها variables بتتغير

            builder: (context, state) {   ///     دية BlocBuilder بتاخد  حاجة اسمها builder فيها context and state ال state دية بيعرفني الايرور والداتا لو صح طب لو مفيش داتا اصلا يعمل اية كدا

              if (state.productsState.hasError) { /// هنا لو productsState جابت ايرور اطهر الايرور بس كد
                return Text(state.productsState.getError.message);

              } else if (state.productsState.hasData) { /// هنا لو productsState جابت الدااتا ارسم بقا ال Ui بتاعك وهوا ال ProductsList دا فايل مرسوم فية ال ui
                return ProductsList(products: state.productsState.getData);

              } else { /// طب مفيش ايرور ولا الداتا ظهرت اصلا خلاص اظهر ال loading بس
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
