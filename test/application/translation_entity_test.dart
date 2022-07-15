import 'package:flutter_test/flutter_test.dart';
import 'package:translation/application/entities/translation_entity.dart';
import '../mock_classses.dart';

void main() {
  test('Translation Entity Tests', () {
    final TranslationEntity translationEntity = mockTranslationEntity;
    final _translationEntity = TranslationEntity.fromMap(mockTranslationMap);

    expect(_translationEntity, translationEntity);
    expect(_translationEntity.toMap(), mockTranslationMap);
    expect(
      _translationEntity.toTranslationModel(id: mockTranslationModel.id),
      mockTranslationModel,
    );
  });
}
