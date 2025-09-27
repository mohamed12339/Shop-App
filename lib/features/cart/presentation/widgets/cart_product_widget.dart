import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/features/cart/domain/entities/cart_entry.dart';
import 'package:shop_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class CartProductWidget extends StatelessWidget {
  final CartEntry cartProduct; /// انا عايز فيها عندي قد اية من ال product ومجموع السعر بتاعوا

  const CartProductWidget({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: 112,
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: .3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: .3),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl:
                      cartProduct.product.imageCover,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      cartProduct.product.title,
                      style: textTheme.headlineMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    "",
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.secondary.withValues(alpha: .6),
                    ),
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.egp} ${cartProduct.totalProductPrice}', /// هنا اهو بقولوا هات مجموع السعر
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () { /// هنا بقولوا امسح بقا ال product وبعتلوا product.id بتاعوا عشان يمسحوا
                  BlocProvider.of<CartCubit>(context).removeProduct(
                    cartProduct.product.id,
                  );
                },
                icon: const Icon(Iconsax.trash_outline),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {  /// هنا بقولوا هات ال product.id ومعاة الكمية بتاعتوا والي موجود منوا دلوقتي بس ناقص 1
                        BlocProvider.of<CartCubit>(context).updateQuantity(
                          cartProduct.product.id,
                          cartProduct.quantity - 1,
                        );
                      },
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: colorScheme.onPrimary,
                        size: 30,
                      ),
                    ),
                    Text(
                      cartProduct.quantity.toString(),
                      style: textTheme.headlineMedium?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                    InkWell(
                      onTap: () { /// هنا نفس كلام سطر 111 بس المرادي بقولوا بقا زود الكمية يعني 1
                        BlocProvider.of<CartCubit>(context).updateQuantity(
                          cartProduct.product.id,
                          cartProduct.quantity + 1,
                        );
                      },
                      child: Icon(
                        Icons.add_circle_outline,
                        color: colorScheme.onPrimary,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
