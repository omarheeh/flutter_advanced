import 'package:doctormobile/core/networking/api_error_handler.dart';
import 'package:doctormobile/core/networking/api_result.dart';
import 'package:doctormobile/core/networking/api_service.dart';
import 'package:doctormobile/features/singup/data/models/signup_request_body.dart';
import 'package:doctormobile/features/singup/data/models/signup_response.dart';
import 'package:doctormobile/features/singup/data/repsotres/signup_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final ApiService _apiService;
  SignupRepoImpl(this._apiService);
  @override
  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      SignupResponse signupResponse =
          await _apiService.singup(signupRequestBody);
      return ApiResult.success(signupResponse);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
