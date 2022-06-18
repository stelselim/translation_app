import 'package:flutter/material.dart';
import 'package:translation/presentation/navigation/routes.dart' as routes;
import 'package:translation/presentation/screens/home/home.dart';
import 'package:translation/presentation/screens/not_found/not_found.dart';

Route generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case routes.homeRoute:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const NotFound(),
      );
  }
}
