import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/infrastructure/repositories/translate_repository.dart';
import 'package:translation/infrastructure/services/user_service.dart';

class HomeProvider extends ChangeNotifier {
  // final variables via Constructor
  final TranslateRepository translateRepository;

  // Selected Languages
  late List<LanguageTypes> selectedTargetLanguages;
  late LanguageTypes sourceLanguage;

  // final variables initiliazed
  final FocusNode translateBoxFocusNode = FocusNode();
  final TextEditingController translateBoxTextEditingController =
      TextEditingController();

  // non-final variables
  late bool loading;
  late bool editMode;
  TranslationModel? translateResult;

  HomeProvider({required this.translateRepository}) {
    editMode = false;
    loading = false;
    selectedTargetLanguages = [...kAllLanguages];
    sourceLanguage = LanguageTypes.english;
  }

  Future<void> translate() async {
    if (translateBoxTextEditingController.value.text == "") {
      return;
    }
    loading = true;
    _translateBoxUnfocus();
    notifyListeners();

    try {
      translateResult = await translateRepository.translateToMultipleLanguage(
        translateBoxTextEditingController.value.text,
        sourceLanguage,
        selectedTargetLanguages,
      );

      UserService.instance.addTranslationToHistory(translateResult!);

      loading = false;
      notifyListeners();
    } catch (e) {
      log("Error on Home Provider translate method: $e");
    }
  }

  Future<void> translateWithText(
    String text,
    LanguageTypes sourceLanguage,
  ) async {
    if (text == "") {
      return;
    }
    translateBoxTextEditingController.text = text;
    loading = true;
    _translateBoxUnfocus();
    notifyListeners();

    try {
      translateResult = await translateRepository.translateToMultipleLanguage(
        translateBoxTextEditingController.value.text,
        sourceLanguage,
        selectedTargetLanguages,
      );

      UserService.instance.addTranslationToHistory(translateResult!);

      loading = false;
      notifyListeners();
    } catch (e) {
      log("Error on Home Provider translate method: $e");
    }
  }

  void setTranslateResult(TranslationModel translationModel) {
    translateBoxTextEditingController.text = translationModel.text;
    sourceLanguage = translationModel.sourceLanguage;
    editMode = false;
    loading = false;
    selectedTargetLanguages = translationModel.translatedTexts.keys.toList();
    translateResult = translationModel;
    notifyListeners();
  }

  void setSourceLanguage(LanguageTypes language) {
    sourceLanguage = language;
    notifyListeners();
  }

  void setEditMode(bool mode) {
    editMode = mode;
    notifyListeners();
  }

  void addSelectedLanguage(LanguageTypes language) {
    if (selectedTargetLanguages.contains(language)) {
      return;
    }
    selectedTargetLanguages.add(language);
    notifyListeners();
  }

  void removeSelectedLanguage(LanguageTypes language) {
    if (!selectedTargetLanguages.contains(language)) {
      return;
    }
    selectedTargetLanguages.remove(language);
    notifyListeners();
  }

  void clearTextField() {
    translateBoxTextEditingController.clear();
    _translateBoxUnfocus();
  }

  void _translateBoxUnfocus() {
    translateBoxFocusNode.unfocus();
  }
}
