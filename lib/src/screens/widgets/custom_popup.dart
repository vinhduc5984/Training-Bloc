import 'package:flutter/material.dart';

class CustomDialogPopup extends StatefulWidget {
  final Color color;
  final IconData iconData;
  final String title;
  final String content;
  CustomDialogPopup(
      {required this.color,
      required this.iconData,
      required this.title,
      required this.content});

  @override
  State<CustomDialogPopup> createState() => _CustomDialogPopupState();
}

class _CustomDialogPopupState extends State<CustomDialogPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(),
    );
  }
}
