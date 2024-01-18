import 'package:doctormobile/core/theming/colors.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObsureText = false,
    this.suffixIcon,
    this.backgroundColor,
  });
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool isObsureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14GreyMedium,
        fillColor: backgroundColor ?? ColorsManager.paleGrey,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.w),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.3,
                color: ColorsManager.primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.3,
                color: ColorsManager.lighterGrey,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        suffixIcon: suffixIcon,
      ),
      obscureText: isObsureText,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
    );
  }
}
