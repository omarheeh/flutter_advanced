import 'package:doctormobile/core/networking/api_result.dart';
import 'package:doctormobile/features/singup/data/models/signup_request_body.dart';
import 'package:doctormobile/features/singup/data/models/signup_response.dart';

abstract class SignupRepo {
  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody);
}
