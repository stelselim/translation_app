import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/presentation/styles/text_styles.dart'
    as text_styles;

class LanguageSelectionDropdown extends StatelessWidget {
  const LanguageSelectionDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Row(
          children: [
            Text(
              "source_language_dropdown_title".tr(),
              style: text_styles.kBoldBody1TextStyle,
            ),
            const Spacer(),
            DropdownButton<LanguageTypes>(
              items: _dropDownItemList(),
              value: homeProvider.sourceLanguage,
              onChanged: (LanguageTypes? val) {
                if (val == null) {
                  return;
                }
                homeProvider.setSourceLanguage(val);
              },
            ),
          ],
        ),
      );
    });
  }

  List<DropdownMenuItem<LanguageTypes>> _dropDownItemList() {
    return kAllLanguages
        .map(
          (e) => DropdownMenuItem<LanguageTypes>(
            value: e,
            child: Text(languageString(e)),
          ),
        )
        .toList();
  }
}
