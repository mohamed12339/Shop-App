import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:injectable/injectable.dart';
import '../repository/home_repository.dart';

@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news

class LoadSubCategoriesUseCase {

  final HomeRepository _homeRepository; ///  دا عشان احمل الداتا الي هيا فيها بقا  SubCategories  والي هاستخدم فيها categoryId عشان لما اجيادوس علس تابة يروح علي ال category بتاعها   وعرفتلوا ال HomeRepository بتاعة ال domain ودا سبب اني بحط ال HomeRepository في ال domain عشان ال useCase

  LoadSubCategoriesUseCase(this._homeRepository);

  Future<ApiResult<List<Category>>> call(String categoryId) => _homeRepository.loadSubCategories(categoryId); /// وهنا عرفتوا الفانكشن الي هاستخمها بتاعة ال HomeRepository بس كدا دا ال useCase
}
