import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:test_chart_project/constants/app_colors.dart';
import 'package:test_chart_project/constants/app_textstyles.dart';

class ProgressItemWidget extends StatelessWidget {
  const ProgressItemWidget(
      {required this.progress, required this.color, Key? key})
      : super(key: key);
  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text('XX of total XX',
            style: AppTextStyles.display8(context,
                color: AppColors.rollingStoneColor)),
        const SizedBox(height: 6),
        Progresso(
            progress: progress,
            progressStrokeWidth: 5.0,
            progressColor: color,
            progressStrokeCap: StrokeCap.square,
            backgroundStrokeCap: StrokeCap.round)
      ],
    );
  }
}
