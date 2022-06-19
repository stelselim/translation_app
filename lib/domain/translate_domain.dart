import 'package:translation/application/models/translation_model.dart';
import 'package:translation/constants/language_constants.dart';

abstract class TranslateDomain {
  Future<TranslationModel> translateToSingleLanguage(
    String text,
    LanguageTypes sourceLanguage,
    LanguageTypes translateLanguage,
  );
  Future<TranslationModel> translateToMultipleLanguage(
    String text,
    LanguageTypes sourceLanguage,
    List<LanguageTypes> translateLanguages,
  );
}
