import 'package:doctormobile/core/routing/router.dart';
import 'package:doctormobile/features/login/ui/view/login_view.dart';
import 'package:doctormobile/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

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
          builder: (_) => const LoginView(),
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
