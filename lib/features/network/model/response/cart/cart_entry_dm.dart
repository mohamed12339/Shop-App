
import 'package:shop_app/features/network/model/response/products/product_dm.dart';

class CartEntryDM { /// دا اتعمل مش با json serializable لا دا اتعمل ب plugin اسمو json to dart
  CartEntryDM({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartEntryDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? ProductDM.fromJson(json['product']) : null;
    price = json['price'];
  }
  int? count;
  String? id;
  ProductDM? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }

}