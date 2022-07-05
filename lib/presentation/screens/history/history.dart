import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/infrastructure/services/user_service.dart';
import 'package:translation/presentation/components/app_top_bar.dart';
import 'package:translation/presentation/navigation/navigator.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);
  static final history = UserService.instance.userModel.history.reversed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: "history_top_app_bar_title".tr(),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history.elementAt(index);
          return GestureDetector(
            onTap: () => _onTap(context, item),
            child: _historyListTile(item.text),
          );
        },
      ),
    );
  }

  Widget _historyListTile(String text) {
    return Container(
      width: 120.w,
      height: 120.w,
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      color: Colors.red,
      child: Text(text),
    );
  }

  Future<void> _onTap(
    BuildContext context,
    TranslationModel translation,
  ) async {
    Provider.of<HomeProvider>(context, listen: false).setTranslateResult(
      translation,
    );
    NavigationService().navigateBack(context);
  }
}
