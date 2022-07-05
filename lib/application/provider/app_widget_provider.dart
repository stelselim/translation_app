import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/language_constants.dart';

class AppWidgetProvider extends ChangeNotifier {
  HomeProvider? homeProvider;

  AppWidgetProvider({this.homeProvider});

  Future<String?> handleUri(Uri? uri) async {
    if (uri == null) return null;

    try {
      if (uri.queryParameters["text"] != null &&
          uri.queryParameters.containsKey("text")) {
        String? lan = uri.queryParameters["lan"];

        await _handleTranslate(
          uri.queryParameters["text"]!,
          lan: lan != null ? languageTypeFromCode(lan) : LanguageTypes.english,
        );
      }
    } catch (e) {
      log("Error on handleUri");
    }
    return null;
  }

  Future<void> _handleTranslate(
    String text, {
    required LanguageTypes lan,
  }) async {
    if (lan == LanguageTypes.invalid) {
      log("Invalid Language Code");
      return;
    }
    homeProvider?.setSourceLanguage(lan);
    await homeProvider?.translateWithText(text, lan);
  }
}
