import 'package:flutter/material.dart';
import 'package:news/constant/color_constant.dart';
import 'package:news/core/base.dart';

abstract class HomeAppBar extends StatelessWidget
    with PreferredSizeWidget
    implements BaseState {
  final String text;
  const HomeAppBar({Key key, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.instance.darkBurgundy,
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
