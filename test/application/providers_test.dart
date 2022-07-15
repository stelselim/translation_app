import 'package:flutter_test/flutter_test.dart';
import 'package:translation/application/provider/app_widget_provider.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/infrastructure/repositories/translate_repository.dart';

void main() {
  final repository = TranslateRepository();
  final HomeProvider provider = HomeProvider(translateRepository: repository);
  final AppWidgetProvider appWidgetProvider = AppWidgetProvider(
    homeProvider: provider,
  );

  group('Home Provider Tests', () {
    test('Language Initials', () {
      expect(provider.sourceLanguage, LanguageTypes.english);
      expect(provider.selectedTargetLanguages, kAllLanguages);
      expect(provider.translateResult, null);
    });
    test('Edit Mode Initial', () {
      expect(provider.editMode, false);
    });
    test('Edit Mode Update', () {
      provider.setEditMode(true);
      expect(provider.editMode, true);
    });
    test('Loading Initial', () {
      expect(provider.loading, false);
    });
    test('Remove Selected Language', () {
      provider.removeSelectedLanguage(LanguageTypes.afrikaans);
      expect(
        provider.selectedTargetLanguages.contains(LanguageTypes.afrikaans),
        false,
      );
    });
    test('Add Selected Language', () {
      provider.addSelectedLanguage(LanguageTypes.afrikaans);
      expect(
        provider.selectedTargetLanguages.contains(LanguageTypes.afrikaans),
        true,
      );
    });
    test('Set Source Language', () {
      provider.setSourceLanguage(LanguageTypes.afrikaans);
      expect(provider.sourceLanguage, LanguageTypes.afrikaans);
    });

    test('Clear TextController Text', () {
      provider.translateBoxTextEditingController.text = "Hello";
      provider.clearTextField();
      expect(provider.translateBoxTextEditingController.text, '');
    });
  });

  test("App Widget Provider Tests", () {
    expect(appWidgetProvider.homeProvider, provider);
  });
}
