import 'package:flutter_test/flutter_test.dart';
import 'package:translation/application/models/user_model.dart';
import 'package:translation/infrastructure/services/hive_service/hive_service.dart';

import '../mock_classses.dart';

void main() {
  test('User Model Tests', () {
    UserModel userModel = UserModel(history: []);
    expect(userModel == initialUserModel, true); // Equallity Operator

    userModel.history.add(mockTranslationModel);
    expect(userModel, UserModel(history: [mockTranslationModel]));
  });
}
