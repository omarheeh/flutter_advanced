import 'package:doctormobile/core/helpers/spacing.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:doctormobile/core/validator/validator.dart';
import 'package:doctormobile/core/widgets/app_text_button.dart';
import 'package:doctormobile/core/widgets/app_text_form_field.dart';
import 'package:doctormobile/features/login/data/models/login_request_body.dart';
import 'package:doctormobile/features/login/logic/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({
    super.key,
  });

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            controller: emailController,
            validator: (value) {
              return Validator.emailValidator(value);
            },
          ),
          verticalSpacint(16),
          AppTextFormField(
            hintText: 'Password',
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              } else {
                return null;
              }
            },
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
            onPressed: () {
              validatreThenDoLogin(context);
            },
          ),
          verticalSpacint(20),
        ],
      ),
    );
  }

  void validatreThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStae(
            LoginRequestBody(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
