import 'package:doctormobile/core/routing/router.dart';
import 'package:doctormobile/features/home/ui/view/home_view.dart';
import 'package:doctormobile/features/login/logic/cubit/login/login_cubit.dart';
import 'package:doctormobile/features/login/ui/view/login_view.dart';
import 'package:doctormobile/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctormobile/core/di/dependency_injection.dart' as di;

class AppRouter {
  Route generatRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di.getIt<LoginCubit>(),
            child: LoginView(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No router defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
