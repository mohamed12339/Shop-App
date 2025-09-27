import 'package:shop_app/features/network/model/response/categories/category_dm.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/category.dart';
import 'package:injectable/injectable.dart';



@injectable /// دا عشان يعرف ال CategoryMapper عند ال get it
class CategoryMapper {   /// انا هنا ممكن اعملوا علي ال chatgpt بتاخد الكلاس بتاع ال domain source وكلاس ال data ال هوا categoriesResponse الي هوا دا (CategoryDM) وتحطهم في chatgpt   بس انا عملت كدا عشان افهم

  Category fromDataModel(CategoryDM category) {   ///دية هتاخد ال CategoryDM دا الي جواة  categoriesResponse  ترجعوا علي انوا Category الي جي من ال domain
    return Category(
      id: category.id ?? "",
      name: category.name ?? "",
      image: category.image ?? "",
    );
  }

  List<Category> fromDataModels(List<CategoryDM> categories) {  /// دية هتاخد ليستة من ال CategoryDM دا الي جواة  categoriesResponse  ترجعهولي علي انو ليست من ال Category
    return categories.map(fromDataModel).toList();
  }
}