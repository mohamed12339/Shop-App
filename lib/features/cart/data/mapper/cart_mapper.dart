import 'package:shop_app/features/cart/domain/entities/cart.dart';
import 'package:shop_app/features/cart/domain/entities/cart_entry.dart';
import 'package:shop_app/features/network/model/response/cart/cart_entry_dm.dart';
import 'package:shop_app/features/network/model/response/cart/cart_response.dart';
import 'package:shop_app/features/screens_navigationBar_layout/data/mappers/product_mapper.dart';
import 'package:injectable/injectable.dart';

@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news
class CartMapper {
  ProductMapper productMapper; /// هنا انا استخدمت دية عشان احول productDm ل product بتاع ال domain عشان اعرف ال cartentry الحاجة بتاع ال product الانا هاستخدمها طب عشان اعمل كدا استخدمت ال mapper بتاع ال product انا عامل فيها دا بس

  CartMapper(this.productMapper); /// وهنا بعتوا بقا خلاص

  Cart cartResponseToCart(CartResponse cartResponse) {
    Map<String, CartEntry> entries = {}; ///هنا انا بخزن لكل product id ال (CartEntry) بحيث  اني اقدر ال cart entry   بسرعة باستخدام ال key الي هوا ال string  بدل ما اعمل for كتير lookup في Map عادة O(1)
    cartResponse.cart  /// بروح أجيب الكارت من الـ cartResponse
        ?.cartEntries    /// لو الكارت مش null، هات الليسته اللي جواها اسمها cartEntries
        ?.forEach((entry) {    /// لو الليسته مش null، لف على كل عنصر الي هيا for each   فيها واحد واحد وحطه في متغير اسمه entry

      entries[entry.product!.id] =   /// في الـ Map اللي اسمها entries، استخدم الـ id بتاع product كمفتاح (key)
      cartEntryDMToCartEntry(entry); /// وحوِّل الـ entry (اللي جاي من الـ API كـ Data Model) ل CartEntry (اللي هو الـ Domain Model اللي الابلكيشن هيستخدمه) وخزّنه كقيمة (entry) في الـ Map
    });

    return Cart(
      entries: entries,
      totalNumberOfItems: cartResponse.numOfCartItems?.toInt() ?? 0,
      totalPrice: cartResponse.cart?.totalCartPrice ?? 0,
    );
  }

  CartEntry cartEntryDMToCartEntry(CartEntryDM cartEntry) { /// انا هنا بعرف ال cartEntryDm الحاجة بتاعة ال cartEntry وبقولوا دا الي هاستخدموا بس
    var quantity = cartEntry.count ?? 0; /// وعرفتوا الكمية عشان اخزنها بردوا CartEntry
    double price = cartEntry.price?.toDouble() ?? 0.0;  /// وعرفتوا السعر عشان اخزنها بردوا في ال CartEntry
    var product = productMapper.fromDataModel(cartEntry.product!); /// هنا برضو بعرف ال product بتاع ال domain الانا هاستخدموا
    return CartEntry(
      product: product,
      quantity: quantity,
      totalProductPrice: quantity * price,
      price: price
    );
  }
}
