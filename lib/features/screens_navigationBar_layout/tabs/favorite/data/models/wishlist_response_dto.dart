

import 'package:shop_app/features/network/model/response/products/product_dm.dart';

class WishlistResponseDto {
  String? status;
  int? count;
  List<ProductDM>? data;

  WishlistResponseDto({this.status, this.count, this.data});

  WishlistResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = <ProductDM>[];
      json['data'].forEach((v) {
        data!.add(ProductDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}
