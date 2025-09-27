import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/network/model/request/login_request/login_request.dart';
import 'package:shop_app/features/network/model/request/register_request/register_request.dart';

abstract class AuthRepository{ /// هنا بقا دا مهمتوا اني اعرف api علي الحاجات الي هاستخدمها  وال هوا model  بس بتاعة ال domain  بس هنا طبعا مفيش model لل domain دا loginAndRegister عادي
  Future<ApiResult<void>>login(LoginRequest loginRequest); /// انا عملتها apiResult عشان اعرف هل هيبقا ايرور ولا success ولا انا الانواع الانا حاططها في ال api result وهيا كدا مش هترحع حاجة مجرد void
  Future<ApiResult<void>> register(RegisterRequest request);
}