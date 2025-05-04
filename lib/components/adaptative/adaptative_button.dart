import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const AdaptativeButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
          color: Theme.of(context).primaryColor,
          onPressed: null,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(label),
        )
        : ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).textTheme.labelLarge?.color,
          ),
          onPressed: onPressed,
          child: Text(label),
        );
  }
}
