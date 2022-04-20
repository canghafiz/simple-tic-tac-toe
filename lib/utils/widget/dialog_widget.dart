import 'package:flutter/material.dart';

Widget justDialog(Widget content) {
  return Dialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: content,
    ),
  );
}

Widget alertDialog({
  required Text text,
  required List<Widget> actions,
}) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    actions: actions,
    insetPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 24,
    ),
    content: text,
  );
}
