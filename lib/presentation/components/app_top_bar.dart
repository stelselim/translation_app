import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation/constants/design_constants.dart' as design;

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? trailing;
  final String title;
  const AppTopBar({
    Key? key,
    this.leading,
    this.trailing,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: leading,
      actions: [
        if (trailing != null) trailing!,
        SizedBox(width: 5.w),
      ],
      title: Text(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => design.topAppBarSize;
}
