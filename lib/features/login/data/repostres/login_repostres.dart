import 'package:doctormobile/core/networking/api_result.dart';
import 'package:doctormobile/features/login/data/models/login_request_body.dart';
import 'package:doctormobile/features/login/data/models/login_respons.dart';

abstract class LoginRepostres {
  Future<ApiResult<LoginRespons>> login(LoginRequestBody loginRequestBody);
}
