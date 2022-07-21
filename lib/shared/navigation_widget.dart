import 'package:flutter/material.dart';
import 'package:test_chart_project/constants/app_textstyles.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({required this.title, this.onMenuTap, Key? key})
      : super(key: key);
  final String title;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    Widget _renderLeftArea() {
      return Row(children: [
        InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              'assets/images/arrow_right.png',
              width: 13,
              height: 11,
            )),
        const SizedBox(width: 14),
        Text(title, style: AppTextStyles.display7(context))
      ]);
    }

    Widget _renderMenuIcon() {
      return InkWell(
          onTap: onMenuTap,
          child: Image.asset(
            'assets/images/menu_icon.png',
            height: 11,
            width: 11,
          ));
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_renderLeftArea(), _renderMenuIcon()]);
  }
}
