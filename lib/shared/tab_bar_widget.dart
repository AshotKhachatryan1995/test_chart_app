import 'package:flutter/material.dart';
import 'package:test_chart_project/constants/app_colors.dart';
import 'package:test_chart_project/constants/app_textstyles.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({required this.controller, required this.tabs, Key? key})
      : super(key: key);
  final TabController controller;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: controller,
        isScrollable: true,
        indicatorWeight: 4,
        indicatorColor: AppColors.doveGreyColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: tabs
            .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  e,
                  style: AppTextStyles.display10(context, color: Colors.black),
                )))
            .toList());
  }
}
