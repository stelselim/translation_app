import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:translation/application/models/translation_model.dart';
part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel extends HiveObject {
  @HiveField(0)
  List<TranslationModel> history;

  UserModel({
    required this.history,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && listEquals(other.history, history);
  }

  @override
  int get hashCode => history.hashCode;

  @override
  String toString() => 'UserModel(history: $history)';
}
