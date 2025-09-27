
import 'package:shop_app/features/network/model/response/categories/category_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dm.g.dart'; /// دا هيتعمل لوحدوا عن طريق   build_runner

@JsonSerializable() /// دا هيتعمل لوحدوا عن طريق   build_runner
class ProductDM {
  @JsonKey(name: '_id')
  final String id;
  final int? sold;
  final List<String>? images;
  final List<CategoryDM>? subcategory;
  final int? ratingsQuantity;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final double? price;
  final double? priceAfterDiscount;
  final String? imageCover;
  final CategoryDM? category;
  final CategoryDM? brand;
  final double? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? availableColors;

  ProductDM({
    required this.id,
    this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    this.priceAfterDiscount,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    this.availableColors,
  });

  factory ProductDM.fromJson(Map<String, dynamic> json) =>
      _$ProductDMFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDMToJson(this);
}