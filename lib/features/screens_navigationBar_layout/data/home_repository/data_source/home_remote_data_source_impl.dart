import 'package:dio/dio.dart';
import 'package:shop_app/features/network/api/commerce_services.dart';
import 'package:shop_app/features/network/model/response/categories/categories_response.dart';
import 'package:shop_app/features/network/model/response/products/products_response.dart';

import 'package:shop_app/features/screens_navigationBar_layout/data/home_repository/data_source/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api_result/api_result.dart';

@Injectable(as: HomeRemoteDataSource)  /// اهم حاجة انا مستخدم Injectable الي هيا بال I كدا عشان  دية انا عملتها عشان اقولوا لو طلبت abstract class دا   (as: AuthRemoteDataSource) دا ابعتلي child ال (AuthRemoteDataSourceImpl) بتاعوا زي ال news كدا لما عملتها في get it فايل بالظبط  بس هنا بقا هايعملها لوحدوا generated
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource { /// فايدة حتة الي impl واعمل extend لل abstract class بتاعها هيا ال coupling  يعني لو حصل تغير فا انتا مثلا تغير في كلاس impl مش هايحصل حاجة لل abstract كلاس خالص ودا فايدتوا ان لو حصل تغير في ال project هنغير حاجة مثلا تروح تغيرها في ال impl2 وهيا كدا كدا هتسمع في ال abstract class و ال impl1  لانها فانكشن فاضية بس بتعملها override من عند ال impl 1 and 2 بس فا بتغير هناك بس انا مش عامل impl2 ليها بس
  final CommerceServices _commerceServices; ///انا بعتللك ال api اهو وعملتلو كونستراكتور

  HomeRemoteDataSourceImpl(this._commerceServices);

  @override
  Future<ApiResult<CategoriesResponse>> loadCategories() async { /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو CategoriesResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك
    try{
      return SuccessApiResult(await _commerceServices.loadCategories());   /// انا هنا بندة ال api بتاع ال  loadCategories وال retrofit package هاتكمل بقا ودية حلاوتها لانها عاملة genetrated لوحدها من عن طرق تكتب في ال terminal dart pub run build_runner build بس كدا وهيا تعمل api loadCategories هتلاقية معمول عندها في الفايل بتاعها وكمان رجعتها كا successApiResult
    }catch(e){
      if(e is DioException){ /// دية عشان نهندل الايرور ويطلع بطريقة حلوة في حالة لو النت فصل مثلا طب لو مش فاصل واكاتب حاجة غلط يظهرللك incorrectPasswordOrEmail
        return ErrorApiResult(ServerError(e.response?.data["message"]??"Something Went Wrong Please try Again"));
      }else{
        ///todo : handle errors
        return ErrorApiResult(ServerError("Oops! Please try Again.")); /// نفس الكلام بتاع ال success بس هرجع ايرور بس هنا
      }

    }
  }

  @override
  Future<ApiResult<ProductsResponse>> loadProducts({String? categoryId, String? subCategoryId}) async {  /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو ProductsResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك
    try{
      var productsResponse = categoryId != null ? await _commerceServices.loadProductsByCategory( /// وللة لو انا بعت categoryId اصلا مش ب null هتلكم ال api loadProductsByCategory  الي فيها بارميتارز وان كل  صورة من ال category تدوس عليها تجيب products بتاعتها
        categoryId,
        subCategoryId,
      )
          : await _commerceServices.loadProducts(); /// طب ايلس كلم ال api بتاعة loadProducts العادية بس
      return SuccessApiResult(productsResponse);
    }catch(e){
      if(e is DioException){ /// دية عشان نهندل الايرور ويطلع بطريقة حلوة في حالة لو النت فصل مثلا طب لو مش فاصل واكاتب حاجة غلط يظهرللك incorrectPasswordOrEmail
        return ErrorApiResult(ServerError(e.response?.data["message"]??"Something Went Wrong Please try Again"));
      }else{
        ///todo : handle errors
        return ErrorApiResult(ServerError("Oops! Please try Again.")); /// نفس الكلام بتاع ال success بس هرجع ايرور بس هنا
      }

    }
  }
  @override
  Future<ApiResult<CategoriesResponse>> loadSubCategories(String categoryId) async { /// انا هنا بقولوا رجعلي apiResults عشان لو فية ايرور كدا فهل هيبقا success or error or loading or initial  وكمان هيا مش هترجع api result بس لا هترجعوا علي انو CategoriesResponse ودية فايدة tempelete الي عملتها هناك في ال apiResult الانا عملتها هناك
    try{
      return SuccessApiResult(await _commerceServices.loadSubCategories(categoryId));   /// انا هنا بندة ال api بتاع ال  loadSubCategories وال retrofit package هاتكمل بقا ودية حلاوتها لانها عاملة genetrated لوحدها من عن طرق تكتب في ال terminal dart pub run build_runner build بس كدا وهيا تعمل api loadSubCategories هتلاقية معمول عندها في الفايل بتاعها وكمان رجعتها كا successApiResult
    }catch(e){
      if(e is DioException){ /// دية عشان نهندل الايرور ويطلع بطريقة حلوة في حالة لو النت فصل مثلا طب لو مش فاصل واكاتب حاجة غلط يظهرللك incorrectPasswordOrEmail
        return ErrorApiResult(ServerError(e.response?.data["message"]??"Something Went Wrong Please try Again"));
      }else{
        ///todo : handle errors
        return ErrorApiResult(ServerError("Oops! Please try Again.")); /// نفس الكلام بتاع ال success بس هرجع ايرور بس هنا
      }

    }
  }
  }