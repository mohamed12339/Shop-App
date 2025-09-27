import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/network/model/response/token_request/token_response.dart';
import '../../../../../network/model/request/login_request/login_request.dart';
import '../../../../../network/model/request/register_request/register_request.dart';

abstract class AuthRemoteDataSource{ /// دا الداتا الاونلاين دا هوا ال abstract الي مش هابعت فية الحاجة ال impl هوا الي هايبعت الحاجة
  Future<ApiResult<TokenResponse>>login(LoginRequest loginRequest); /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو tokenResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك
  Future<ApiResult<TokenResponse>> register(RegisterRequest request); /// نفس الكلام هنا
}