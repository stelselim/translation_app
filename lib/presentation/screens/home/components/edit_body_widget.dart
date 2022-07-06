import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation/presentation/components/language_selection_dropdown.dart';
import 'package:translation/presentation/components/target_language_selection_widget.dart';

class EditBodyWidget extends StatelessWidget {
  const EditBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LanguageSelectionDropdown(),
        SizedBox(
          height: 25.h,
        ),
        const TargetLanguageSelectionWidget(),
      ],
    );
  }
}
