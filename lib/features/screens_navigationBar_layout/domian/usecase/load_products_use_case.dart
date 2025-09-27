import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news

 class LoadProductsUseCase {
  final HomeRepository _homeRepository ;  ///  دا عشان احمل الداتا الي هيا فيها بقا Products  الانا هاستخدمها  بس وعرفتلوا ال HomeRepository بتاعة ال domain ودا سبب اني بحط ال HomeRepository في ال domain عشان ال useCase

  LoadProductsUseCase(this._homeRepository);

  Future<ApiResult<List<Product>>> call({String? categoryId, String? subCategory,}) => _homeRepository.loadProducts(categoryId: categoryId, subCategoryId: categoryId);  /// وهنا عرفتوا الفانكشن الي هاستخمها بتاعة ال HomeRepository بس كدا دا ال useCase وال الحاجة الي هعملها او هاستخدمها يعني لما ادوس علي صور ال category يجبلي ال products بتاعتاها
}