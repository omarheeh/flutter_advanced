import 'package:doctormobile/core/helpers/spacing.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:doctormobile/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:doctormobile/features/singup/ui/widgets/alredy_have_account_text.dart';
import 'package:doctormobile/features/singup/ui/widgets/sign_up_listener.dart';
import 'package:doctormobile/features/singup/ui/widgets/signup_view_form.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyles.font24BlueBold,
              ),
              horizontalSpacint(8),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.font14GreyRegular,
              ),
              verticalSpacint(36),
              const SignupViewForm(),
              verticalSpacint(16),
              const TeamsAndConditionsText(),
              verticalSpacint(60),
              const AlredyHaveAccountText(),
              const SignupBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
