import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:translation/constants/language_constants.dart';

part 'translation_model.g.dart';

@HiveType(typeId: 0)
class TranslationModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String text;
  @HiveField(2)
  LanguageTypes sourceLanguage;
  @HiveField(3)
  DateTime translateTime;
  @HiveField(4)
  Map<LanguageTypes, String> translatedTexts;
  TranslationModel({
    required this.id,
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
      id: id,
      text: text ?? this.text,
      sourceLanguage: sourceLanguage ?? this.sourceLanguage,
      translateTime: translateTime ?? this.translateTime,
      translatedTexts: translatedTexts ?? this.translatedTexts,
    );
  }

  @override
  String toString() {
    return 'TranslationModel(id: $id, text: $text, sourceLanguage: $sourceLanguage, translateTime: $translateTime, translatedTexts: $translatedTexts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TranslationModel &&
        other.id == id &&
        other.text == text &&
        other.sourceLanguage == sourceLanguage &&
        other.translateTime == translateTime &&
        mapEquals(other.translatedTexts, translatedTexts);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        sourceLanguage.hashCode ^
        translateTime.hashCode ^
        translatedTexts.hashCode;
  }
}
