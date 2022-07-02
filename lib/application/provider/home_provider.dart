import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/infrastructure/repositories/translate_repository.dart';

class HomeProvider extends ChangeNotifier {
  // final variables via Constructor
  final TranslateRepository translateRepository;

  // final variables initiliazed
  final FocusNode translateBoxFocusNode = FocusNode();
  final TextEditingController translateBoxTextEditingController =
      TextEditingController();

  // non-final variables
  late bool loading;
  TranslationModel? translateResult;

  HomeProvider({required this.translateRepository}) {
    loading = false;
  }

  Future<void> translate() async {
    loading = true;
    _translateBoxUnfocus();
    notifyListeners();

    try {
      translateResult = await translateRepository.translateToMultipleLanguage(
        translateBoxTextEditingController.value.text,
        // TODO: The source language will be selected by user.
        LanguageTypes.english,
        // TODO: Target languages will be selected by user.
        [
          LanguageTypes.turkish,
          LanguageTypes.afrikaans,
          LanguageTypes.french,
        ],
      );

      loading = false;
      notifyListeners();
    } catch (e) {
      log("Error on Home Provider translate method: $e");
    }
  }

  void clearTextField() {
    translateBoxTextEditingController.clear();
    _translateBoxUnfocus();
  }

  void _translateBoxUnfocus() {
    translateBoxFocusNode.unfocus();
  }
}
