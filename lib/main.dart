import 'package:doctormobile/core/di/dependency_injection.dart';
import 'package:doctormobile/core/routing/app_router.dart';
import 'package:doctormobile/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  initDependencyInjection();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
