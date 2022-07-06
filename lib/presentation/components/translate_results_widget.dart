import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/presentation/styles/text_styles.dart';
import 'package:flutter/services.dart';

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
              child: SelectableText(
                language.toUpperCase(),
                textAlign: TextAlign.start,
                style: kBoldBody3TextStyle,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SelectableText(
                      text,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 10,
                    child: Row(
                      children: [
                        _shareButton(text),
                        SizedBox(width: 12.w),
                        _copyButton(text),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _copyButton(String text) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Clipboard.setData(ClipboardData(text: text));
      },
      child: Icon(
        Icons.copy,
        color: Colors.blueGrey.shade800,
        size: 20.w,
      ),
    );
  }

  Widget _shareButton(String text) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        try {
          await Share.share(text);
        } catch (e) {
          log(e.toString());
        }
      },
      child: Icon(
        Icons.share,
        color: Colors.green.shade600,
        size: 20.w,
      ),
    );
  }
}
