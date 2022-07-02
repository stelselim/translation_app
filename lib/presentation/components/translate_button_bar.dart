import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslateButtonBar extends StatelessWidget {
  final VoidCallback translateTap;
  final VoidCallback clearTap;
  const TranslateButtonBar(
      {Key? key, required this.translateTap, required this.clearTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: translateTap,
          child: Text("translate_button_title".tr()),
        ),
        TextButton(
          onPressed: clearTap,
          child: Text("translate_clear_button_title".tr()),
        ),
      ],
    );
  }
}
