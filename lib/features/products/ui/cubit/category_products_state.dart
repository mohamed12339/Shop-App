import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';

class CategoryProductsState { /// دا الـ state اللي هيحتفظ بالـ data والحالات (Initial, Loading, Success, Error) وهابتعها لل cubit

  late ApiResult<List<Product>> productsApiState;  /// هنا هاعمل نفس الحاجة بس الفرق اني بنادي بقا علي ان كل صورة من ال category بدوس عليها يظهرلي ال products بتاعها هيا بس

  CategoryProductsState({required this.productsApiState});

  CategoryProductsState.initial() { /// والي هابعتها لل super  (الحالة الابتدائية قبل ما نجيب أي بيانات) initial state

    productsApiState = InitialApiResult(); /// كل حاجة لسه فاضية، قبل أي تحميل
  }

  CategoryProductsState copyWith({  /// زي ال colors لما بقولوا غير الحتة بس بلون كزا فا ال  copyWith بتسهل علينا تحديث الـ state من غير ما نغير القديم كله
    ApiResult<List<Product>>? productsApiState /// انا هنا بقولوا الي هاتغير مين دلوقتي productsApiState وممكن تبقا ب null بردوا
  }) {
    return CategoryProductsState(
      productsApiState: productsApiState ?? this.productsApiState, /// لو جاب  categories من صورة جديدة استخدمها وهات productsApiState بتعتها  ، غير كده خلي القديم
    );
  }
}
