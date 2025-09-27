import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CheckoutSection extends StatelessWidget {
  final double totalCartPrice;
  const CheckoutSection({super.key, required this.totalCartPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.totalPrice,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: .6),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${AppLocalizations.of(context)!.egp} $totalCartPrice',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              child: Row(
                spacing: 24,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.checkout),
                  SvgPicture.asset(AppSvgs.arrowForward, fit: BoxFit.scaleDown),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
