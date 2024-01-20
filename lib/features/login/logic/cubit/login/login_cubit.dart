import 'package:doctormobile/features/login/data/models/login_request_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctormobile/features/login/data/repostres/login_repostres.dart';
import 'package:doctormobile/features/login/logic/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepostres loginRepostres;
  LoginCubit(this.loginRepostres) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitLoginStae(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await loginRepostres.login(loginRequestBody);
    response.when(
      success: (loginResponse) => emit(LoginState.sucsess(loginResponse)),
      failure: (error) =>
          emit(LoginState.failure(error: error.apiErrorModel.message ?? '')),
    );
  }
}
