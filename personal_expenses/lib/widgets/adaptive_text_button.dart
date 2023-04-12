import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  AdaptiveTextButton({required this.text, required this.handler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ))
        : TextButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).primaryColor)),
          );
  }
}
