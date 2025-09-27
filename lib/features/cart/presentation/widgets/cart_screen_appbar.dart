import 'package:shop_app/core/l10n/translations/app_localizations.dart';
import 'package:shop_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CartScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CartScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.cart),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppSvgs.searchIcon),
        ),
        IconButton(onPressed: () {

        }, icon: SvgPicture.asset(AppSvgs.cartIcon)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
