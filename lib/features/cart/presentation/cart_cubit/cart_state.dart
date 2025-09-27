
import 'package:shop_app/core/api_result/api_result.dart';
import 'package:shop_app/features/cart/domain/entities/cart.dart';

class CartState { /// دا الـ state اللي هيحتفظ بالـ data والحالات (Initial, Loading, Success, Error) وهابتعها لل cubit

  late ApiResult<Cart> cartApiState; /// هنا بخزن بقا ال ليستة ال Cart الانا هاستخدمها

  Cart? latestCart; ///  هنا دية مهمتها انها تخزن اخر cart دوست عليها بمعني اول واحدة دوست عليها تبقا موجودة ولو ودوست علي تاني واحدة تبقا الاولي بقا تبقا موجودة بس

  CartState({required this.cartApiState, this.latestCart});

  CartState.initial() {  /// والي هابعتها لل super  (الحالة الابتدائية قبل ما نجيب أي بيانات) initial state
    cartApiState = InitialApiResult();
  }

  CartState copyWith({ /// زي ال colors لما بقولوا غير الحتة بس بلون كزا فا ال  copyWith بتسهل علينا تحديث الـ state من غير ما نغير القديم كله
    ApiResult<Cart>? cartApiState,  /// انا هنا بقولوا الي هاتغير مين دلوقتي cartApiState وممكن تبقا ب null بردوا
    Cart? latestCart /// انا هنا بقولوا الي هاتغير مين دلوقتي latestCart وممكن تبقا ب null بردوا
  }) {
    return CartState(
      cartApiState: cartApiState ?? this.cartApiState, /// لو جاب  cart جديدة استخدمها ، غير كده خلي القديم
      latestCart: latestCart ?? this.latestCart, /// لو جاب  cart جديدة استخدمها ، غير كده خلي اخر cart كانت موجودة
    );
  }
}
