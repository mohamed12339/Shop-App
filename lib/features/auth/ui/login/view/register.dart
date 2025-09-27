import 'package:shop_app/core/di/di.dart';
import 'package:shop_app/features/auth/ui/login/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/core/theme/app_colors.dart';
import 'package:shop_app/core/utils/app_assets.dart';
import 'package:shop_app/core/utils/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/dialog_utills.dart';
import '../../widgets/auth_textfield.dart';
import '../cubit/register_state.dart';



class Register extends StatefulWidget {


  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterCubit viewModel = getIt(); /// هنا عرفت ال RegisterCubit عشان استخدمها في ال ui بقا ب bloc listener او blocbuilder وطبعا ايد مننساش blocprovider زي ال changenotifer وكدا getit هيا هتجبلي الحاجة بس طبعا generated المرادي
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();


  var formKey = GlobalKey<FormState>(); /// دا مهم جدا دا الي بتسخدموا مع ال validation بتاع ال  textFromField وعشان يظهرللك الحاجة الحمرة دية الي بيقولك باسورد المفروض يتكتب كدا وهكزا

  @override
  Widget build(BuildContext context) {
    return BlocProvider( /// دية زي ال ChangeNotifierProvider بالظبط وبردوا ممكن تكتبها هنا او  تكتبها في ال maindart ويد حلاوة ال cubit انك مش لازم تمتبها في ال main dart  زي ال ChangeNotifierProvider
      create: (_)=> viewModel,
      child: BlocListener<RegisterCubit , RegisterState>( /// هنا دية زي consumer وال blocbuilder بس الفرق انا دية بتعمل listen علي حاجة معينة مش زي ال blocbuilder بتعمل rebuild علي طول
        listener: (context , state){
          if(state.registerApi.hasData){
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.navigationRoute);
          }else if(state.registerApi.hasError){
            Navigator.pop(context);
            showMessage(context , title: "Error"  , message: state.registerApi.getError.message , posButtonTitle: "ok" );
          }else if (state.registerApi.isLoading){
            Navigator.pop(context);
            showLoading(context);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.blue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back , color: AppColors.white,)),
          ),
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
                      Image.asset(AppImages.logo),
                      SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.welcomeBackToShopApp,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.ifYouWantToCreateAccount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 20),
                      AuthTextField(
                        title: AppLocalizations.of(context)!.nameHint,
                        hintText: AppLocalizations.of(context)!.nameHint,
                        controller: nameController,
                      ),
                      SizedBox(height: 20),
                      AuthTextField(
                        title: AppLocalizations.of(context)!.phoneNumberHint,
                        hintText: AppLocalizations.of(context)!.phoneNumberHint,
                        controller: phoneNumberController,
                      ),
                      SizedBox(height: 20),
                      AuthTextField(
                        title: AppLocalizations.of(context)!.enterYourMail,
                        hintText: AppLocalizations.of(context)!.mail,
                        validator: Validation.validateEmail,
                        controller: emailController,
                      ),
                      SizedBox(height: 20),
                      AuthTextField(
                        title: AppLocalizations.of(context)!.enterYourPassword,
                        hintText: AppLocalizations.of(context)!.password,
                        validator: Validation.validatePassword,
                        isPassword: true,
                        controller: passwordController ,
                      ),
                      SizedBox(height: 20),
                      AuthTextField(
                        title: AppLocalizations.of(context)!.rePasswordHint,
                        hintText: AppLocalizations.of(context)!.rePasswordHint,
                        validator: (value)=> Validation.validateRePassword(value, passwordController.text ), /// عشان يتاكد من ال password الاصلي زي ال apps التانية
                        isPassword: true,
                        controller: rePasswordController ,
                      ),

                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            viewModel.register( ///ودا برضو نفس الكلام الي فوق : دا مهم جدا  دا الي بتسخدموا مع ال validation بتاع ال  textFromField وعشان يظهرللك الحاجة الحمرة دية الي بيقولك باسورد المفروض يتكتب كدا وهكزا
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              rePasswordController.text,
                              phoneNumberController.text,
                            );
                            Navigator.pushNamed(context, Routes.navigationRoute);
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
                      SizedBox(height: 20),
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
