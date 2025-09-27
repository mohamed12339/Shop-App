import 'package:shop_app/core/theme/app_colors.dart';
import 'package:shop_app/features/cart/domain/entities/cart.dart';
import 'package:shop_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:shop_app/features/cart/presentation/cart_cubit/cart_state.dart';
import 'package:shop_app/features/cart/presentation/widgets/checkout_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../widgets/cart_product_widget.dart';
import '../widgets/cart_screen_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ///Lazy initialization
  late CartCubit cartCubit = BlocProvider.of(context); /// انا هنا بقولوا استني لما اجي استخدموا  وبعديها كريتوا مع اول مرة لما اجي استخدموا ودا معني Lazy initialization

  @override
  void initState() {
    super.initState();
    cartCubit.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartScreenAppbar(),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state.cartApiState.hasData) {
                  return buildCartView(state.cartApiState.getData);
                } else if (state.cartApiState.hasError) {
                  return Center(
                    child: Text(
                      state.cartApiState.getError.message,
                      style: TextStyle(color: AppColors.darkBlue),
                    ),
                  );
                } else {
                  if (state.latestCart != null) { /// هنا بقولوا لو فية cart موجودة اعرضها حتي لو انا loading
                    return buildCartView(state.latestCart!);
                  } else { ///لو مفيش خلاص اعرض CircularProgressIndicator
                    return Center(child: CircularProgressIndicator());
                  }
                }
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  buildCartView(Cart cart) {
    var products = cart.entries.values.toList(); /// انا هنا كنت عمالها ب map (key and value ) بس انا هنا عايزها ليستة دلوقتي
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return CartProductWidget(cartProduct: products[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: products.length,
          ),
        ),
        CheckoutSection(totalCartPrice: cart.totalPrice.toDouble()),
      ],
    );
  }
}
