
import 'package:shop_app/features/network/model/response/products/product_dm.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';

import 'package:injectable/injectable.dart';

@injectable /// دا عشان يعرف ال CategoryMapper عند ال get it
class ProductMapper {  /// انا هنا ممكن اعملوا علي ال chatgpt بتاخد الكلاس بتاع ال domain source وكلاس ال data ال هوا productResponse الي هوا دا (ProductDM) وتحطهم في chatgpt   بس انا عملت كدا عشان افهم
  Product fromDataModel(ProductDM product) {   ///دية هتاخد ال ProductDM دا الي جواة  productResponse  ترجعوا علي انوا Product الي جي من ال domain

    return Product(
      id: product.id,
      title: product.title ?? "",
      description: product.description ?? "",
      price: product.price ?? 0,
      priceAfterDiscount: product.priceAfterDiscount ?? 0,
      imageCover: product.imageCover ?? "",
      images: product.images ?? [],
      categoryId: product.category?.id ?? "",
      brandId: product.brand?.id ?? "",
      ratingsAverage: product.ratingsAverage ?? 0,
      ratingsQuantity: product.ratingsQuantity ?? 0,
      quantity: product.quantity ?? 0,
      availableColors: product.availableColors ?? [],
    );
  }

  List<Product> fromDataModels(List<ProductDM> products) { /// دية هتاخد ليستة من ال ProductDM دا الي جواة  productResponse  ترجعهولي علي انو ليستة من ال Product
    return products.map(fromDataModel).toList();
  }
}