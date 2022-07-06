import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translation/presentation/components/app_top_bar.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: "not_found_top_app_bar_title".tr(),
      ),
      body: Center(
        child: Text("the_page_not_found_title".tr()),
      ),
    );
  }
}
