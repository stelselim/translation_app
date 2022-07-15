import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:translation/constants/localization_constant.dart';

void main() {
  final path = localizationPath;
  final localizationsList = supportedLocals;
  final _fallBackLocale = fallBackLocale;

  group("Localization Tests", () {
    test("Supported Localizations JSONs", () async {
      for (var locale in localizationsList) {
        // Both Cases Correct:
        //  - en.json
        //  - en-US.json | en-UK.json
        File _file;
        if (locale.countryCode != null) {
          _file =
              File("$path/${locale.languageCode}-${locale.countryCode}.json");
        } else {
          _file = File("$path/${locale.languageCode}.json");
        }
        print(_file.toString());
        expect(await _file.exists(), true);
      }
    });

    test("Checks FallBack Locale", () {
      final contains = localizationsList.contains(_fallBackLocale);
      expect(contains, true);
    });
  });
}
