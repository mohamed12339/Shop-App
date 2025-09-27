

import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/cart/domain/entities/cart.dart';

abstract class CartRepository { /// هنا بقا دا مهمتوا اني اعرف api علي الحاجات الي هاستخدمها  وال هوا model  بس بتاعة ال domain
  Future<ApiResult<Cart>> getCart();  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو Cart ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك وبقولوا هات ال يقا ال cart

  Future<ApiResult<Cart>> addProductToCart(String productId); /// نفس الكلام الي فوق بس الفرق اني بقولوا ضيف ال product في ال cart بعتلوا ال product id عشان يعرف يضيفوا

  Future<ApiResult<Cart>> removeProductFromCart(String productId); /// نفس الكلام الي فوق بس الفرق اني بقولوا امسح ال product في ال cart بعتلوا ال product id عشان يعرف يمسحوا

  Future<ApiResult<Cart>> updateProductCartQuantity(  /// نفس الكلام الي فوق بس الفرق اني بقولوا update لو عايز اغير في ال product في ال cart الي هوا كان موجود اعمل تغيير علية  بعتلوا ال product id عشان يعرف اني واحد وبعتلوا الكمية بردو عشان لو فية كمية مثلا
    String productId,
    int quantity,
  );
}
