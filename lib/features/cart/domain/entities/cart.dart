

import 'package:shop_app/features/cart/domain/entities/cart_entry.dart';

class Cart{ /// ودا طبعا الحاجات الي هاستخدمها
  num totalPrice;
  ///Key -> Product id
  Map<String, CartEntry> entries; /// انا عملت دية كدا عشان انا عملت for loops عليها كتير اوي لان انا لما ادخل الاسكرين دية لازم اعرف ال product دا موجود ولا لا لكن انا لما احطها في map علي هاجيبوا ب ال key وال cartEntry الي هوا product id
  int totalNumberOfItems;

  Cart({required this.entries,
    required this.totalPrice, required this.totalNumberOfItems});


  bool isProductInCart(String productId) => entries[productId] != null; /// وللة لو ال entries الي شايلة ال product كلها لو productId موجود جواة ال map ومش ب null خلاص يبقا دا موجود

  int? getProductQuantity(String productId) => entries[productId]?.quantity; /// هنا بقولوا هات product من جواة ال cart وشوف الكمية بقا
}