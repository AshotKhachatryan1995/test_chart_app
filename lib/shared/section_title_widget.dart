import 'package:flutter/material.dart';
import 'package:test_chart_project/constants/app_colors.dart';
import 'package:test_chart_project/constants/app_textstyles.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget(
      {required this.title, this.withButton = true, this.onButtonTap, Key? key})
      : super(key: key);
  final String title;
  final bool withButton;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    Widget _renderTitle() {
      return Text(title, style: AppTextStyles.display9(context));
    }

    Widget _renderIcon() {
      return withButton
          ? InkWell(
              onTap: onButtonTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.lavenderGreyColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  'More',
                  style: AppTextStyles.display10(context),
                ),
              ),
            )
          : const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_renderTitle(), _renderIcon()],
    );
  }
}
