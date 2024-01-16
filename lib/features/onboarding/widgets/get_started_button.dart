import 'package:doctormobile/core/helpers/extensions.dart';
import 'package:doctormobile/core/routing/router.dart';
import 'package:doctormobile/core/theming/colors.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(ColorsManager.primaryColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 52)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        onPressed: () {
          context.pushNamed(Routes.loginScreen);
        },
        child: Text(
          'Get Started',
          style: TextStyles.font16WhiteSemiBold,
        ));
  }
}
