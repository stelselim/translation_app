import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation/constants/design_constants.dart' as design;
import 'package:translation/presentation/navigation/route_catalog.dart';
import 'package:translation/presentation/navigation/routes.dart' as routes;
import 'package:translation/presentation/styles/colors.dart' as colors;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: design.designSize,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          initialRoute: routes.homeRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme.of(context).copyWith(
              color: colors.primaryColor,
            ),
            bottomNavigationBarTheme: BottomNavigationBarTheme.of(context),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: colors.primaryColor,
              secondary: colors.secondaryColor,
            ),
          ),
          onGenerateRoute: generateRoutes,
        );
      },
    );
  }
}
