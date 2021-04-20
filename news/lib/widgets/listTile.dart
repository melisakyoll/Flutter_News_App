import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final Color color;
  final Icon icon;
  final Text title;
  const ListTileWidget({Key key, this.color, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}
