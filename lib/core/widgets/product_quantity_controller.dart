import 'package:shop_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


class ProductQuantityController extends StatelessWidget {
  final int quantity; /// عملت دا عشان اتحكم في ال الكمية وحتة ال زائد والناقص بس
  final Function(int) onChanged;

  const ProductQuantityController({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              onChanged(quantity - 1); /// يبقا مهمة ال function onChanged  وعاملها عشان لما ادوس علي ال ناقص تشتغل وينقص الكمية وتظهر في ال cartScreen
            },
            icon: const Icon(Icons.remove, color: AppColors.white, size: 18,),
          ),
          Text(quantity.toString(), style: TextStyle(color: AppColors.white, fontSize: 14 )),
          IconButton(
            onPressed: () {
              onChanged(quantity + 1); /// يبقا مهمة ال function onChanged  وعاملها عشان لما ادوس علي ال الزائد تشتغل ويزود  الكمية وتظهر في ال cartScreen
            },
            icon: const Icon(Icons.add, color: AppColors.white, size: 18,),
          ),
        ],
      ),
    );
  }
}
