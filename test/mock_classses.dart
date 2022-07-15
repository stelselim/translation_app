import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:translation/application/models/translation_model.dart';
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

TranslationModel mockTranslationModel = TranslationModel(
  id: "_getRandomId",
  text: "hello",
  sourceLanguage: LanguageTypes.english,
  translateTime: DateTime(2020),
  translatedTexts: {
    LanguageTypes.turkish: "merhaba",
  },
);

// Removes local directory, created by Hive for testing.
Future<void> removeLocalHiveTestDirectory() async {
  try {
    await Directory(kApplicationDocumentsPath).delete(recursive: true);
  } catch (e) {
    print(e);
  }
}
