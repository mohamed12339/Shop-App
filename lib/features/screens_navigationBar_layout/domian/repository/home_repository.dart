import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';

import '../../../../core/api_result/api_result.dart';


abstract class HomeRepository{  ///   ودية مكتوبة في ال domian عشان ال usecase   ودا بردوا مهمتوا انو يحمل الداتا ال مهمة لل ViewModel فا هنا هانخلي عندوا الداتا الي هيا api ونبعتها لل view model الي هوا ال cubit مثلا اي stateManagement انتا مستخدمها  طب ولية انا عملت كدا عشان اعرف ال الحاجة offline and online يعني  الحاجة الي هاخزنها لو قفلت ال wifi ودا لو عملتها وهاخزنها بس بعدين  و اني اعرف api علي الحاجات الي هاستخدمها  وال هوا model  بس بتاعة ال domain

  Future<ApiResult<List<Category>>> loadCategories();    /// انا بعت الحاجات الي هاستخدمها بس تمم وعملتها في ليستة  عشان  محتاج لان دا هوا هيجبللك كمية categories كتيرة اوي فا لازم في ليستة  عشان اقولوا اني بستخدم الحاجاة ال model بتاعة ال doamin واعرف الحاجات الي بستخدمها بس لل api  وكمان اعرف ال list لل api  ودا هوا ال  mappers

  Future<ApiResult<List<Category>>> loadSubCategories(String categoryId);     /// هيا كدا كدا هتعمل نفس الحاجة بس الفرق اني بديلها categoryId وبقولوا subcategories عشان لما اجي ادوس علي تابة تجيلي الحاجة بتاعته

  Future<ApiResult<List<Product>>> loadProducts({String? categoryId, String? subCategoryId});   /// انا بعت الحاجات الي هاستخدمها بس تمم وعملتها في ليستة  عشان  محتاج لان دا هوا هيجبللك كمية Products كتيرة اوي فا لازم في ليستة  عشان اقولوا اني بستخدم الحاجاة ال model بتاعة ال doamin واعرف الحاجات الي بستخدمها بس لل api  وكمان اعرف ال list لل api  ودا هوا ال mappers وهنا المرادي بقولوا {String? categoryId, String? subCategoryId} عشان لما اجي ادوس علي سكرينات الي category  تجيلي الحاجة بتاعتها
}