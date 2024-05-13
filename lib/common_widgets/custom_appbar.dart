import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final double? fontSize;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Color backgroundColor;
  @override
  final Size preferredSize = AppBar().preferredSize;

  MyAppBar(
      {super.key,
      required this.title,
      this.leading,
      this.actions,
      this.automaticallyImplyLeading = true,
      this.backgroundColor = Colors.white,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            fontSize: fontSize ?? size.width * 0.06,
            fontWeight: FontWeight.w500),
      ),
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
    );
  }
}
