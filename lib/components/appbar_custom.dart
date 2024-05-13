import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? pageTitle;

  const AppBarCustom({
    super.key,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF05F258),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
      title: Text(
        pageTitle ?? '',
        style: const TextStyle(
            fontSize: 20,
            color: Color(0xFFFFFFFF),
            fontFamily: 'Poppins-SemiBold'),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      toolbarHeight: 60,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
