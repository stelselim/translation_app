import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/models/user_model.dart';

abstract class UserServiceDomain {
  UserModel get userModel;

  Future<void> init();

  Future<void> addTranslationToHistory(TranslationModel translationModel);

  Future<void> removeTranslationFromHistory(TranslationModel translationModel);
}
