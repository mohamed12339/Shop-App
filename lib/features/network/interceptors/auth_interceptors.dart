import 'package:dio/dio.dart';
import 'package:shop_app/core/shared_pref_helper/shared_pref_helper.dart';

class AuthInterceptor extends Interceptor{  /// دا عشان اعرف ابعت ال token لل api كلها اوتماتيك من غير ما اعرفها في كل api مكتوب بس طب هاستخدموا فين عند dio الي فايل get it modules بس
  SharedPrefsHelper sharedPrefHelper; /// وطبعا استخدمت ال دا عشان اعرف ال token الي اتخزن بس واجيبوا منوا كمان

  AuthInterceptor(this.sharedPrefHelper);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async { /// فيى اكتر من حاجة بس عدلت في ال on request بس عشان اعرف ال header الي هيتراح لكل ال api
    options.headers["token"] = await sharedPrefHelper.getToken();
    handler.next(options);
  }
}