import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/cart/data/cart_repository/data_source/cart_remote_data_source.dart';
import 'package:shop_app/features/network/api/commerce_services.dart';
import 'package:shop_app/features/network/model/request/cart/add_product_request.dart';
import 'package:shop_app/features/network/model/request/cart/update_product_quantity_request.dart';
import 'package:shop_app/features/network/model/response/cart/cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource) /// اهم حاجة انا مستخدم Injectable الي هيا بال I كدا عشان  دية انا عملتها عشان اقولوا لو طلبت abstract class دا   (as: CartRemoteDataSource) دا ابعتلي child ال (CartRemoteDataSourceImpl) بتاعوا زي ال news كدا لما عملتها في get it فايل بالظبط  بس هنا بقا هايعملها لوحدوا generated

class CartRemoteDataSourceImpl extends CartRemoteDataSource {  /// فايدة حتة الي impl واعمل extend لل abstract class بتاعها هيا ال coupling  يعني لو حصل تغير فا انتا مثلا تغير في كلاس impl مش هايحصل حاجة لل abstract كلاس خالص ودا فايدتوا ان لو حصل تغير في ال project هنغير حاجة مثلا تروح تغيرها في ال impl2 وهيا كدا كدا هتسمع في ال abstract class و ال impl1  لانها فانكشن فاضية بس بتعملها override من عند ال impl 1 and 2 بس فا بتغير هناك بس انا مش عامل impl2 ليها بس
  CommerceServices commerceServices; /// بعتلوا ال api عشان استخدم حاجات ال cart

  CartRemoteDataSourceImpl(this.commerceServices);

  @override
  Future<ApiResult<CartResponse>> addProductToCart(String productId) async {  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو CartResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك  وبقولوا ضيف ال product في ال cart بعتلوا ال product id عشان يعرف يضيفوا
    try {
      await commerceServices.addProductToCart(AddProductRequest(productId)); /// انا هنا بندة ال api بتاع ال  AddProductRequest وال retrofit package هاتكمل بقا ودية حلاوتها لانها عاملة genetrated لوحدها من عن طرق تكتب في ال terminal dart pub run build_runner build بس كدا وهيا تعمل api AddProductRequest هتلاقية معمول عندها في الفايل بتاعها وكمان رجعتها ان لو ضيفت ال product في ال cart هات ال get cart
     return getCart();

    } catch (e) {
      return ErrorApiResult(ServerError(e.toString())); /// هنا لو ايرور اظهر ال error
    }
  }

  @override
  Future<ApiResult<CartResponse>> getCart() async { /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو CartResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك وبقولوا هات ال يقا ال cart
   // try {
      return SuccessApiResult(await commerceServices.getCart()); /// هنا بقولوا لو success هات ال cart الي اتضاف عشان انا قايلوا  لما تضيف هات ال cart فوق في سطر 20
    // } catch (e) {
    //   return ErrorApiResult(ServerError(e.toString()));
    // }
  }

  @override
  Future<ApiResult<CartResponse>> removeProductFromCart(  /// نفس الكلام الي فوق بس الفرق اني بقولوا امسح ال product في ال cart بعتلوا ال product id عشان يعرف يمسحوا
    String productId,
  ) async {
    try {
      return SuccessApiResult(
        await commerceServices.removeProductFromCart(productId), /// نفس الكلام بتاع سطر 19 بس هنا بقولوا خلاص لو success اتضاف امسحوا وبعتلوا ال productId
      );
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString())); /// هنا لو ايرور اظهر ال error
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateProductCartQuantity( /// نفس الكلام الي فوق بس الفرق اني بقولوا update لو عايز اغير في ال product في ال cart الي هوا كان موجود اعمل تغيير علية  بعتلوا ال product id عشان يعرف اني واحد وبعتلوا الكمية بردو عشان لو فية كمية مثلا
    String productId,
    int quantity,
  ) async {
    try {
      return SuccessApiResult(
        await commerceServices.updateProductQuantity(   /// نفس الكلام بتاع سطر 19 بس هنا بقولوا خلاص لو success  وفية حاجة موجودة عايز تعمل بس تغيير فيها فا بعتلوا الكمية وال  productId عشان اعرف اعمل update
          UpdateProductQuantityRequest(quantity.toString()),
          productId,
        ),
      );
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));  /// هنا لو ايرور اظهر ال error
    }
  }
}
