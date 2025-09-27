import 'package:dio/dio.dart';
import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/core/shared_pref_helper/shared_pref_helper.dart';
import 'package:shop_app/features/auth/data/repositories/auth/data_sources/auth_remote_data_source.dart';
import 'package:shop_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:shop_app/features/network/model/request/login_request/login_request.dart';
import 'package:shop_app/features/network/model/request/register_request/register_request.dart';
import 'package:shop_app/features/network/model/response/token_request/token_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository) /// وهنا نفس الكلام بتاع authRemoteDataSourceImpl اهم حاجة انا مستخدم Injectable الي هيا بال I كدا عشان  دية انا عملتها عشان اقولوا لو طلبت abstract class دا   (as: AuthRepository) دا ابعتلي child ال (AuthRepositoryImpl) بتاعوا زي ال news كدا لما عملتها في get it فايل بالظبط  بس هنا بقا هايعملها لوحدوا generated

class AuthRepositoryImpl extends AuthRepository {
  /// دا مهمتوا انو يحمل الداتا  هانخلي عندوا الداتا الي هيا api ونبعتها لل view new model طب ولية انا عملت كدا عشان اعرف ال الحاجة  online الي هوا ال remote
  final AuthRemoteDataSource _remoteDataSource;
  final SharedPrefsHelper _prefsHelper ;

  AuthRepositoryImpl(this._remoteDataSource, this._prefsHelper);

  @override


  Future<ApiResult<void>> login(LoginRequest loginRequest) async { /// انا هنا بندة ال api بتاع ال  login وال retrofit package هاتكمل بقا ودية حلاوتها لانها عاملة genetrated لوحدها من عن طرق تكتب في ال terminal dart pub run build_runner build بس كدا وهيا تعمل api login هتلاقية معمول عندها في الفايل بتاعها
    try {
      ApiResult<TokenResponse> apiResult = await _remoteDataSource.login(loginRequest);

      if (apiResult is SuccessApiResult<TokenResponse>) {
        // TODO: save token and user response in shared preferences
        _prefsHelper.saveUser(apiResult.getData.user); /// كدا بقولوا خزن ال user لما يعمل login
        _prefsHelper.saveToken(apiResult.getData.token); /// كدا بقولوا خزن ال token لما يعمل login
        return SuccessApiResult(null); /// هنا لو success مترجعش token response جطوا ب null
      } else if (apiResult is ErrorApiResult<TokenResponse>) {
        /// دية عشان نهندل الايرور ويطلع بطريقة حلوة
        final errorMsg = apiResult.errors.message.isNotEmpty == true
            ? apiResult.errors.message
            : "Something went wrong, try again."; /// دية عشان نهندل الايرور ويطلع بطريقة حلوة
        return ErrorApiResult(ServerError(errorMsg));
      } else {
        return apiResult;
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data['message'] ?? "Server error, try again."; /// دية عشان نهندل الايرور ويطلع بطريقة حلوة
      return ErrorApiResult(ServerError(errorMsg));
    } catch (e) {
      return ErrorApiResult(ServerError("Oops! Something went wrong.")); /// دية عشان نهندل الايرور ويطلع بطريقة حلوة
    }
  }


  @override

  Future<ApiResult<void>> register(RegisterRequest request) async {  /// انا هنا بندة ال api بتاع ال  login وال retrofit package هاتكمل بقا ودية حلاوتها لانها عاملة genetrated لوحدها من عن طرق تكتب في ال terminal dart pub run build_runner build بس كدا وهيا تعمل api login هتلاقية معمول عندها في الفايل بتاعها\
    try {
      ApiResult<TokenResponse> apiResult = await _remoteDataSource.register(request);

      if (apiResult is SuccessApiResult<TokenResponse>) { /// هنا لو success مترجعش token response جطوا ب null
        // TODO: save token and user response in shared preferences
        _prefsHelper.saveUser(apiResult.getData.user); /// كدا بقولوا خزن ال user لما يعمل register
        _prefsHelper.saveToken(apiResult.getData.token); /// كدا بقولوا خزن ال token لما يعمل register
        return SuccessApiResult(null);
      } else if (apiResult is ErrorApiResult<TokenResponse>) {
        final errorMsg = apiResult.errors.message.isNotEmpty == true
            ? apiResult.errors.message
            : "Something went wrong, try again.";  /// دية عشان نهندل الايرور ويطلع بطريقة حلوة في حالة لو النت فصل مثلا طب لو مش فاصل واكاتب حاجة غلط يظهرللك incorrectPasswordOrEmail
        return ErrorApiResult(ServerError(errorMsg));
      } else {
        return apiResult;
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data['message'] ?? "Server error, try again.";/// دية عشان نهندل الايرور ويطلع بطريقة حلوة في حالة لو النت فصل مثلا طب لو مش فاصل واكاتب حاجة غلط يظهرللك Fail
      return ErrorApiResult(ServerError(errorMsg));
    } catch (e) {
      return ErrorApiResult(ServerError("Oops! Something went wrong.")); /// دية عشان نهندل الايرور ويطلع بطريقة حلوة
    }
   }
}