import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/categories_tab_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/ui/login/view/register.dart';

abstract class Routes {
  static const String navigationRoute = "/navigation"; /// دا بيستخدم ب genetrate Route دا ازاي بفايل تاني بتيعتلوا argument بتسمي settings

  static const String loginRoute = '/login'; /// دا بيستخدم ب genetrate Route دا ازاي بفايل تاني بتيعتلوا argument بتسمي settings

  static Route get register { /// دا عادي بتنادي عليها في ال home وفي ال navigator.push عادي
    return MaterialPageRoute(builder: (_) => Register());
  }
  static const String categoryProductsRoutes = '/category_products';  /// دا بيستخدم ب genetrate Route دا ازاي بفايل تاني بتيعتلوا argument بتسمي settings

  static const String cartRoute = "/cart";

  static Route get categoryTab{
    return MaterialPageRoute(builder: (_) => CategoriesTabView());
  }
}
