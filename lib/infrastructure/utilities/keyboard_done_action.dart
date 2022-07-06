import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:translation/presentation/styles/text_styles.dart';

KeyboardActionsConfig keyboardDoneActionConfig(FocusNode focusNode) {
  return KeyboardActionsConfig(
    actions: [
      KeyboardActionsItem(
        focusNode: focusNode,
        displayArrows: false,
        toolbarButtons: [
          (node) {
            return TextButton(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0) +
                    const EdgeInsets.all(5.0),
                child: Text(
                  "keyboard_done_action_text".tr(),
                  style: kKeyboardDoneActionTextStyle,
                ),
              ),
              onPressed: () => focusNode.unfocus(),
            );
          }
        ],
      ),
    ],
  );
}
