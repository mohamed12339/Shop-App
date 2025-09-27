import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/auth/domain/usecase/login_and_register_usecase.dart';
import 'package:shop_app/features/auth/ui/login/cubit/register_state.dart';
import 'package:shop_app/features/network/model/request/register_request/register_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable   ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news
class RegisterCubit extends Cubit<RegisterState>{ /// هنا بقا ال cubit خد ال state بتاعتوا الانا عاملها تمم وفية شرح لل cubit في الكشكول

  final RegisterUseCase _registerUseCase; /// مين ال هيكلم ال api بتاع ال register ال useCase

  RegisterCubit(this._registerUseCase):super(RegisterState.initial()); /// الي هاكتبوا في ال super عشان اعرفوا Cubit هيعمل اية بس

  Future<void> register(String name ,String email , String password , String rePassword , String phone )async{
    var request = RegisterRequest(name: name , email: email , password: password   , rePassword: rePassword , phone: phone );
    emit(RegisterState(registerApi: LoadingApiResult())); /// ال emit هنا زي ال notifyListeners وال setstate بالظبط الفرق انتا بس عرفتوا الحاجة جواة ال emit يعني لو كتبت في ال cubit <> هنا كتبت int تبعت ارقام انما هنا انا باعت newState فا تبعت الحاجة علي لو كانت ال loading   or  errorMassege كدا بقا وهكزا في الباقي

    ApiResult<void> response = await _registerUseCase(request); /// عشان كدا عملتها call ممكن انادي عليها كدا مش زي ال excute بتاعة ال news بس دية حاجة في dart يعني
    // _registerUseCase.call(request);
    emit(RegisterState(registerApi: response)); /// ايا كان هوا success ولا erorr هاحطوا في ال state بردوا فا تمم كدا احسن علي طول
  }
}