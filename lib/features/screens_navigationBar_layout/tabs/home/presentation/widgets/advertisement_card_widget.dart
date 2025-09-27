import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/core/theme/app_colors.dart';

import '../model/advertisement_model.dart';

class AdvertisementCardWidget extends StatelessWidget {
  final int index;
  final AdvertisementModel advertisement;

  const AdvertisementCardWidget({
    super.key,
    required this.advertisement,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: index == 0 ? 16 : 48),
          margin: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(advertisement.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                index == 1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    advertisement.firstTitle,
                    style: textTheme.titleMedium?.copyWith(
                      color:
                          index == 1
                              ? colorScheme.onPrimary
                              : colorScheme.primary,
                    ),
                  ),
                  Text(
                    advertisement.secondTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 28,
                      color:
                          index == 1
                              ? colorScheme.onPrimary
                              : colorScheme.primary,
                    ),
                  ),
                  Text(
                    advertisement.description,
                    style: textTheme.titleSmall?.copyWith(
                      color:
                          index == 1
                              ? colorScheme.onPrimary
                              : colorScheme.primary,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          index == 1 ? AppColors.white : AppColors.blue,
                      foregroundColor:
                          index == 1 ? AppColors.blue : AppColors.white,
                    ),
                    child: Text(
                      locale.shopNow,
                      style: textTheme.labelSmall?.copyWith(
                        color:
                            index == 1
                                ? colorScheme.primary
                                : colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 8,
          child: DotsIndicator(
            dotsCount: 3,
            position: index.toDouble(),
            decorator: DotsDecorator(
              color: colorScheme.onPrimary,
              activeColor: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
