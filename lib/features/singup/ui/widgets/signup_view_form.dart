import 'package:doctormobile/core/helpers/appregex.dart';
import 'package:doctormobile/core/helpers/spacing.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:doctormobile/core/widgets/app_text_button.dart';
import 'package:doctormobile/core/widgets/app_text_form_field.dart';
import 'package:doctormobile/features/login/ui/widgets/password_validation.dart';
import 'package:doctormobile/features/singup/logic/cubit/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewForm extends StatefulWidget {
  const SignupViewForm({
    super.key,
  });

  @override
  State<SignupViewForm> createState() => _SignupViewFormState();
}

class _SignupViewFormState extends State<SignupViewForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            controller: context.read<SignupCubit>().nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
          ),
          verticalSpacint(16),
          AppTextFormField(
            hintText: 'Phone number',
            controller: context.read<SignupCubit>().phoneController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          verticalSpacint(16),
          AppTextFormField(
            hintText: 'Email',
            controller: context.read<SignupCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpacint(16),
          AppTextFormField(
            hintText: 'Password',
            controller: context.read<SignupCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
            isObsureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                isPasswordObscureText = !isPasswordObscureText;
                setState(() {});
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpacint(16),
          AppTextFormField(
            hintText: 'Password Confirmation',
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
            isObsureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                isPasswordConfirmationObscureText =
                    !isPasswordConfirmationObscureText;
                setState(() {});
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          verticalSpacint(40),
          AppTextButton(
            buttonText: 'Login',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {
              validatreThenDoLogin(context);
            },
          ),
          verticalSpacint(20),
          verticalSpacint(20),
          PasswordValidation(
            hasLowerCase: hasLowercase,
            hasUpderCase: hasUppercase,
            hasSpecialCharactors: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  void validatreThenDoLogin(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
}
