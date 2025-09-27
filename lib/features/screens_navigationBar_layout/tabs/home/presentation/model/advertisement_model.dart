import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/core/utils/app_assets.dart';

class AdvertisementModel {
  final String firstTitle;
  final String secondTitle;

  final String description;
  final String imageUrl;

  AdvertisementModel({
    required this.firstTitle,
    required this.secondTitle,
    required this.description,
    required this.imageUrl,
  });

  static List<AdvertisementModel> getAdvertisements(AppLocalizations locale) {
    return [
      AdvertisementModel(
        firstTitle: locale.upTo,
        secondTitle: locale.fistOff,
        description: locale.advertisement1,
        imageUrl: AppImages.advertisement1,
      ),
      AdvertisementModel(
        firstTitle: locale.upTo,
        secondTitle: locale.secondOff,
        description: locale.advertisement2,
        imageUrl: AppImages.advertisement2,
      ),
      AdvertisementModel(
        firstTitle: locale.upTo,
        secondTitle: locale.thirdOff,
        description: locale.advertisement3,
        imageUrl: AppImages.advertisement3,
      ),
    ];
  }
}
