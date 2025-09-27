import 'package:shop_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import 'custom_search_field.dart';


class SearchAndCartWidget extends StatelessWidget {
  const SearchAndCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          Expanded(child: CustomSearchField()),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.cartRoute);
            },
            child: SvgPicture.asset(AppSvgs.cartIcon),
          ),
        ],
      ),
    );
  }
}
