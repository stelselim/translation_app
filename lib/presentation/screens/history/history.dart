import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/models/translation_model.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/infrastructure/services/user_service.dart';
import 'package:translation/presentation/components/app_top_bar.dart';
import 'package:translation/presentation/navigation/navigator.dart';
import 'package:translation/presentation/styles/colors.dart';
import 'package:translation/presentation/styles/text_styles.dart';

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
          return _historyListTile(context, item);
        },
      ),
    );
  }

  Widget _historyListTile(BuildContext context, TranslationModel item) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
      child: Container(
        width: 120.w,
        height: 120.w,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.text,
                style: kBody2TextStyle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.translate,
                color: kLightBlackColor,
              ),
              onPressed: () => _onTap(context, item),
            ),
          ],
        ),
      ),
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
