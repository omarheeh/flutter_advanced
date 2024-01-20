import 'package:doctormobile/core/networking/api_error_handler.dart';
import 'package:doctormobile/core/networking/api_result.dart';
import 'package:doctormobile/core/networking/api_service.dart';
import 'package:doctormobile/features/login/data/models/login_request_body.dart';
import 'package:doctormobile/features/login/data/models/login_respons.dart';
import 'package:doctormobile/features/login/data/repostres/login_repostres.dart';

class LoginRepostresImpl extends LoginRepostres {
  final ApiService _apiService;
  LoginRepostresImpl(this._apiService);

  @override
  Future<ApiResult<LoginRespons>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      LoginRespons loginRespons = await _apiService.login(loginRequestBody);
      return ApiResult.success(loginRespons);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
