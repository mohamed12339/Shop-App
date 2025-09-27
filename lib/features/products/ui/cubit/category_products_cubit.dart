import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/products/ui/cubit/category_products_state.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/usecase/load_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news

class CategoryProductsCubit extends Cubit<CategoryProductsState> { /// دا الـ Cubit الرئيسي اللي هيتحكم في الـ state بتاع subcategories + LoadCategoriesUseCase
  final LoadProductsUseCase _loadProductsUseCase; /// ال UseCase المسئول عن انو يجيب ال  LoadProductsUseCase

  CategoryProductsCubit(this._loadProductsUseCase) : super(CategoryProductsState.initial()); /// الي هاكتبوا في ال super عشان اعرفوا Cubit هيعمل اية بس وبعتلوا ال constructors

  Future<void> loadProducts(String categoryId, String subCategoryId) async {  /// فانكشن عشان loadProducts مش بترجع حاجة بس بعتلها دا عشان صورة ال category الي هاتفتح ال products

    emit(state.copyWith(productsApiState: LoadingApiResult())); /// انا هنا بقولوا الي هاتغير مين دلوقتي productsApiState واعمل loading

    var result = await _loadProductsUseCase( /// هنا بنادي على الـ UseCase اللي بيرجع <ApiResult<List<Category>>>  عشان كدا عملتها call ممكن انادي عليها كدا مش زي ال excute بتاعة ال news بس دية حاجة في dart يعني بس المرادي بديها categoryId و subCategoryId عشان صورة ال category الي هاتفتح ال products
      categoryId: categoryId,
      subCategory: subCategoryId,
    );
    emit(state.copyWith(productsApiState: result)); /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال subCategoriesApiState ونحدثوا بقا في ال ui
  }
}
