import 'package:flutter_test/flutter_test.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/infrastructure/repositories/translate_repository.dart';

void main() {
  group("Translate Repository Tests", () {
    final translateRepository = TranslateRepository();

    test("\nMultiple Language Translation - EN->FR", () async {
      print("Translating from English to French.");
      const languageIndex = 0;

      final translation_1 =
          await translateRepository.translateToMultipleLanguage(
        text_1,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES,
      );

      final translation_2 =
          await translateRepository.translateToMultipleLanguage(
        text_2,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES,
      );
      final result_1 =
          translation_1.translatedTexts[TARGET_LANGUAGES[languageIndex]];
      final result_2 =
          translation_2.translatedTexts[TARGET_LANGUAGES[languageIndex]];

      expect(result_1, text_1_french);
      print("$text_1 -> $text_1_french");
      expect(result_2, text_2_french);
      print("$text_2 -> $text_2_french");
    });

    test("\nMultiple Language - EN->TR", () async {
      print("Translating from English to Turkish.");
      const languageIndex = 1;

      final translation_1 =
          await translateRepository.translateToMultipleLanguage(
        text_1,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES,
      );

      final translation_2 =
          await translateRepository.translateToMultipleLanguage(
        text_2,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES,
      );
      final result_1 =
          translation_1.translatedTexts[TARGET_LANGUAGES[languageIndex]];
      final result_2 =
          translation_2.translatedTexts[TARGET_LANGUAGES[languageIndex]];

      expect(result_1, text_1_turkish);
      print("$text_1 -> $text_1_turkish");
      expect(result_2, text_2_turkish);
      print("$text_2 -> $text_2_turkish");
    });

    test("\n\nSingle Language Translation - EN->FR", () async {
      print("Translating from English to French.");
      const languageIndex = 0;

      final translation_1 = await translateRepository.translateToSingleLanguage(
        text_1,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES[languageIndex],
      );

      final translation_2 = await translateRepository.translateToSingleLanguage(
        text_2,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES[languageIndex],
      );
      final result_1 =
          translation_1.translatedTexts[TARGET_LANGUAGES[languageIndex]];
      final result_2 =
          translation_2.translatedTexts[TARGET_LANGUAGES[languageIndex]];

      expect(result_1, text_1_french);
      print("$text_1 -> $text_1_french");
      expect(result_2, text_2_french);
      print("$text_2 -> $text_2_french");
    });

    test("\nSingle Language Translation - EN->TR", () async {
      print("Translating from English to Turkish.");
      const languageIndex = 1;

      final translation_1 = await translateRepository.translateToSingleLanguage(
        text_1,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES[languageIndex],
      );

      final translation_2 = await translateRepository.translateToSingleLanguage(
        text_2,
        SOURCE_LANGUAGE,
        TARGET_LANGUAGES[languageIndex],
      );
      final result_1 =
          translation_1.translatedTexts[TARGET_LANGUAGES[languageIndex]];
      final result_2 =
          translation_2.translatedTexts[TARGET_LANGUAGES[languageIndex]];

      expect(result_1, text_1_turkish);
      print("$text_1 -> $text_1_turkish");
      expect(result_2, text_2_turkish);
      print("$text_2 -> $text_2_turkish");
    });
  });
}

/// Translate Repository Test Constants
// Variables
const SOURCE_LANGUAGE = LanguageTypes.english;
const TARGET_LANGUAGES = [
  LanguageTypes.french,
  LanguageTypes.turkish,
];
const text_1 = "hello";
const text_2 = "What is your name?";

// Extpected Results
const text_1_french = "bonjour";
const text_2_french = "Quel est ton nom?";

const text_1_turkish = "merhaba";
const text_2_turkish = "Adın ne?";
