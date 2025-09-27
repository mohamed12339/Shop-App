import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/features/screens_navigationBar_layout/domian/model/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/app_assets.dart';


class WishlistProductWidget extends StatelessWidget {
  final Product? product;
  final int colorIndex;

  const WishlistProductWidget({
    super.key,
    required this.product,
    required this.colorIndex,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
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
            flex: 40,
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
                      product?.imageCover ?? NetworkImages.noImageAvailable,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      product?.title ?? '',
                      style: textTheme.headlineMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    '${product?.availableColors[colorIndex] ?? ''} ${locale.color}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.secondary.withValues(alpha: .6),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${locale.egp} ${product?.priceAfterDiscount ?? 0}',
                        style: textTheme.headlineMedium,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${locale.egp} ${product?.price ?? 0}',
                          style: textTheme.displaySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
                onPressed: () {},
                style: IconButton.styleFrom(
                  shape: CircleBorder(
                    side: BorderSide(width: 5, color: colorScheme.onPrimary),
                  ),
                ),
                icon: SvgPicture.asset(
                  AppSvgs.activeFavoriteIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(locale.addToCart),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
