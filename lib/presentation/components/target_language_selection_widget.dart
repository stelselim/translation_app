import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/language_constants.dart';
import 'package:translation/presentation/styles/text_styles.dart'
    as text_styles;

class TargetLanguageSelectionWidget extends StatelessWidget {
  const TargetLanguageSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Row(
            children: [
              Text(
                "target_language_chip_list_title".tr(),
                style: text_styles.kBoldBody1TextStyle,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Consumer<HomeProvider>(
          builder: (context, homeProvider, _) {
            final selected = [
              ...homeProvider.selectedTargetLanguages,
            ];

            final unselected =
                kAllLanguages.where((element) => !selected.contains(element));

            final languages = [...selected, ...unselected];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Wrap(
                spacing: 3.0,
                runSpacing: 5.0,
                children: <Widget>[
                  for (var lan in languages)
                    _buildChip(
                      languageString(lan),
                      homeProvider.selectedTargetLanguages.contains(lan),
                      () => onTap(homeProvider, lan),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildChip(
    String label,
    bool selected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        padding: EdgeInsets.all(8.0.w),
        labelPadding: EdgeInsets.all(2.w),
        label: Text(
          label,
          style: selected
              ? text_styles.kBody3WhiteTextStyle
              : text_styles.kBody3TextStyle,
        ),
        onDeleted: null,
        elevation: 5.0,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: selected ? Colors.green : Colors.white,
        deleteIconColor: Colors.white,
      ),
    );
  }

  onTap(HomeProvider homeProvider, LanguageTypes language) {
    bool selected = homeProvider.selectedTargetLanguages.contains(language);
    if (selected) {
      homeProvider.removeSelectedLanguage(language);
      return;
    }

    homeProvider.addSelectedLanguage(language);
  }
}
