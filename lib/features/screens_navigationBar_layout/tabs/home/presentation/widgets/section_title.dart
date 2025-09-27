import 'package:shop_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool? viewAllVisibility;

  const SectionTitle({super.key, required this.title, this.viewAllVisibility});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            Visibility(
              visible: viewAllVisibility ?? false,
              child: TextButton(
                onPressed: () {
                 Navigator.push(context, Routes.categoryTab);
                },
                child: Text(
                  locale.viewAll,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
