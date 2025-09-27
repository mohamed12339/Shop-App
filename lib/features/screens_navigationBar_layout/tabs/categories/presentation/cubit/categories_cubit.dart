import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/usecase/load_categories_use_case.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/usecase/load_subcategories.dart';
import 'package:shop_app/features/screens_navigationBar_layout/tabs/categories/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable  ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news
class CategoriesCubit extends Cubit<CategoriesState>{ /// دا الـ Cubit الرئيسي اللي هيتحكم في الـ state بتاع subcategories + LoadCategoriesUseCase

  final LoadCategoriesUseCase _loadCategoriesUseCase; /// ال UseCase المسئول عن انو يجيب ال  Categories

  final LoadSubCategoriesUseCase _loadSubCategoriesUseCase;  /// ال UseCase المسئول عن انو يجيب ال  SubCategories

  CategoriesCubit(this._loadCategoriesUseCase, this._loadSubCategoriesUseCase) :super(CategoriesState.initial()); /// الي هاكتبوا في ال super عشان اعرفوا Cubit هيعمل اية بس وبعتلوا ال constructors

  Future<void> loadCategories() async { /// فانكشن عشان loadCategories مش بترجع حاجة

    emit(state.copyWith(categoriesApiState: LoadingApiResult()));  /// انا هنا بقولوا الي هاتغير مين دلوقتي categoriesState واعمل loading

    var result = await _loadCategoriesUseCase(); /// هنا بنادي على الـ UseCase اللي بيرجع <ApiResult<List<Category>>>  عشان كدا عملتها call ممكن انادي عليها كدا مش زي ال excute بتاعة ال news بس دية حاجة في dart يعني

    emit(state.copyWith(categoriesApiState: result)); /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال categoriesState ونحدثوا بقا في ال ui

    if(result.hasData){ /// هنا بقولوا وللة لو ال result كانت عندها data ساعتها ممكن ابقا اقولوا حملي ال loadSubCategories وخد او item حمل الداتا بتاعتوا
      loadSubCategories(result.getData[0].id);
    }
  }

  Future<void> loadSubCategories(String category) async { /// فانكشن عشان loadSubCategories مش بترجع حاجة

    emit(state.copyWith(subCategoriesApiState: LoadingApiResult()));  /// انا هنا بقولوا الي هاتغير مين دلوقتي categoriesState واعمل loading

    var result = await _loadSubCategoriesUseCase(category); /// هنا بنادي على الـ UseCase اللي بيرجع <ApiResult<List<Category>>>  عشان كدا عملتها call ممكن انادي عليها كدا مش زي ال excute بتاعة ال news بس دية حاجة في dart يعني بس المرادي بديها category

    emit(state.copyWith(subCategoriesApiState: result)); /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال subCategoriesApiState ونحدثوا بقا في ال ui
  }

  void updateSelectedCategoryIndex(int index) { ///  هنا هتاخد ال index الجديد
    emit(state.copyWith(selectedCategoryIndex: index)) ; /// وهنا بقولوا عملت emit وبقول لل state هتاخد ال index الجديد وتغيروا دلوقتي
    loadSubCategories(state.categoriesApiState.getData[index].id); ///  انا حطيت الloadSubCategories هنا لما اجي وانا بدوس علي التابة تظهر الحاجة بتاعتها فا كمان بعتلوا ال  id بتاع ال لستة ال category مش SubCategories
  }

}