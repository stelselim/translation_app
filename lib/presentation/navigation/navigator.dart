import 'package:flutter/material.dart';
import 'package:translation/domain/navigation_service_domain.dart';
import 'package:translation/presentation/navigation/routes.dart' as routes;

class NavigationService extends NavigationServiceDomain {
  @override
  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void navigateHistory(BuildContext context) {
    Navigator.pushNamed(context, routes.historyRoute);
  }

  @override
  void navigateHome(BuildContext context) {
    Navigator.pushNamed(context, routes.homeRoute);
  }

  @override
  void navigateNotFound(BuildContext context) {
    Navigator.pushNamed(context, routes.notFoundRoute);
  }
}
