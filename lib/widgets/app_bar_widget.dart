import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onActionPressed;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.pinkAccent,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onActionPressed,
          icon: const Icon(Icons.theater_comedy),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
