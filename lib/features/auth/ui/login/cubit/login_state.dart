import 'package:shop_app/core/api_result/api_result.dart';

class LoginState{ /// يبقا ال دا كدا ال state بتاع ال cubit ودية هبعتها في ال loginCubit
  late ApiResult<void> loginApi; /// انا كنت في ال news عملت variables isloading and source كدا لا انا هنا انا اصلا لميتهم في ال ApiResult بس

  LoginState.initial(){  /// دا  البداية بتاعتي ودا  الي هاكتبوا في ال super عشان اعرفوا ApiResult هيعمل اية بس
    loginApi = InitialApiResult();  /// هيا دية الانا عملتها في ال apiResult فايل اصلا عشان استخمها هنا وفي ال cubit بقا
  }

  LoginState({required this.loginApi});
}