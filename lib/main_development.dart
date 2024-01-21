import 'package:doctormobile/core/di/dependency_injection.dart';
import 'package:doctormobile/core/routing/app_router.dart';
import 'package:doctormobile/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  initDependencyInjection();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
