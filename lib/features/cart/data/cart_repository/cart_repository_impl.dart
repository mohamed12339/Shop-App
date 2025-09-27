import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/cart/data/cart_repository/data_source/cart_remote_data_source.dart';
import 'package:shop_app/features/cart/data/mapper/cart_mapper.dart';
import 'package:shop_app/features/cart/domain/entities/cart.dart';
import 'package:shop_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository) /// اهم حاجة انا مستخدم Injectable الي هيا بال I كدا عشان  دية انا عملتها عشان اقولوا لو طلبت abstract class دا   (as: CartRepository) دا ابعتلي child ال (CartRepositoryImpl) بتاعوا زي ال news كدا لما عملتها في get it فايل بالظبط  بس هنا بقا هايعملها لوحدوا generated

class CartRepositoryImpl extends CartRepository{  /// فايدة حتة الي impl واعمل extend لل abstract class بتاعها هيا ال coupling  يعني لو حصل تغير فا انتا مثلا تغير في كلاس impl مش هايحصل حاجة لل abstract كلاس خالص ودا فايدتوا ان لو حصل تغير في ال project هنغير حاجة مثلا تروح تغيرها في ال impl2 وهيا كدا كدا هتسمع في ال abstract class و ال impl1  لانها فانكشن فاضية بس بتعملها override من عند ال impl 1 and 2 بس فا بتغير هناك بس انا مش عامل impl2 ليها بس

  CartMapper mapper; /// عرفت ال CartMapper عشان استخدم الحاجة الي الانا عايزها من الكلاس الكبير الي موجود في ال data واقدر استخدم هنا cart  بتاع ال model domain بس
  CartRemoteDataSource dataSource; /// دا الداتا الاونلاين
  CartRepositoryImpl(this.mapper, this.dataSource);

  @override
  Future<ApiResult<Cart>> addProductToCart(String productId) async{  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو CartResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك  وبقولوا ضيف ال product في ال cart بعتلوا ال product id عشان يعرف يضيفوا
    try{
      var result = await dataSource.addProductToCart(productId); /// انا هنا بندة ال api بتاع ال  AddProductRequest وال retrofit package هاتكمل بقا ودية حلاوتها لانها عاملة genetrated لوحدها من عن طرق تكتب في ال terminal dart pub run build_runner build بس كدا وهيا تعمل api AddProductRequest هتلاقية معمول عندها في الفايل بتاعها وكمان رجعتها ان لو ضيفت ال product في ال cart هات ال result
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData)); ///  لو النتيجة اللي رجعت من الـ RemoteDataSource كانت  Success  وكمان الداتا اللي رجعت من النوع cartResponse خلاص حملها وخليها تظهر  لكن المرة دي تظهر الحاجة بتاعة ال  Domain Model والي هاكلم بيها  (Bloc:cubit and  UI) هيستقبلوا Domain Model الجاهز للاستخدام
      }else {
        return ErrorApiResult(result.getError);   ///  لو النتيجة ErrorApiResult هرجع نفس الـ Error اللي جالي زي ما هو
      }
    }catch(e){
      return ErrorApiResult(UnKnownError("Something wrong please try again later ")); ///  لو النتيجة مش Success ولا Error (حاجة unexpected) هرجع UnKnownError
    }
  }

  @override
  Future<ApiResult<Cart>> getCart() async {  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو CartResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك وبقولوا هات ال يقا ال cart
   // try{
      var result = await dataSource.getCart(); /// هنا بقولوا اندة علي api بتاع getCart وهات ال cart الي اتضاف عشان انا قايلوا  لما تضيف هات ال cart فوق في سطر 19
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData));  ///  لو النتيجة اللي رجعت من الـ RemoteDataSource كانت  Success  وكمان الداتا اللي رجعت من النوع cartResponse خلاص حملها وخليها تظهر  لكن المرة دي تظهر الحاجة بتاعة ال  Domain Model والي هاكلم بيها  (Bloc:cubit and  UI) هيستقبلوا Domain Model الجاهز للاستخدام
      }else {
        return ErrorApiResult(result.getError);   ///  لو النتيجة ErrorApiResult هرجع نفس الـ Error اللي جالي زي ما هو
      }
    // }catch(e){
    //   return ErrorApiResult(UnknownError("Something wrong please try again later "));
    // }
  }

  @override
  Future<ApiResult<Cart>> removeProductFromCart(String productId)async { /// نفس الكلام الي فوق بس الفرق اني بقولوا امسح ال product في ال cart بعتلوا ال product id عشان يعرف يمسحوا
    try{
      var result = await dataSource.removeProductFromCart(productId); /// نفس الكلام بتاع سطر 19 بس هنا بقولوا خلاص  اندة علي api بتاع removeProductFromCart وهات اتضاف امسحوا وبعتلوا ال productId
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData));  ///  لو النتيجة اللي رجعت من الـ RemoteDataSource كانت  Success  وكمان الداتا اللي رجعت من النوع cartResponse خلاص حملها وخليها تظهر  لكن المرة دي تظهر الحاجة بتاعة ال  Domain Model والي هاكلم بيها  (Bloc:cubit and  UI) هيستقبلوا Domain Model الجاهز للاستخدام
      }else {
        return ErrorApiResult(result.getError);  ///  لو النتيجة ErrorApiResult هرجع نفس الـ Error اللي جالي زي ما هو
      }
    }catch(e){
      return ErrorApiResult(UnKnownError("Something wrong please try again later ")); ///  لو النتيجة مش Success ولا Error (حاجة unexpected) هرجع UnKnownError
    }
  }

  @override
  Future<ApiResult<Cart>> updateProductCartQuantity(String productId, int quantity)async { /// نفس الكلام الي فوق بس الفرق اني بقولوا update لو عايز اغير في ال product في ال cart الي هوا كان موجود اعمل تغيير علية  بعتلوا ال product id عشان يعرف اني واحد وبعتلوا الكمية بردو عشان لو فية كمية مثلا
    try{
      var result = await dataSource.updateProductCartQuantity(productId, quantity);  /// نفس الكلام بتاع سطر 19 بس هنا بقولوا خلاص  اندة علي api بتاع updateProductCartQuantity  وفية حاجة موجودة عايز تعمل بس تغيير فيها فا بعتلوا الكمية وال  productId عشان اعرف اعمل update
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData));  ///  لو النتيجة اللي رجعت من الـ RemoteDataSource كانت  Success  وكمان الداتا اللي رجعت من النوع cartResponse خلاص حملها وخليها تظهر  لكن المرة دي تظهر الحاجة بتاعة ال  Domain Model والي هاكلم بيها  (Bloc:cubit and  UI) هيستقبلوا Domain Model الجاهز للاستخدام
      }else {
        return ErrorApiResult(result.getError);  ///  لو النتيجة ErrorApiResult هرجع نفس الـ Error اللي جالي زي ما هو
      }
    }catch(e){
      return ErrorApiResult(UnKnownError("Something wrong please try again later ")); ///  لو النتيجة مش Success ولا Error (حاجة unexpected) هرجع UnKnownError
    }
  }
}