import 'package:advanced_flutter_project/core/di/dependency_injection.dart';
import 'package:advanced_flutter_project/core/routes/app_router.dart';
import 'package:advanced_flutter_project/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setUpGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
