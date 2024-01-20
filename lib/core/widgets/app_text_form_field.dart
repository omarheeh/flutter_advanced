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
    this.controller,
    required this.validator,
  });
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool isObsureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14GreyMedium,
        fillColor: backgroundColor ?? ColorsManager.paleGrey,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.w),
        focusedBorder: focusedBorder ?? myBorder(ColorsManager.primaryColor),
        enabledBorder: enabledBorder ?? myBorder(ColorsManager.lighterGrey),
        errorBorder: myBorder(Colors.red),
        focusedErrorBorder: myBorder(Colors.red),
        suffixIcon: suffixIcon,
      ),
      obscureText: isObsureText,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
    );
  }

  OutlineInputBorder myBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.3,
        color: color,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
