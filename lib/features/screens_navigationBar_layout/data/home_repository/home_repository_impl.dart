import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/network/model/response/categories/categories_response.dart';
import 'package:shop_app/features/network/model/response/products/products_response.dart';
import 'package:shop_app/features/screens_navigationBar_layout/data/home_repository/data_source/home_remote_data_source.dart';
import 'package:shop_app/features/screens_navigationBar_layout/data/mappers/category_mapper.dart';
import 'package:shop_app/features/screens_navigationBar_layout/data/mappers/product_mapper.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)  /// اهم حاجة انا مستخدم Injectable الي هيا بال I كدا عشان  دية انا عملتها عشان اقولوا لو طلبت abstract class دا   (as: MovieDetailsRepository) دا ابعتلي child ال (MovieDetailsRepositoryImpl) بتاعوا زي ال news كدا لما عملتها في get it فايل بالظبط  بس هنا بقا هايعملها لوحدوا generated

class HomeRepositoryImpl extends HomeRepository {  /// فايدة حتة الي impl واعمل extend لل abstract class بتاعها هيا ال coupling  يعني لو حصل تغير فا انتا مثلا تغير في كلاس impl مش هايحصل حاجة لل abstract كلاس خالص ودا فايدتوا ان لو حصل تغير في ال project هنغير حاجة مثلا تروح تغيرها في ال impl2 وهيا كدا كدا هتسمع في ال abstract class و ال impl1  لانها فانكشن فاضية بس بتعملها override من عند ال impl 1 and 2 بس فا بتغير هناك
  final HomeRemoteDataSource _remoteDataSource;  /// دا الداتا الاونلاين
  final ProductMapper _productMapper;  /// عرفت ال ProductMapper عشان استخدم الحاجة الي الانا عايزها من الكلاس الكبير الي موجود في ال data واقدر استخدم هنا product  بتاع ال model domain بس
  final CategoryMapper _categoryMapper; /// عرفت ال CategoryMapper عشان استخدم الحاجة الي الانا عايزها من الكلاس الكبير الي موجود في ال data واقدر استخدم هنا product  بتاع ال model domain بس

  HomeRepositoryImpl(this._remoteDataSource,
      this._categoryMapper,
      this._productMapper,);

  @override
  Future<ApiResult<List<Category>>> loadCategories() async { /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو <List<Category> ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك طب انا هارجعوا <List<Category> لية  عشان هيبقا فية كمية categories ودا عشان يتعمل بال mappers عشان تعرف ال api بتاع categoryResponse بس والحاجة الي هاستخدمها كمان
    try {
      ApiResult<CategoriesResponse> result = await _remoteDataSource.loadCategories(); ///  هنا بنادي على الـ RemoteDataSource عشان يجيبلي CategoriesResponse من API

      if (result.hasData) { ///  لو النتيجة اللي رجعت من الـ RemoteDataSource كانت  Success  وكمان الداتا اللي رجعت من النوع CategoriesResponse خلاص حملها وخليها تظهر
        return SuccessApiResult(
          _categoryMapper.fromDataModels(result.getData.data), ///  هنا برجع SuccessApiResult تاني لكن المرة دي Domain Model يعني الطبقات الأعلى (Bloc:cubit and  UI) هيستقبلوا Domain Model الجاهز للاستخدام
        );
      } else {
        return ErrorApiResult(result.getError);  ///  لو النتيجة ErrorApiResult هرجع نفس الـ Error اللي جالي زي ما هو
      }
    } catch (e) {
      return ErrorApiResult(UnKnownError("Something went wrong, try again later")); ///  لو النتيجة مش Success ولا Error (حاجة unexpected) هرجع UnKnownError
    }
  }

  @override
  Future<ApiResult<List<Product>>> loadProducts({String? categoryId, String? subCategoryId}) async {  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو <List<Category> ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك طب انا هارجعوا <List<Product> لية  عشان هيبقا فية كمية products ودا عشان يتعمل بال mappers عشان تعرف ال api بتاع productResponse بس والحاجة الي هاستخدمها
    try {
      ApiResult<ProductsResponse> result = await _remoteDataSource.loadProducts(categoryId: categoryId, subCategoryId: subCategoryId); ///  هنا بنادي على الـ RemoteDataSource عشان يجيبلي ProductsResponse من API

      if (result.hasData) {  ///  لو النتيجة اللي رجعت من الـ RemoteDataSource كانت  Success  وكمان الداتا اللي رجعت من النوع ProductsResponse خلاص حملها وخليها تظهر
        return SuccessApiResult(
          _productMapper.fromDataModels(result.getData.data ?? []), ///  هنا برجع SuccessApiResult تاني لكن المرة دي Domain Model يعني الطبقات الأعلى (Bloc:cubit and  UI) هيستقبلوا Domain Model الجاهز للاستخدام
        );
      } else {
        return ErrorApiResult(result.getError); ///  لو النتيجة ErrorApiResult هرجع نفس الـ Error اللي جالي زي ما هو
      }
    } catch (e) {
      return ErrorApiResult(UnKnownError("Something went wrong, try again later")); ///  لو النتيجة مش Success ولا Error (حاجة unexpected) هرجع UnKnownError
    }
  }

  @override
  Future<ApiResult<List<Category>>> loadSubCategories(String categoryId) async {
    try {
      ApiResult<CategoriesResponse> result = await _remoteDataSource.loadSubCategories(categoryId); ///  هنا بنادي على الـ RemoteDataSource عشان يجيبلي  CategoriesResponse وبردو يجبلي ال loadSubCategories  من API

      if (result.hasData) { ///  لو النتيجة اللي رجعت من الـ RemoteDataSource كانت  Success  وكمان الداتا اللي رجعت من النوع CategoriesResponse خلاص حملها وخليها تظهر
        return SuccessApiResult(
          _categoryMapper.fromDataModels(result.getData.data), ///  هنا برجع SuccessApiResult تاني لكن المرة دي Domain Model يعني الطبقات الأعلى (Bloc:cubit and  UI) هيستقبلوا Domain Model الجاهز للاستخدام
        );
      } else {
        return ErrorApiResult(result.getError);  ///  لو النتيجة ErrorApiResult هرجع نفس الـ Error اللي جالي زي ما هو
      }
    } catch (e) {
      return ErrorApiResult(UnKnownError("Something went wrong, try again later")); ///  لو النتيجة مش Success ولا Error (حاجة unexpected) هرجع UnKnownError
    }
  }
}