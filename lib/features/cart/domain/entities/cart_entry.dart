
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';

class CartEntry {
  Product product;
  int quantity;
  num totalProductPrice;
  double price;

  CartEntry({
    required this.product,
    required this.quantity,
    required this.totalProductPrice,
    required this.price,
  });
}
