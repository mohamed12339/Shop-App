

import 'package:shop_app/features/network/model/response/products/product_dm.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/meta_data/meta_data.dart';

part 'products_response.g.dart'; /// دا هيتعمل لوحدوا عن طريق   build_runner

// Product response class
@JsonSerializable() /// دا هيتعمل لوحدوا عن طريق   build_runner
class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<ProductDM>? data;

  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}