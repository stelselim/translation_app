import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:translation/presentation/core/app_widget.dart';
import 'package:translation/constants/localization_constant.dart' as constant;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: constant.supportedLocals,
      path: constant.localizationPath,
      fallbackLocale: constant.fallBackLocale,
      child: const App(),
    ),
  );
}
