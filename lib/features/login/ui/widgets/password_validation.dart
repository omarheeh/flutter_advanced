import 'package:doctormobile/core/helpers/spacing.dart';
import 'package:doctormobile/core/theming/colors.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpderCase,
    required this.hasSpecialCharactors,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowerCase;
  final bool hasUpderCase;
  final bool hasSpecialCharactors;
  final bool hasNumber;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpacint(2),
        buildValidationRow('At least 1 uppercase letter', hasUpderCase),
        verticalSpacint(2),
        buildValidationRow(
            'At least 1 special charactor', hasSpecialCharactors),
        verticalSpacint(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpacint(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.grey,
        ),
        horizontalSpacint(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.grey : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
