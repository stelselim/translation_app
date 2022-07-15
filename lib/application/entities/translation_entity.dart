import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/infrastructure/utilities/get_random_id.dart';

class TranslationEntity {
  final String text;
  final String sourceLanguageCode;
  final DateTime translateTime;
  final Map<String, String> translatedTextsWithLanguageCode;
  TranslationEntity({
    required this.text,
    required this.sourceLanguageCode,
    required this.translateTime,
    required this.translatedTextsWithLanguageCode,
  });

  TranslationEntity copyWith({
    String? text,
    String? sourceLanguageCode,
    DateTime? translateTime,
    Map<String, String>? translatedTextsWithLanguageCode,
  }) {
    return TranslationEntity(
      text: text ?? this.text,
      sourceLanguageCode: sourceLanguageCode ?? this.sourceLanguageCode,
      translateTime: translateTime ?? this.translateTime,
      translatedTextsWithLanguageCode: translatedTextsWithLanguageCode ??
          this.translatedTextsWithLanguageCode,
    );
  }

  @override
  String toString() {
    return 'TranslationEntity(text: $text, sourceLanguageCode: $sourceLanguageCode, translateTime: $translateTime, translatedTextsWithLanguageCode: $translatedTextsWithLanguageCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TranslationEntity &&
        other.text == text &&
        other.sourceLanguageCode == sourceLanguageCode &&
        other.translateTime == translateTime &&
        mapEquals(other.translatedTextsWithLanguageCode,
            translatedTextsWithLanguageCode);
  }

  @override
  int get hashCode {
    return text.hashCode ^
        sourceLanguageCode.hashCode ^
        translateTime.hashCode ^
        translatedTextsWithLanguageCode.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'sourceLanguageCode': sourceLanguageCode,
      'translateTime': translateTime.millisecondsSinceEpoch,
      'translatedTextsWithLanguageCode': translatedTextsWithLanguageCode,
    };
  }

  factory TranslationEntity.fromMap(Map<String, dynamic> map) {
    return TranslationEntity(
      text: map['text'] ?? '',
      sourceLanguageCode: map['sourceLanguageCode'] ?? '',
      translateTime: DateTime.fromMillisecondsSinceEpoch(map['translateTime']),
      translatedTextsWithLanguageCode:
          Map<String, String>.from(map['translatedTextsWithLanguageCode']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TranslationEntity.fromJson(String source) =>
      TranslationEntity.fromMap(json.decode(source));

  TranslationModel toTranslationModel({String? id}) {
    return TranslationModel(
      id: id ?? getRandomId,
      text: text,
      sourceLanguage: languageTypeFromCode(sourceLanguageCode),
      translateTime: translateTime,
      translatedTexts: translatedTextsWithLanguageCode.map(
        (key, value) => MapEntry(languageTypeFromCode(key), value),
      ),
    );
  }
}
