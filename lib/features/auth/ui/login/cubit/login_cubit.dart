import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/auth/ui/login/cubit/login_state.dart';
import 'package:shop_app/features/network/model/request/login_request/login_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecase/login_and_register_usecase.dart';

@injectable   ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news
class LoginCubit extends Cubit<LoginState>{ /// هنا بقا ال cubit خد ال state بتاعتوا الانا عاملها تمم وفية شرح لل cubit في الكشكول

  final LoginUseCse _loginUseCse; /// مين ال هيكلم ال api بتاع ال login ال useCase

  LoginCubit(this._loginUseCse):super(LoginState.initial()); /// الي هاكتبوا في ال super عشان اعرفوا Cubit هيعمل اية بس

  Future<void> login(String email , String password)async{
    var request = LoginRequest(email: email, password: password);

    emit(LoginState(loginApi: LoadingApiResult())); /// ال emit هنا زي ال notifyListeners وال setstate بالظبط الفرق انتا بس عرفتوا الحاجة جواة ال emit يعني لو كتبت في ال cubit <> هنا كتبت int تبعت ارقام انما هنا انا باعت newState فا تبعت الحاجة علي لو كانت ال loading   or  errorMassege كدا بقا وهكزا في الباقي

    ApiResult<void> response = await _loginUseCse(request); /// عشان كدا عملتها call ممكن انادي عليها كدا مش زي ال excute بتاعة ال news بس دية حاجة في dart يعني
    // _loginUseCse.call(request);
    emit(LoginState(loginApi: response)); /// ايا كان هوا success ولا erorr هاحطوا في ال state بردوا فا تمم كدا احسن علي طول
  }
}
