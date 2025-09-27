import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/utils/dialog_utills.dart';
import 'package:shop_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:shop_app/features/cart/presentation/cart_cubit/cart_state.dart';
import 'package:shop_app/features/cart/presentation/screen/cart_screen.dart';
import 'package:shop_app/features/products/ui/category_products/screens/category_products.dart';
import 'package:shop_app/features/products/ui/category_products/screens/category_products_args.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/ui/login/view/login.dart';
import '../../features/screens_navigationBar_layout/navigation_view.dart';



abstract class AppRouter {   /// هنا بستخدم ال generate Routes دا زي كلمىة ال routes{} الي كنت بكتبها في material App بس طب فايدتوا اية ان بيديني اوبشن ان انفز لوجيك معين قبل ما اكريت ال سكرين هيا عبارة عن فانكشن بترجع route يعني بدل ما اكنت برص الحاجة في ال route{} هنا لا هوا هتكتب generateRoute وهيا هتعمل forloop لوحدها علي السكرينات

  static Route generateRoute(RouteSettings settings) { /// هيا بقا بتستخدم routes وبتاخد منك routesettings دية زي ال argument الي بتكتبها يعني معهناة الي هاتعرف من خلالة انتا عايز اني سكرين
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    final uri = Uri.parse(settings.name ?? '/'); /// ودا uri  بيعرف اني سكرين اقدر افتحها
    Widget currentScreen;
    switch (uri.path) {
      case Routes.navigationRoute:
        currentScreen = const NavigationView();
      case Routes.loginRoute:
        currentScreen = Login();
      case Routes.categoryProductsRoutes: /// هنا الحلو بقا في الموضوع ان بدل ما كنت ببعت arguments وكدا واعمل modalRoute لا انا هنا بقا ابعتها بقا الحاجة

      final args = settings.arguments as CategoryProductArgs ; ///وبدل ما كنت بكتب  في السكرنة التانية عشان اقولها ال argument بتاعتها فا كنت ببعت modalRoute.settings.مش عارف لا خلاص انا اقدر ابعتلها الحاجة هنا وخلاص
      currentScreen = CategoryProducts( /// دا كدا العادي الانا كنت بعملوا بس المرادي هنا  الفايدة اية بقا اني هابعت بقا هنا ال arguments ال هيا هتبقا ال category وال selectedCategory
        categoryId: args.categoryId,
        subCategoryId: args.subCategoryId,
      );
      case Routes.cartRoute:
        currentScreen = const CartScreen();
      default:
        currentScreen = const Scaffold(
          body: Center(child: Text('404 - Page Not Found')),
        );
    }
    return MaterialPageRoute(
      builder: (_) => BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state.cartApiState.isLoading) { /// يعني هنا بقولوا اظهر ال loading لما تدوس علي زائد او ناقص كدا في كل ال carts كلها
            showLoading(context);
          } else {
            hideLoading(context);
          }
        },
        child: currentScreen,
      ),
    );
  }
}
