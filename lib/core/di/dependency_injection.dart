import 'package:dio/dio.dart';
import 'package:doctormobile/core/networking/api_service.dart';
import 'package:doctormobile/core/networking/dio_factory.dart';
import 'package:doctormobile/features/login/data/repostres/login_repostres.dart';
import 'package:doctormobile/features/login/data/repostres/login_repostres_impl.dart';
import 'package:doctormobile/features/login/logic/cubit/login/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  //Dio and ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //feuter - login
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt
      .registerLazySingleton<LoginRepostres>(() => LoginRepostresImpl(getIt()));
}
