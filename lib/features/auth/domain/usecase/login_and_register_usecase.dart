import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:shop_app/features/network/model/request/login_request/login_request.dart';
import 'package:shop_app/features/network/model/request/register_request/register_request.dart';
import 'package:injectable/injectable.dart';

@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news
class LoginUseCse{
 final AuthRepository _authRepository ;  ///  دا عشان احمل الداتا الي هيا فيها بقا login  الانا هاستخدمها  بس وعرفتلوا ال AuthRepository بتاعة ال domain ودا سبب اني بحط ال AuthRepository في ال domain عشان ال useCase

  LoginUseCse(this._authRepository);

  Future<ApiResult<void>> call(LoginRequest loginRequest)=>
      _authRepository.login(loginRequest);
}

@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news
class RegisterUseCase{
 final AuthRepository _authRepository ;  ///  دا عشان احمل الداتا الي هيا فيها بقا register  الانا هاستخدمها  بس وعرفتلوا ال AuthRepository بتاعة ال domain ودا سبب اني بحط ال AuthRepository في ال domain عشان ال useCase

 RegisterUseCase(this._authRepository);

 Future<ApiResult<void>> call(RegisterRequest request)=>
     _authRepository.register(request);
}