import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translation/constants/design_constants.dart';
import 'package:translation/presentation/navigation/navigator.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        tooltip: "app_bar_history_button_tool_tip".tr(),
        icon: Icon(
          Icons.history,
          size: appBarButtonSize,
        ),
        onPressed: () => NavigationService().navigateHistory(context),
      ),
    );
  }
}
