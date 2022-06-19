import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translation/infrastructure/services/hive_service/hive_service.dart';
import 'package:translation/infrastructure/services/user_service.dart';

Future<void> initiliazeMainServices() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await EasyLocalization.ensureInitialized();
  } catch (e) {
    log("Error on initiliazing EasyLocalization: $e");
  }

  try {
    await HiveService.instance.init();
  } catch (e) {
    log("Error on initiliazing HiveService: $e");
  }
  try {
    await UserService.instance.init();
  } catch (e) {
    log("Error on initiliazing UserService: $e");
  }
}
