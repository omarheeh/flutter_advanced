import 'package:doctormobile/core/helpers/spacing.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:doctormobile/core/widgets/app_text_button.dart';
import 'package:doctormobile/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({
    super.key,
  });

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          AppTextFormField(hintText: 'Email'),
          verticalSpacint(16),
          AppTextFormField(
            hintText: 'Password',
            isObsureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                isObscureText = !isObscureText;
                setState(() {});
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpacint(25),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: TextStyles.font13BlueRegular,
            ),
          ),
          verticalSpacint(40),
          AppTextButton(
            buttonText: 'Login',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
