import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/presentation/components/app_top_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, state, _) {
        return Scaffold(
          appBar: AppTopBar(
            title: "home_top_app_bar_title".tr(),
          ),
        );
      },
    );
  }
}
