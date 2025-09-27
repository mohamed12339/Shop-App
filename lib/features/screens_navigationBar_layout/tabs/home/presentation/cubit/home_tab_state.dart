import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import '../../../../domian/model/entity/product.dart';

class HomeTabState{ /// دا الـ state اللي هيحتفظ بالـ data والحالات (Initial, Loading, Success, Error) وهابتعها لل cubit

  late ApiResult<List<Category>> categoriesState; /// هنا بخزن بقا ال ليستة ال categories
  late ApiResult<List<Product>> productsState; /// هنا بخزن بقا ال ليستة ال Products

  HomeTabState({required this.productsState, required this.categoriesState}); /// constructor اساسي بياخد القيم المطلوبة

  HomeTabState.initial() { /// والي هابعتها لل super  (الحالة الابتدائية قبل ما نجيب أي بيانات) initial state
    categoriesState = InitialApiResult();  /// كل حاجة لسه فاضية، قبل أي تحميل
    productsState = LoadingApiResult(); /// هنا دا كدا هايحمل لوحوا بعيد عن ال categories
  }

  HomeTabState copyWith({ /// زي ال colors لما بقولوا غير الحتة بس بلون كزا فا ال  copyWith بتسهل علينا تحديث الـ state من غير ما نغير القديم كله
    ApiResult<List<Category>>? categoriesState, /// انا هنا بقولوا الي هاتغير مين دلوقتي categoriesState وممكن تبقا ب null بردوا
    ApiResult<List<Product>>? productsState /// نفس الكلام مين الي بيتغير دلوقتي productsState  وممكن تبقا ب null بردو
}){
    return HomeTabState(
      categoriesState: categoriesState ?? this.categoriesState, /// لو جاب  categories جديدة استخدمها ، غير كده خلي القديم
        productsState: productsState ?? this.productsState   /// لو جاب  Products جديدة استخدمها ، غير كده خلي القديم
    );
  }

}