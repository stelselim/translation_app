import 'package:flutter/material.dart';
import 'package:translation/application/models/translation_model.dart';

class TranslateResultsWidget extends StatelessWidget {
  final bool loading;
  final TranslationModel? translationModel;
  const TranslateResultsWidget({
    Key? key,
    required this.loading,
    this.translationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (translationModel == null) {
      return Container();
    }
    // TODO: Translation result will be shown in this part.
    return Container(
      child: Text(translationModel!.translatedTexts.toString()),
    );
  }
}
