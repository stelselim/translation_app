import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:translation/application/models/user_model.dart';
import 'package:translation/infrastructure/services/hive_service/hive_service.dart';

import '../mock_classses.dart';

void main() async {
  HiveService instance = HiveService.instance;
  group("Hive Services Tests", () {
    test("Initiliaze", () async {
      final path =
          await FakePathProviderPlatform().getApplicationDocumentsPath();

      expect(path, isNot(null));
      await instance.init(path!);
    });

    test("Check Boxes Opened ", () {
      expect(instance.userModelHiveBox.isOpen, true);
    });

    test("Get User Model", () async {
      final userModel = instance.getUserModelFromHive;

      expect(userModel, UserModel(history: []));
      expect(userModel.history, []);
    });
    test("removeLocalHiveTestDirectory", () async {
      await removeLocalHiveTestDirectory();

      expect(await Directory(kApplicationDocumentsPath).exists(), false);
    });
  });
}
