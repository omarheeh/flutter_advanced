import 'package:doctormobile/core/helpers/spacing.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:doctormobile/features/login/ui/widgets/already_have_account_text.dart';
import 'package:doctormobile/features/login/ui/widgets/lobin_bloc_listener.dart';
import 'package:doctormobile/features/login/ui/widgets/login_view_form.dart';
import 'package:doctormobile/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              horizontalSpacint(8),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GreyRegular,
              ),
              verticalSpacint(36),
              const LoginViewForm(),
              verticalSpacint(16),
              const TermsAndConditionsText(),
              verticalSpacint(60),
              const AlreadyHaveAccountText(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
