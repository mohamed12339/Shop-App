import 'package:shop_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/core/routing/app_router.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theme/app_theme.dart';
import 'core/di/di.dart';
import 'core/shared_pref_helper/shared_pref_helper.dart';


void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies(); /// دا عشان نعرف الفانكشن بتاع getIt بس عشان استخدمها
  var prefHelper = getIt<SharedPrefsHelper>();   ///هنا بقولوا ان getit هاتي SharedPrefsHelper عشان اعرف هوا اتخزن ولا لا وعمل login ولا لا
  var isLoggedIn = (await prefHelper.getToken()) != null;  /// طب اعرف بقا هوا عمل login or register ازاي وللة لو انا ب get ال token ومش ب null ساعتها ال user عامل login او register
 runApp(
    BlocProvider(
      create: (_) => getIt<CartCubit>(),  /// دا كان لازم اعرف دا هنا عشان سكرينة cart  تشتغل  علي app كلو
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn ; /// دية عاملها عشان اعرف هوا عمل Login ولا لا وبردو عشان register
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shop-App",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
      theme: AppTheme.getLightThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
       initialRoute:  isLoggedIn? Routes.navigationRoute :Routes.loginRoute, /// لو عامل login خلاص ودية علي ال home طب لو مش عامل يروح علي login تاني
    );
  }
}
