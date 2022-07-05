import 'package:hive/hive.dart';

part 'language_constants.g.dart';

@HiveType(typeId: 1)
enum LanguageTypes {
  @HiveField(0)
  invalid,
  @HiveField(1)
  afrikaans,
  @HiveField(2)
  arabic,
  @HiveField(3)
  english,
  @HiveField(4)
  french,
  @HiveField(5)
  turkish,
  @HiveField(6)
  italian,
  @HiveField(7)
  spanish,
  @HiveField(8)
  chineseSimplified
}

String languageString(LanguageTypes language) {
  switch (language) {
    case LanguageTypes.afrikaans:
      return "Afrikaans";
    case LanguageTypes.arabic:
      return "Arabic";
    case LanguageTypes.chineseSimplified:
      return "Chinese Simplified";
    case LanguageTypes.english:
      return "English";
    case LanguageTypes.french:
      return "French";
    case LanguageTypes.turkish:
      return "Turkish";
    case LanguageTypes.italian:
      return "Italian";
    case LanguageTypes.spanish:
      return "Spanish";
    case LanguageTypes.invalid:
      return "Invalid Language";
  }
}

String languageCode(LanguageTypes language) {
  switch (language) {
    case LanguageTypes.afrikaans:
      return "af";
    case LanguageTypes.arabic:
      return "ar";
    case LanguageTypes.chineseSimplified:
      return "zh-cn";
    case LanguageTypes.english:
      return "en";
    case LanguageTypes.french:
      return "fr";
    case LanguageTypes.turkish:
      return "tr";
    case LanguageTypes.italian:
      return "it";
    case LanguageTypes.spanish:
      return "es";
    case LanguageTypes.invalid:
      return "invalid";
  }
}

LanguageTypes languageTypeFromCode(String code) {
  switch (code) {
    case "af":
      return LanguageTypes.afrikaans;
    case "ar":
      return LanguageTypes.arabic;
    case "zh-cn":
      return LanguageTypes.chineseSimplified;
    case "en":
      return LanguageTypes.english;
    case "fr":
      return LanguageTypes.french;
    case "tr":
      return LanguageTypes.turkish;
    case "it":
      return LanguageTypes.italian;
    case "es":
      return LanguageTypes.spanish;
    default:
      return LanguageTypes.invalid;
  }
}

List<LanguageTypes> kAllLanguages = [
  LanguageTypes.afrikaans,
  LanguageTypes.arabic,
  LanguageTypes.chineseSimplified,
  LanguageTypes.english,
  LanguageTypes.french,
  LanguageTypes.italian,
  LanguageTypes.spanish,
  LanguageTypes.turkish,
];
