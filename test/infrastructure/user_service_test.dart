import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:translation/application/models/user_model.dart';
import 'package:translation/infrastructure/services/hive_service/hive_service.dart';
import 'package:translation/infrastructure/services/user_service.dart';

import '../mock_classses.dart';

void main() async {
  final userService = UserService.instance;
  group("UserService Tests", () {
    // Runs single time
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final path =
          await FakePathProviderPlatform().getApplicationDocumentsPath();

      await HiveService.instance.init(path!);
      await userService.init();
    });

    test("User Model", () async {
      final userModel = userService.userModel;

      // Check Initial Model
      expect(userModel, UserModel(history: []));
    });

    test("User Model History", () async {
      final userModel = userService.userModel;
      // Check User's History
      expect(userModel.history, []);
    });

    test("addTranslationToHistory", () async {
      await userService.addTranslationToHistory(mockTranslationModel);

      // Check Adding a translation
      expect(userService.userModel.history, [mockTranslationModel]);
    });

    test("removeTranslationFromHistory", () async {
      await userService.removeTranslationFromHistory(mockTranslationModel);
      // Check Removing a translation
      expect(userService.userModel.history, []);
    });

    test("removeLocalHiveTestDirectory", () async {
      await removeLocalHiveTestDirectory();

      expect(await Directory(kApplicationDocumentsPath).exists(), false);
    });
  });
}
