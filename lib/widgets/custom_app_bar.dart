import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText; // Der Titel als String
  final List<Widget>? actions; // Optionale Liste von Aktionen (Icons)
  final bool showBackButton; // Ob ein Zurück-Button angezeigt werden soll

  const CustomAppBar({
    super.key,
    required this.titleText,
    this.actions,
    this.showBackButton = false, // Standardmäßig kein Zurück-Button
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      centerTitle: true,
      actions: actions,

      automaticallyImplyLeading:
          showBackButton, // Standardverhalten der AppBar beibehalten
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Standardhöhe der AppBar
}
