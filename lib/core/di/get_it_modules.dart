import 'package:dio/dio.dart';
import 'package:shop_app/core/shared_pref_helper/shared_pref_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/network/interceptors/auth_interceptors.dart';

@module
abstract class GetItModule { /// انا هنا بردوا عشان افهم get it تعمل dio بس كدا

  Dio getDio(){
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true)); /// دا ما هوا الا حاجة توريني api ردت ولا مردتش فا بتظهر عندك في ال run تحت وكلمة interceptors هوا بيقطع يعني وانتا بتعمل رن قبل ما يطهر الحاجة بتاعة ال api هيطهرهالك تحت بس كدا
    dio.interceptors.add(AuthInterceptor(SharedPrefsHelper()));  /// وهنا عرفتها في ال dio عشان تتبعت لكل ال api بس
    return dio ;
  }
}