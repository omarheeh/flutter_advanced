import 'package:doctormobile/core/helpers/extensions.dart';
import 'package:doctormobile/core/routing/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class AlredyHaveAccountText extends StatelessWidget {
  const AlredyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: ' Login',
              style: TextStyles.font13BlueSemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementName(Routes.loginScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
