import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/infrastructure/utilities/keyboard_done_action.dart';
import 'package:translation/presentation/styles/colors.dart';
import 'package:translation/presentation/styles/text_styles.dart';

class TranslateBox extends StatelessWidget {
  final LanguageTypes sourceLanguage;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  const TranslateBox({
    Key? key,
    required this.sourceLanguage,
    required this.focusNode,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      child: KeyboardActions(
        config: keyboardDoneActionConfig(focusNode),
        child: TextField(
          autocorrect: true,
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "translate_box_hint_text".tr(),
            hintStyle: kTranslateBoxHintTextStyle,
            helperText: languageString(sourceLanguage),
            labelText: "translate_box_label_text".tr(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            semanticCounterText: "Text",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: kLightBlackColor,
              ),
            ),
          ),
          maxLines: 5,
          maxLength: 250,
        ),
      ),
    );
  }
}
