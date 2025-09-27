import 'package:flutter/material.dart';
import 'package:shop_app/core/theme/app_colors.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final String title;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String? )? validator;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.title,
    this.isPassword = false,
    this.validator,
    this.controller,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscureText = true; // الحالة الافتراضية (مخفي)

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 24),

        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword ? _obscureText : false,

          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[700]!, width: 2),
            ),

            // هنا نحط الـ suffixIcon
            suffixIcon: widget.isPassword ? InkWell(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              }, child: Icon(_obscureText ? Icons.visibility_off : Icons.remove_red_eye, color: AppColors.grey,),) : null, ///هنا بقولوا لو انتا مخفي او مش كات حاجة  اظهر ايكون العين الي عليها شرطة ايلس : ظاهر خلي العين من غير شرطة  وانتا بتدوس عليها
          ),
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }
}