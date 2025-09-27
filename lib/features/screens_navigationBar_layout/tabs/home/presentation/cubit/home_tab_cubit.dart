import 'package:shop_app/features/screens_navigationBar_layout/tabs/home/presentation/cubit/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api_result/api_result.dart';
import '../../../../domian/usecase/load_categories_use_case.dart';
import '../../../../domian/usecase/load_products_use_case.dart';

@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news

class HomeTabCubit extends Cubit<HomeTabState> {  /// دا الـ Cubit الرئيسي اللي هيتحكم في الـ state بتاع LoadProductsUseCase + LoadCategoriesUseCase
  final LoadCategoriesUseCase _loadCategoriesUseCase; /// ال UseCase المسئول عن انو يجيب ال  Categories
  final LoadProductsUseCase _loadProductsUseCase; /// ال UseCase المسئول عن انو يجيب ال  Products

  HomeTabCubit(this._loadCategoriesUseCase, this._loadProductsUseCase) : super(HomeTabState.initial()); /// الي هاكتبوا في ال super عشان اعرفوا Cubit هيعمل اية بس وبعتلوا ال constructors

  Future<void> loadCategories() async {  /// فانكشن عشان Categories مش بترجع حاجة

    emit(state.copyWith(categoriesState: LoadingApiResult())); /// انا هنا بقولوا الي هاتغير مين دلوقتي categoriesState واعمل loading

    var result = await _loadCategoriesUseCase(); /// هنا بننادي على الـ UseCase اللي بيرجع <ApiResult<List<Category>>>  عشان كدا عملتها call ممكن انادي عليها كدا مش زي ال excute بتاعة ال news بس دية حاجة في dart يعني

    emit(state.copyWith(categoriesState: result)); /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال categoriesState ونحدثوا بقا في ال ui
  }

  Future<void> loadProducts() async {  /// فانكشن Products عشان مش بترجع حاجة

    emit(state.copyWith(productsState: LoadingApiResult()));  /// انا هنا بقولوا الي هاتغير مين دلوقتي productsState واعمل loading

    var result = await _loadProductsUseCase(); /// هنا بننادي على الـ UseCase اللي بيرجع <ApiResult<List<product>>>  عشان كدا عملتها call ممكن انادي عليها كدا مش زي ال excute بتاعة ال news بس دية حاجة في dart يعني

    emit(state.copyWith(productsState: result)); /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال productsState ونحدثوا بقا في ال ui
  }
}