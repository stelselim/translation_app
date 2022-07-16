import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/models/user_model.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/domain/hive_service_domain.dart';
import 'package:translation/infrastructure/services/hive_service/hive_constants.dart';

final initialUserModel = UserModel(history: []);

class HiveService extends HiveServiceDomain {
  HiveService._();
  static HiveService instance = HiveService._();

  late Box<UserModel> userModelHiveBox;

  @override
  Future<void> init(String path) async {
    Hive.init(path);

    Hive.registerAdapter<TranslationModel>(TranslationModelAdapter());
    Hive.registerAdapter<LanguageTypes>(LanguageTypesAdapter());
    Hive.registerAdapter<UserModel>(UserModelAdapter());

    userModelHiveBox = await Hive.openBox<UserModel>(userModelHiveKey);
  }
}

extension HiveUserExtension on HiveService {
  UserModel get getUserModelFromHive {
    if (userModelHiveBox.isEmpty) {
      userModelHiveBox.add(initialUserModel);
      return initialUserModel;
    }
    return Hive.box<UserModel>(userModelHiveKey).values.first;
  }
}
