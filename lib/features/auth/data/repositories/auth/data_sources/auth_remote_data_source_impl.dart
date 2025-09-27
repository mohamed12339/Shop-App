import 'package:dio/dio.dart';
import 'package:shop_app/features/auth/data/repositories/auth/data_sources/auth_remote_data_source.dart';
import 'package:shop_app/features/network/api/commerce_services.dart';
import 'package:shop_app/features/network/model/request/login_request/login_request.dart';
import 'package:shop_app/features/network/model/request/register_request/register_request.dart';
import 'package:shop_app/features/network/model/response/token_request/token_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api_result/api_result.dart';

/// دا الداتا الاونلاين

@Injectable(as: AuthRemoteDataSource) /// اهم حاجة انا مستخدم Injectable الي هيا بال I كدا عشان  دية انا عملتها عشان اقولوا لو طلبت abstract class دا   (as: AuthRemoteDataSource) دا ابعتلي child ال (AuthRemoteDataSourceImpl) بتاعوا زي ال news كدا لما عملتها في get it فايل بالظبط  بس هنا بقا هايعملها لوحدوا generated

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{ /// فايدة حتة الي impl واعمل extend لل abstract class بتاعها هيا ال coupling  يعني لو حصل تغير فا انتا مثلا تغير في كلاس impl مش هايحصل حاجة لل abstract كلاس خالص ودا فايدتوا ان لو حصل تغير في ال project هنغير حاجة مثلا تروح تغيرها في ال impl2 وهيا كدا كدا هتسمع في ال abstract class و ال impl1  لانها فانكشن فاضية بس بتعملها override من عند ال impl 1 and 2 بس فا بتغير هناك بس انا مش عامل impl2 ليها بس
  final CommerceServices _apiServices ; ///انا بعتللك ال api اهو وعملتلو كونستراكتور

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ApiResult<TokenResponse>>login(LoginRequest loginRequest)async{  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو tokenResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك
    try{
      return SuccessApiResult(await _apiServices.login(loginRequest));   /// انا هنا بندة ال api بتاع ال  login وال retrofit package هاتكمل بقا ودية حلاوتها لانها عاملة genetrated لوحدها من عن طرق تكتب في ال terminal dart pub run build_runner build بس كدا وهيا تعمل api login هتلاقية معمول عندها في الفايل بتاعها وكمان رجعتها كا successApiResult
    }catch(e){
      if(e is DioException){ /// دية عشان نهندل الايرور ويطلع بطريقة حلوة في حالة لو النت فصل مثلا طب لو مش فاصل واكاتب حاجة غلط يظهرللك incorrectPasswordOrEmail
        return ErrorApiResult(ServerError(e.response?.data["message"]??"Something Went Wrong Please try Again"));
      }else{
        ///todo : handle errors
        return ErrorApiResult(ServerError("Oops! Please try Again.")); /// نفس الكلام بتاع ال success بس هرجع ايرور بس هنا
      }

    }
  }

  @override
  Future<ApiResult<TokenResponse>> register(RegisterRequest request) async {///نفس الكلام بردو بتاع سطر 19
    try {
      return SuccessApiResult(await _apiServices.register(request));/// هنا انا بردو بندة علي ال api بتاع ال register وبردو نفس الكلام بتاع سطر 21
    } catch(e){
      if(e is DioException){ /// دية عشان نهندل الايرور ويطلع بطريقة حلوة في حالة لو النت فصل مثلا طب لو مش فاصل واكاتب حاجة غلط يظهرللك Fail
        return ErrorApiResult(ServerError(e.response?.data["message"]??"Something Went Wrong Please try Again"));
      }else{
        ///todo : handle errors
        return ErrorApiResult(ServerError("Oops! Please try Again.")); /// نفس الكلام بتاع ال success بس هرجع ايرور بس هنا
      }
  }
}
}
