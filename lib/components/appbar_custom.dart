import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? pageTitle;

  const AppBarCustom({
    Key? key,
    required this.pageTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF05F258),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      ),
      title: Text(
        pageTitle ?? '', 
        style: const TextStyle(color: Color(0xFFFFFFFF)),
      ),
      centerTitle: true,
      backgroundColor: const Color(0x0A0A0A),
      toolbarHeight: 100,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100); 
}
