import 'dart:developer';

import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/models/user_model.dart';
import 'package:translation/domain/user_service_domain.dart';
import 'package:translation/infrastructure/services/hive_service/hive_service.dart';

// Singleton
class UserService extends UserServiceDomain {
  UserService._();
  static UserService instance = UserService._();

  @override
  Future<void> init() async {
    log("User Service Initiliazed. ");
    log("User Model: $userModel");
  }

  @override
  UserModel get userModel => HiveService.instance.getUserModelFromHive;

  @override
  Future<void> addTranslationToHistory(
    TranslationModel translationModel,
  ) async {
    if (userModel.history.contains(translationModel)) return;
    userModel.history.add(translationModel);
    await userModel.save();
  }

  @override
  Future<void> removeTranslationFromHistory(
    TranslationModel translationModel,
  ) async {
    if (!userModel.history.contains(translationModel)) return;
    userModel.history.remove(translationModel);
    await userModel.save();
  }
}
