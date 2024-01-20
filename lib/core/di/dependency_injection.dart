import 'package:dio/dio.dart';
import 'package:doctormobile/core/networking/api_service.dart';
import 'package:doctormobile/core/networking/dio_factory.dart';
import 'package:doctormobile/features/login/data/repostres/login_repostres.dart';
import 'package:doctormobile/features/login/data/repostres/login_repostres_impl.dart';
import 'package:doctormobile/features/login/logic/cubit/login/login_cubit.dart';
import 'package:doctormobile/features/singup/data/repsotres/signup_repo.dart';
import 'package:doctormobile/features/singup/data/repsotres/signup_repo_impl.dart';
import 'package:doctormobile/features/singup/logic/cubit/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  //Dio and ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //feauter - login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt
      .registerLazySingleton<LoginRepostres>(() => LoginRepostresImpl(getIt()));

  //feauter - signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepoImpl(getIt()));
  getIt.registerFactory(() => SignupCubit(getIt()));
}
