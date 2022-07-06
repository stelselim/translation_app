import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/design_constants.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      if (homeProvider.editMode) {
        return IconButton(
          tooltip: "app_bar_cancel_button_tool_tip".tr(),
          icon: Icon(
            Icons.cancel,
            size: appBarButtonSize,
          ),
          onPressed: () => homeProvider.setEditMode(false),
        );
      }

      return IconButton(
        tooltip: "app_bar_edit_button_tool_tip".tr(),
        icon: Icon(
          Icons.edit,
          size: appBarButtonSize,
        ),
        onPressed: () => homeProvider.setEditMode(true),
      );
    });
  }
}
