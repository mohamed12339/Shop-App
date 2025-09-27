import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';

class CategoriesState{ /// دا الـ state اللي هيحتفظ بالـ data والحالات (Initial, Loading, Success, Error) وهابتعها لل cubit

  late ApiResult<List<Category>> categoriesApiState; /// هنا بخزن بقا ال ليستة ال categories
  late ApiResult<List<Category>> subCategoriesApiState; /// هنا هاعمل نفس الحاجة بس الفرق اني بنادي بقا علي ان كل تابة بدوس عليها يظهرلي ال category بتاعها هيا بس
  late int selectedCategoryIndex; /// دا عشان بدل on item click بتاعة الفايل categoriesList علي حتة بتاعة ال listviewBuilder تشتغل الخط الازرق لما يتداس علية يعني

  CategoriesState({required this.categoriesApiState ,  required this.selectedCategoryIndex, required this.subCategoriesApiState});

  CategoriesState.initial(){ /// والي هابعتها لل super  (الحالة الابتدائية قبل ما نجيب أي بيانات) initial state
    categoriesApiState = InitialApiResult();/// كل حاجة لسه فاضية، قبل أي تحميل
    subCategoriesApiState = InitialApiResult();/// كل حاجة لسه فاضية، قبل أي تحميل
    selectedCategoryIndex = 0; /// دا كدا بقولوا هيبدا ب 0 يعني اول حاجة في ال tab بس

  }
  CategoriesState copyWith({ /// زي ال colors لما بقولوا غير الحتة بس بلون كزا فا ال  copyWith بتسهل علينا تحديث الـ state من غير ما نغير القديم كله
    ApiResult<List<Category>>? categoriesApiState, /// انا هنا بقولوا الي هاتغير مين دلوقتي categoriesState وممكن تبقا ب null بردوا
    ApiResult<List<Category>>? subCategoriesApiState, /// انا هنا بقولوا الي هاتغير مين دلوقتي subCategoriesApiState وممكن تبقا ب null بردوا
    int? selectedCategoryIndex, /// انا هنا بقولوا الي هاتغير مين دلوقتي  selectedCategoryIndex  وممكن تبقا ب null ب
  }) {
    return CategoriesState(
      categoriesApiState: categoriesApiState ?? this.categoriesApiState, /// لو جاب  categories جديدة استخدمها ، غير كده خلي القديم
        subCategoriesApiState: subCategoriesApiState ?? this.subCategoriesApiState, /// لو جاب  categories من تابة جديدة استخدمها وهات الحاجة بتعتها  ، غير كده خلي القديم
       selectedCategoryIndex: selectedCategoryIndex?? this.selectedCategoryIndex /// طب دا ب null مش موجود خد القديم بس كدا
    );
  }
}