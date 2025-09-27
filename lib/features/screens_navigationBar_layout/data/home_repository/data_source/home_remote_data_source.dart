import 'package:shop_app/features/network/model/response/categories/categories_response.dart';
import 'package:shop_app/features/network/model/response/products/products_response.dart';
import '../../../../../core/api_result/api_result.dart';


abstract class HomeRemoteDataSource{ /// دا الداتا الاونلاين دا هوا ال abstract الي مش هابعت فية الحاجة ال impl هوا الي هايبعت الحاجة

  Future<ApiResult<CategoriesResponse>> loadCategories();  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو CategoriesResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك

  Future<ApiResult<CategoriesResponse>> loadSubCategories(String categoryId);/// نفس الكلام برضو بتاع الي فوق بس المرادي بقولوا subcategories عشان لما اجي ادوس علي تابة تجيلي الحاجة بتاعتها

  Future<ApiResult<ProductsResponse>> loadProducts({String? categoryId,
    String? subCategoryId}); /// نفس الكلام برضو بتاع الي فوق بس المرادي بقولوا loadProducts عشان لما اجي ادوس علي سكرينات الي category  تجيلي الحاجة بتاعتها
}