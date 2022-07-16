import 'package:flutter_test/flutter_test.dart';
import 'package:translation/constants/language_constants.dart';

void main() {
  final allLanguages = kAllLanguages;
  final invalidType = LanguageTypes.invalid;
  final invalidCode = "invalid";
  final invalidString = "Invalid Language";

  group("Language Tests", () {
    test("All Languages Has Type, Name & Code", () {
      for (var lan in allLanguages) {
        print("For $lan");
        final _languageString = languageString(lan);
        expect(_languageString, isNot(invalidString));

        final _lanCode = languageCode(lan);
        expect(_lanCode, isNot(invalidCode));

        final type = languageTypeFromCode(_lanCode);
        expect(type, isNot(invalidType));
      }
    });
  });
}
