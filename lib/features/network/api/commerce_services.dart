import 'package:dio/dio.dart' hide Headers;
import 'package:shop_app/features/network/model/request/cart/add_product_request.dart';
import 'package:shop_app/features/network/model/request/cart/update_product_quantity_request.dart';
import 'package:shop_app/features/network/model/request/login_request/login_request.dart';
import 'package:shop_app/features/network/model/request/register_request/register_request.dart';
import 'package:shop_app/features/network/model/response/cart/cart_response.dart';
import 'package:shop_app/features/network/model/response/categories/categories_response.dart';
import 'package:shop_app/features/network/model/response/products/products_response.dart';
import 'package:shop_app/features/network/model/response/token_request/token_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'commerce_services.g.dart'; /// دا هيتعمل لوحدوا عن طريق   build_runner

@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
@injectable /// دا عشان يعرف ال CommerceServices عند ال get it
abstract class CommerceServices { /// طب عشان استخدمها بقا
  @factoryMethod /// دا  كمان بردوا عشان يعرف ال CommerceServices عند ال get it
  factory CommerceServices(Dio dio) = _CommerceServices; /// الفايل دا ضارب ايرور او لما كان ضارب ايرور عشان انا نزلت retrofit package موجودة dependicece وال dev dependancies وال dev دية هيا عبارة عن انك زي بعمل test لحاجة او بضيف كود لوحدوا مجرد اكتب حاجة في ال terminal وهوا يضيفها لوحدوا بس  بتعمل generate لوحدها عشان تعمل clean architecture لوحدها مش زي ال news لما عملتوا فيها  فا لما تحط كدا كود dart pub run build_runner build في ال terminal هيعمل الفايل دا لوحدوا


  @POST('/auth/signin')
  Future<TokenResponse> login(@Body() LoginRequest loginRequest); ///  دية @Body() عشان يعرف يعمل generate لل _CommerceServices بدل ما روحت وعملت في ال news عملت apiManager لا هنا انا عرفت نوعوا اية زي post واديتوا ال ال path يعني بس وهوا عملوا نفس الكلام برودو في ال login وال token وال user

  @POST("/auth/signup")
  @Headers(<String, String>{'Content-Type': 'application/json',})/// بعض السيرفرات لازم يكون الهيدر application/json فالازم كنت اكتب دية عشان ال register يشتغل كانت لازم
  Future<TokenResponse> register(@Body() RegisterRequest request); ///  دية @Body() عشان يعرف يعمل generate لل _CommerceServices بدل ما روحت وعملت في ال news عملت apiManager لا هنا انا عرفت نوعوا اية زي post واديتوا ال ال path يعني بس وهوا عملوا نفس الكلام برودو في ال register وال token وال user

  @GET('/categories')
  Future<CategoriesResponse> loadCategories();   ///  دية  عشان يعرف يعمل  generate لل _CommerceServices بس المرادي مش بعتلوا حاجة ولا body ولا query  بدل ما روحت وعملت في ال news عملت apiManager لا هنا انا عرفت نوعوا اية زي get واديتوا ال ال path يعني بس

  @GET('/products')
  Future<ProductsResponse> loadProducts(); ///  دية بردوا  عشان يعرف يعمل  generate لل _CommerceServices بس المرادي مش بعتلوا حاجة ولا body ولا query  بدل ما روحت وعملت في ال news عملت apiManager لا هنا انا عرفت نوعوا اية زي get واديتوا ال ال path يعني بس

  @GET('/products?category={categoryId}&category={subCategoryId}')
  Future<ProductsResponse> loadProductsByCategory( ///  دية بردوا  عشان يعرف يعمل  generate لل _CommerceServices بس المرادي مش بعتلوا حاجة ولا body ولا query  بدل ما روحت وعملت في ال news عملت apiManager لا هنا انا عرفت نوعوا اية زي get واديتوا ال ال path يعني  وعشان استخدم دا String categoryId and subCategoryId هنا @GET('/products?category={categoryId}&category={subCategoryId}') لازم اقولوا @Path وعشان لما اجي ادوس علي صور ال category يوديني علي ال products بتاعها
      @Path() String? categoryId,
      @Path() String? subCategoryId,
      );

  @GET("/categories/{categoryId}/subcategories")
  Future<CategoriesResponse> loadSubCategories(@Path() String categoryId); ///  دية بردوا  عشان يعرف يعمل  generate لل _CommerceServices بس المرادي مش بعتلوا حاجة ولا body ولا query  بدل ما روحت وعملت في ال news عملت apiManager لا هنا انا عرفت نوعوا اية زي get واديتوا ال ال path يعني  وعشان استخدم دا String categoryId هنا @GET("/categories/{categoryId}/subcategories") لازم اقولوا @Path


  @GET("/cart")
  Future<CartResponse> getCart(); ///  دية بردوا  عشان يعرف يعمل  generate لل _CommerceServices بس المرادي مش بعتلوا حاجة ولا body ولا query  بدل ما روحت وعملت في ال news عملت apiManager لا هنا انا عرفت نوعوا اية زي get

  @POST("/cart")
  Future<dynamic> addProductToCart(@Body() AddProductRequest request); /// هنا بعمل add علي علامة الزائد انو يزود product تاني في ال cart

  @PUT("cart/{productId}")
  Future<CartResponse> updateProductQuantity( /// ودا هايعمل update لل الكمية الي هيا count وبعتلوا Path id بتاع ال product
      @Body() UpdateProductQuantityRequest request,
      @Path() String productId,
      );

  @DELETE("cart/{productId}")
  Future<CartResponse> removeProductFromCart(@Path() productId); /// دا هيمسح ال product من ال cart
}
