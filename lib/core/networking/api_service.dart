import 'package:dio/dio.dart';
import 'package:doctormobile/core/networking/api_constants.dart';
import 'package:doctormobile/features/login/data/models/login_request_body.dart';
import 'package:doctormobile/features/login/data/models/login_respons.dart';
import 'package:doctormobile/features/singup/data/models/signup_request_body.dart';
import 'package:doctormobile/features/singup/data/models/signup_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginRespons> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> singup(@Body() SignupRequestBody singupRequestBody);
}
