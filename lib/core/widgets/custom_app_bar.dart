import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTap;
  const CustomAppBar(this.title, {super.key, required this.onTap});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ScaffoldTitle(title),
      leading: InkWell(
        onTap: onTap,
        overlayColor: WidgetStatePropertyAll(AppPallete.transparentColor),
        child: Icon(CupertinoIcons.chevron_left, fontWeight: FontWeight.bold),
      ),
    );
  }
}
