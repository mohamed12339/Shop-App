import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/custom_product_card.dart';


class ProductsList extends StatelessWidget {
  final List<Product> products ;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemExtent: 186,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CustomProductCard(product: products[index]),
          );
        },
      ),
    );
  }
}
