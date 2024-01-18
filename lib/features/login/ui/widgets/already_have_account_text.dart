import 'package:doctormobile/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account yet?',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: ' Sign Up',
              style: TextStyles.font13BlueSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
