import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translation/application/provider/app_widget_provider.dart';
import 'package:translation/presentation/navigation/route_catalog.dart';
import 'package:translation/presentation/navigation/routes.dart' as routes;
import 'package:translation/presentation/styles/colors.dart' as colors;
import 'package:uni_links/uni_links.dart';

class MaterialAppWidget extends StatefulWidget {
  const MaterialAppWidget({Key? key}) : super(key: key);

  @override
  State<MaterialAppWidget> createState() => _MaterialAppWidgetState();
}

class _MaterialAppWidgetState extends State<MaterialAppWidget> {
  late final GlobalKey materialAppKey;
  late final AppWidgetProvider appWidgetProvider;
  bool initialUriCompleted = false;
  StreamSubscription? uriLinkSubscription;

  @override
  void initState() {
    materialAppKey = GlobalKey();
    super.initState();
    appWidgetProvider = Provider.of<AppWidgetProvider>(context, listen: false);
    _initUriLinks(appWidgetProvider);
    _initUriLinkSubscription(appWidgetProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppWidgetProvider>(
      builder: (context, appWidgetProvider, _) {
        return MaterialApp(
          key: materialAppKey,
          title: "home_top_app_bar_title".tr(),
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          initialRoute: routes.homeRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme.of(context).copyWith(
              color: colors.kPrimaryColor,
            ),
            bottomNavigationBarTheme: BottomNavigationBarTheme.of(context),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: colors.kPrimaryColor,
              secondary: colors.kSecondaryColor,
            ),
          ),
          onGenerateRoute: generateRoutes,
        );
      },
    );
  }

  /// Listen Initial Deeplink
  Future<void> _initUriLinks(AppWidgetProvider appWidgetProvider) async {
    try {
      if (!initialUriCompleted) {
        setState(() {
          initialUriCompleted = true;
          log("Initial Uri Link Handled");
        });

        final initialUri = await getInitialUri();
        appWidgetProvider.handleUri(initialUri);
      }
    } catch (e) {
      log("Error on _initUriLinks");
    }
  }

  /// Listen Deeplink Changes
  Future<void> _initUriLinkSubscription(
    AppWidgetProvider appWidgetProvider,
  ) async {
    uriLinkSubscription = uriLinkStream.listen(
      (Uri? uri) {
        appWidgetProvider.handleUri(uri);
      },
      onError: (err) {
        log("Error on _initUriLinkSubscription");
      },
    );
  }
}
