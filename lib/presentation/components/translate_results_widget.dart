import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/language_constants.dart';

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
      return Consumer<HomeProvider>(
        builder: (context, homeProvider, _) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: _resultFramePadding(),
            child: Column(
              children: [
                for (var lang in homeProvider.selectedTargetLanguages)
                  _translateListTile(context, languageString(lang), ""),
              ],
            ),
          );
        },
      );
    }
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: _resultFramePadding(),
      child: Column(
        children: [
          for (var entry in translationModel!.translatedTexts.entries)
            _translateListTile(context, languageString(entry.key), entry.value),
        ],
      ),
    );
  }

  EdgeInsets _resultFramePadding() {
    return const EdgeInsets.symmetric(horizontal: 10, vertical: 15) +
        const EdgeInsets.only(bottom: 25);
  }

  Widget _translateListTile(
    BuildContext context,
    String language,
    String text,
  ) {
    return Card(
      elevation: 2.5,
      margin: const EdgeInsets.only(top: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 120.h,
        padding: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 90,
              child: Text(
                language,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
