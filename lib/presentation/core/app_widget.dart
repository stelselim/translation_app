import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/provider/app_widget_provider.dart';
import 'package:translation/application/provider/home_provider.dart';
import 'package:translation/constants/design_constants.dart' as design;
import 'package:translation/infrastructure/repositories/translate_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translation/presentation/core/material_widget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: design.designSize,
      splitScreenMode: false,
      builder: (context, child) {
        return RepositoryProvider(
          create: (context) => TranslateRepository(),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => HomeProvider(
                  translateRepository:
                      RepositoryProvider.of<TranslateRepository>(context),
                ),
              ),
              ChangeNotifierProxyProvider<HomeProvider, AppWidgetProvider>(
                create: (context) => AppWidgetProvider(),
                update: (context, homeProvider, appWidgetProvider) =>
                    AppWidgetProvider(
                  homeProvider: homeProvider,
                ),
              )
            ],
            builder: (context, state) {
              return const MaterialAppWidget();
            },
          ),
        );
      },
    );
  }
}
