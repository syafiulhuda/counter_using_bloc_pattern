import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
    this.buttonKey,
    this.height,
    this.widht,
  });

  final Icon icon;
  final VoidCallback onTap;
  final Key? buttonKey;
  final double? height;
  final double? widht;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.pinkAccent,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        key: buttonKey,
        onTap: onTap,
        child: SizedBox(
          height: height ?? 50,
          width: widht ?? 50,
          child: icon,
        ),
      ),
    );
  }
}
