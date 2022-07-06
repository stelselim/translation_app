import 'package:flutter/material.dart';

abstract class NavigationServiceDomain {
  void navigateBack(BuildContext context);
  void navigateHome(BuildContext context);
  void navigateHistory(BuildContext context);
  void navigateNotFound(BuildContext context);
}
