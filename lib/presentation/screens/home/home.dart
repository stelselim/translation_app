import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/presentation/components/app_top_bar.dart';
import 'package:translation/presentation/components/edit_button.dart';
import 'package:translation/presentation/components/history_button.dart';
import 'package:translation/presentation/components/translate_box.dart';
import 'package:translation/presentation/components/translate_button_bar.dart';
import 'package:translation/presentation/components/translate_results_widget.dart';
import 'package:translation/presentation/screens/home/components/edit_body_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppTopBar(
            leading: const EditButton(),
            trailing: const HistoryButton(),
            title: "home_top_app_bar_title".tr(),
          ),
          body: _buildHomeBody(homeProvider),
        );
      },
    );
  }

  Widget _buildHomeBody(HomeProvider homeProvider) {
    if (homeProvider.editMode) {
      return const EditBodyWidget();
    }
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: TranslateBox(
            sourceLanguage: homeProvider.sourceLanguage,
            focusNode: homeProvider.translateBoxFocusNode,
            textEditingController:
                homeProvider.translateBoxTextEditingController,
          ),
        ),
        Expanded(
          flex: 1,
          child: TranslateButtonBar(
            clearTap: () => homeProvider.clearTextField(),
            translateTap: () => homeProvider.translate(),
          ),
        ),
        Expanded(
          flex: 10,
          child: TranslateResultsWidget(
            translationModel: homeProvider.translateResult,
            loading: homeProvider.loading,
          ),
        ),
      ],
    );
  }
}
