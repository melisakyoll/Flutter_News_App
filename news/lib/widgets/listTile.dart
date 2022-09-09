import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final Color color;
  final Icon icon;
  final Text title;
  const ListTileWidget(
      {required Key key,
      required this.color,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}
