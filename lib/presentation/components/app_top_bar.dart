import 'package:flutter/material.dart';
import 'package:translation/constants/design_constants.dart' as design;

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppTopBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => design.topAppBarSize;
}
