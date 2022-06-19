import 'package:translation/application/entities/translation_entity.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/domain/translate_domain.dart';
import 'package:translator/translator.dart';

class TranslateRepository extends TranslateDomain {
  @override
  Future<TranslationModel> translateToMultipleLanguage(
    String text,
    LanguageTypes sourceLanguage,
    List<LanguageTypes> translateLanguages,
  ) async {
    final List<Future<Translation>> translationList = [];
    final translator = GoogleTranslator();
    for (var element in translateLanguages) {
      final Future<Translation> translation = translator.translate(
        text,
        from: languageCode(sourceLanguage),
        to: languageCode(element),
      );
      translationList.add(translation);
    }

    final results = await Future.wait(translationList);
    Map<String, String> translatedTextsWithLanguageCodes = {};
    for (var res in results) {
      translatedTextsWithLanguageCodes[res.targetLanguage.code] = res.text;
    }

    final TranslationEntity translationEntity = TranslationEntity(
      text: text,
      sourceLanguageCode: languageCode(sourceLanguage),
      translateTime: DateTime.now(),
      translatedTextsWithLanguageCode: translatedTextsWithLanguageCodes,
    );

    return translationEntity.toTranslationModel();
  }

  @override
  Future<TranslationModel> translateToSingleLanguage(
    String text,
    LanguageTypes sourceLanguage,
    LanguageTypes translateLanguage,
  ) async {
    final translator = GoogleTranslator();
    final Translation translation = await translator.translate(
      text,
      from: languageCode(sourceLanguage),
      to: languageCode(translateLanguage),
    );

    final TranslationEntity translationEntity = TranslationEntity(
      text: text,
      sourceLanguageCode: languageCode(sourceLanguage),
      translateTime: DateTime.now(),
      translatedTextsWithLanguageCode: {
        translation.targetLanguage.code: translation.text,
      },
    );

    return translationEntity.toTranslationModel();
  }
}
