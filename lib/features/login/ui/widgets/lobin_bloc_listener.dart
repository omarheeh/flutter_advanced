import 'package:doctormobile/core/helpers/extensions.dart';
import 'package:doctormobile/core/routing/router.dart';
import 'package:doctormobile/core/theming/colors.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:doctormobile/features/login/logic/cubit/login/login_cubit.dart';
import 'package:doctormobile/features/login/logic/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Sucsess || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
              ),
            ),
          );
        }, sucsess: (loginRespons) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        }, failure: (errMessage) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              ),
              content: Text(
                errMessage,
                style: TextStyles.font15DarkBlueMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Got it',
                    style: TextStyles.font14BlueSemiBold,
                  ),
                ),
              ],
            ),
          );
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}
