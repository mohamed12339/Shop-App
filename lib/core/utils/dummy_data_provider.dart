


import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';



abstract class DummyDataProvider {
  static List<Category> generateCategories() {
    List<Category> categories = [];
    for (int i = 1; i <= 50; i++) {
      categories.add(
        Category(
          id: i.toString(),
          name: 'SuperMarket',
          image:
              'https://ecommerce.routemisr.com/Route-Academy-categories/1681511452254.png',
        ),
      );
    }
    return categories;
  }

  static List<Product> generateProducts() {
    List<Product> products = [];
    for (int i = 1; i <= 50; i++) {
      products.add(
        Product(
          id: '$i',
          title: 'Softride Enzo NXT',
          description: 'Sole Material: Rubber, Colour: RED, Department: Men',
          price: 2999,
          priceAfterDiscount: 2699,
          imageCover:
              'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
          images: [
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-1.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913851-4.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-2.jpeg',
          ],
          categoryId: '6439d5b90049ad0b52b90048',
          brandId: '64089d5c24b25627a253159f',
          ratingsAverage: 2.8 + (i % 5) * 0.1,
          ratingsQuantity: 20 + i,
          quantity: 100 + i,
          availableColors: ['Red', 'Black', 'Blue'],
        ),
      );
    }
    return products;
  }
}
