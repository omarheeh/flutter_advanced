import 'package:doctormobile/core/helpers/extensions.dart';
import 'package:doctormobile/core/routing/router.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'dont\'t have an account?',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
                text: ' Sign Up',
                style: TextStyles.font13BlueSemiBold,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacementName(Routes.signupScreen);
                  }),
          ],
        ),
      ),
    );
  }
}
