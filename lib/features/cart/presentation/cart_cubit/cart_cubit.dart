import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/cart/domain/repository/cart_repository.dart';
import 'package:shop_app/features/cart/presentation/cart_cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable ///  هنا بقا i صغيرة مش كابيتال عشان دا مش abstract class وهنا كتبها عشان getit تعملوا ما هيا دية package injectable بتعمل حاجة getit بس generated لوحدها مش هتكتبها زي ال news

class CartCubit extends Cubit<CartState> { /// دا الـ Cubit الرئيسي اللي هيتحكم في الـ state بتاع LoadCartUseCase بس انا مش عاملها مش ليها لازمة ممكن معملهاش اصلا عادي فا نديت علي طول  CartRepository
  CartRepository cartRepository;

  CartCubit(this.cartRepository) : super(CartState.initial()); /// الي هاكتبوا في ال super عشان اعرفوا Cubit هيعمل اية بس وبعتلوا ال constructors

  Future<void> loadCart() async {  /// فانكشن عشان cart  مش بترجع حاجة

    emit(state.copyWith(cartApiState: LoadingApiResult())); /// انا هنا بقولوا الي هاتغير مين دلوقتي cartApiState واعمل loading

    var result = await cartRepository.getCart();     /// الانا عملتها هناك في ال CartRepository وبقولوا هات ال يقا ال cart

    emit(state.copyWith(cartApiState: result)); /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال cartApiState ونحدثوا بقا في ال ui
    if (result.hasData) {  /// طب خلاص انا دوست والداتا جت خلاص و success
      emit(state.copyWith(latestCart: result.getData)); /// خلاص بقا هات ال اخر cart عندك
    }
  }

  Future<void> addProductToCart(String productId) async {

    emit(state.copyWith(cartApiState: LoadingApiResult())); /// انا هنا بقولوا الي هاتغير مين دلوقتي cartApiState واعمل loading

    var result = await cartRepository.addProductToCart(productId); /// نفس الكلام الي فوق بس الفرق اني بقولوا ضيف ال product في ال cart بعتلوا ال product id عشان يعرف يضيفوا

    emit(state.copyWith(cartApiState: result)); /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال cartApiState ونحدثوا بقا في ال ui

    if (result.hasData) { /// نفس الكلام سطر 22 و 23
      emit(state.copyWith(latestCart: result.getData));
    }
  }

  Future<void> removeProduct(String productId) async {

    emit(state.copyWith(cartApiState: LoadingApiResult())); /// انا هنا بقولوا الي هاتغير مين دلوقتي cartApiState واعمل loading

    var result = await cartRepository.removeProductFromCart(productId);  /// نفس الكلام الي فوق بس الفرق اني بقولوا امسح ال product في ال cart بعتلوا ال product id عشان يعرف يمسحوا

    emit(state.copyWith(cartApiState: result));   /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال cartApiState ونحدثوا بقا في ال ui

    if (result.hasData) { /// نفس الكلام سطر 22 و 23
      emit(state.copyWith(latestCart: result.getData));
    }
  }

  Future<void> updateQuantity(String productId, int quantity) async {

    emit(state.copyWith(cartApiState: LoadingApiResult())); /// انا هنا بقولوا الي هاتغير مين دلوقتي cartApiState واعمل loading

    var result = await cartRepository.updateProductCartQuantity(   /// نفس الكلام الي فوق بس الفرق اني بقولوا update لو عايز اغير في ال product في ال cart الي هوا كان موجود اعمل تغيير علية  بعتلوا ال product id عشان يعرف اني واحد وبعتلوا الكمية بردو عشان لو فية كمية مثلا
      productId,
      quantity,
    );
    emit(state.copyWith(cartApiState: result));  /// هنا نفس الي state دية حاجة موجودة مع ال emit  بس الي هايتغير هوا ال cartApiState ونحدثوا بقا في ال ui

    if (result.hasData) { /// نفس الكلام سطر 22 و 23
      emit(state.copyWith(latestCart: result.getData));
    }
  }
}
