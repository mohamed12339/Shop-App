import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import '../model/advertisement_model.dart';
import 'advertisement_card_widget.dart';

class AdvertisementsList extends StatefulWidget {
  const AdvertisementsList({super.key});

  @override
  State<AdvertisementsList> createState() => _AdvertisementsListState();
}

class _AdvertisementsListState extends State<AdvertisementsList> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 2,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return AdvertisementCardWidget(
              index: index,
              advertisement:
                  AdvertisementModel.getAdvertisements(
                    AppLocalizations.of(context)!,
                  )[index],
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
