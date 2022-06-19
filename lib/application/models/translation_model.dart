import 'package:flutter/foundation.dart';

import 'package:translation/constants/language_constants.dart';

class TranslationModel {
  final String text;
  final LanguageTypes sourceLanguage;
  final DateTime translateTime;
  final Map<LanguageTypes, String> translatedTexts;
  TranslationModel({
    required this.text,
    required this.sourceLanguage,
    required this.translateTime,
    required this.translatedTexts,
  });

  TranslationModel copyWith({
    String? text,
    LanguageTypes? sourceLanguage,
    DateTime? translateTime,
    Map<LanguageTypes, String>? translatedTexts,
  }) {
    return TranslationModel(
      text: text ?? this.text,
      sourceLanguage: sourceLanguage ?? this.sourceLanguage,
      translateTime: translateTime ?? this.translateTime,
      translatedTexts: translatedTexts ?? this.translatedTexts,
    );
  }

  @override
  String toString() {
    return 'TranslationModel(text: $text, sourceLanguage: $sourceLanguage, translateTime: $translateTime, translatedTexts: $translatedTexts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TranslationModel &&
        other.text == text &&
        other.sourceLanguage == sourceLanguage &&
        other.translateTime == translateTime &&
        mapEquals(other.translatedTexts, translatedTexts);
  }

  @override
  int get hashCode {
    return text.hashCode ^
        sourceLanguage.hashCode ^
        translateTime.hashCode ^
        translatedTexts.hashCode;
  }
}
