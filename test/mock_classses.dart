import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:translation/application/entities/translation_entity.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/models/user_model.dart';
import 'package:translation/constants/language_constants.dart';

const kApplicationDocumentsPath = "applicationDocumentsPath";

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return kApplicationDocumentsPath;
  }

  @override
  Future<String?> getApplicationSupportPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getDownloadsPath() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> getExternalCachePaths() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getExternalStoragePath() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getLibraryPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getTemporaryPath() {
    throw UnimplementedError();
  }
}

// Removes local directory, created by Hive for testing.
Future<void> removeLocalHiveTestDirectory() async {
  try {
    await Directory(kApplicationDocumentsPath).delete(recursive: true);
  } catch (e) {
    print(e);
  }
}

///  Translation Constants
final _mockText = "hello";
final _mockSourceLanguageCode = "en";
final _mockSourceLanguage = LanguageTypes.english;
final _mockDateTime = DateTime(2020);
final _mockTranslatedTextsWithLanguageCode = {
  "tr": "merhaba",
};
final _mockTranslatedTexts = {
  LanguageTypes.turkish: "merhaba",
};

final Map<String, dynamic> mockTranslationMap = {
  "text": _mockText,
  "sourceLanguageCode": _mockSourceLanguageCode,
  "translateTime": _mockDateTime.millisecondsSinceEpoch,
  "translatedTextsWithLanguageCode": _mockTranslatedTextsWithLanguageCode,
};

TranslationEntity mockTranslationEntity = TranslationEntity(
  text: _mockText,
  sourceLanguageCode: _mockSourceLanguageCode,
  translateTime: _mockDateTime,
  translatedTextsWithLanguageCode: _mockTranslatedTextsWithLanguageCode,
);

TranslationModel mockTranslationModel = TranslationModel(
  id: "_getRandomId",
  text: _mockText,
  sourceLanguage: _mockSourceLanguage,
  translateTime: _mockDateTime,
  translatedTexts: _mockTranslatedTexts,
);
