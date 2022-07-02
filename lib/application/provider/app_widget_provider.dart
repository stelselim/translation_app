import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:translation/application/provider/home_provider.dart';

class AppWidgetProvider extends ChangeNotifier {
  HomeProvider? homeProvider;

  AppWidgetProvider({this.homeProvider});

  Future<String?> handleUri(Uri? uri) async {
    if (uri == null) return null;

    try {
      if (uri.queryParameters["text"] != null &&
          uri.queryParameters.containsKey("text")) {
        await _handleTranslate(uri.queryParameters["text"]!);
      }
    } catch (e) {
      log("Error on handleUri");
    }
    return null;
  }

  Future<void> _handleTranslate(String text) async {
    await homeProvider?.translateWithText(text);
  }
}
