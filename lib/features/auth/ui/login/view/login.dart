import 'package:shop_app/core/di/di.dart';
import 'package:shop_app/features/auth/ui/login/cubit/login_cubit.dart';
import 'package:shop_app/features/auth/ui/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/core/theme/app_colors.dart';
import 'package:shop_app/core/utils/app_assets.dart';
import 'package:shop_app/core/utils/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/dialog_utills.dart';
import '../../widgets/auth_textfield.dart';



class Login extends StatefulWidget {
 const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginCubit viewModel = getIt(); /// هنا عرفت ال login cubit عشان استخدمها في ال ui بقا ب bloc listener او blocbuilder وطبعا ايد مننساش blocprovider زي ال changenotifer وكدا getit هيا هتجبلي الحاجة بس طبعا generated المرادي
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();   /// دا مهم جدا دا الي بتسخدموا مع ال validation بتاع ال  textFromField وعشان يظهرللك الحاجة الحمرة دية الي بيقولك باسورد المفروض يتكتب كدا وهكزا

  @override
  Widget build(BuildContext context) {
    return BlocProvider( /// دية زي ال ChangeNotifierProvider بالظبط وبردوا ممكن تكتبها هنا او  تكتبها في ال maindart ويد حلاوة ال cubit انك مش لازم تمتبها في ال main dart  زي ال ChangeNotifierProvider
      create: (_)=> viewModel,
      child: BlocListener<LoginCubit , LoginState>( /// هنا دية زي consumer وال blocbuilder بس الفرق انا دية بتعمل listen علي حاجة معينة مش زي ال blocbuilder بتعمل rebuild علي طول
        listener: (context , state){
          if(state.loginApi.hasData){
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.navigationRoute);
          }else if(state.loginApi.hasError){
            Navigator.pop(context);
            showMessage(context , title: "Error"  , message: state.loginApi.getError.message , posButtonTitle: "ok" );
          }else if (state.loginApi.isLoading){
            showLoading(context);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.blue,
          body: Form( /// اهو دا بتاع ال validation
            key: formKey, /// وانو يكون معايا variable اسمو formkey هوا دا الي هيا check
            autovalidateMode: AutovalidateMode.always, /// دية لو عايز وانتا بتكتب يقعد يقول الصح وانتا بتكتب الايميل والباسورد في غير always حاجات كتير وانتا اختار
            child: SafeArea(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40),
                      Image.asset(AppImages.logo),
                       SizedBox(height: 40),
                      Text(
                        AppLocalizations.of(context)!.welcomeBackToShopApp,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(color: AppColors.white),
                      ),
                      Text(
                        AppLocalizations.of(context)!.pleaseSignInWithYourMail,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                       SizedBox(height: 40),
                      AuthTextField(
                        title: AppLocalizations.of(context)!.enterYourMail,
                        hintText: AppLocalizations.of(context)!.mail,
                        validator: Validation.validateEmail,
                        controller: emailController,
                      ),
                      SizedBox(height: 40),

                      AuthTextField(
                        title: AppLocalizations.of(context)!.enterYourPassword,
                        hintText: AppLocalizations.of(context)!.password,
                        validator: Validation.validatePassword,
                        isPassword: true,
                        controller: passwordController ,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // TODO:  Navigate to forget password
                            },
                            child: Text(
                              AppLocalizations.of(context)!.forgetPassword,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) { ///ودا برضو نفس الكلام الي فوق : دا مهم جدا  دا الي بتسخدموا مع ال validation بتاع ال  textFromField وعشان يظهرللك الحاجة الحمرة دية الي بيقولك باسورد المفروض يتكتب كدا وهكزا
                         viewModel.login(emailController.text, passwordController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
                      child: Text(
                        AppLocalizations.of(context)!.signIn,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: AppColors.darkBlue),
                      ),
                    ),

                       SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dontHaveAnAccount,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, Routes.register);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.createAccount,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 2),
                                  Divider(
                                    color: Colors.white,
                                    thickness: 2,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
