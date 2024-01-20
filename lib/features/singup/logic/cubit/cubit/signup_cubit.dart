import 'package:doctormobile/core/networking/api_result.dart';
import 'package:doctormobile/features/singup/data/models/signup_request_body.dart';
import 'package:doctormobile/features/singup/data/models/signup_response.dart';
import 'package:doctormobile/features/singup/data/repsotres/signup_repo.dart';
import 'package:doctormobile/features/singup/logic/cubit/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(SignupState.initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    ApiResult<SignupResponse> apiResult =
        await signupRepo.signup(SignupRequestBody(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      gender: 0,
      password: passwordController.text,
      passwordConfirmation: passwordController.text,
    ));
    apiResult.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
