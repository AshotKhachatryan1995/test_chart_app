import 'package:flutter/material.dart';
import 'package:test_chart_project/constants/app_colors.dart';
import 'package:test_chart_project/constants/app_textstyles.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _renderName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hola, Michael', style: AppTextStyles.display1(context)),
          const SizedBox(height: 4),
          Text('Te tenemos excelentes noticias para ti',
              style: AppTextStyles.display2(context)),
        ],
      );
    }

    Widget _renderIcons() {
      return Row(
        children: [
          Image.asset(
            'assets/images/bell.png',
            width: 17,
            height: 14,
          ),
          const SizedBox(width: 22),
          Image.asset(
            'assets/images/user_icon.png',
            width: 18,
            height: 18,
          )
        ],
      );
    }

    Widget _renderTitleArea() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_renderName(), _renderIcons()],
      );
    }

    Widget _renderPriceArea() {
      Widget _renderMainPrice() {
        return Text(
          '\$56,271.68',
          style: AppTextStyles.display3(context),
        );
      }

      Widget _renderGrowPrice() {
        Widget _renderPrice() {
          return Text(
            '\$+9,736',
            style: AppTextStyles.display4(context),
          );
        }

        Widget _renderPercent() {
          return Row(
            children: [
              Image.asset(
                'assets/images/arrow_up.png',
                height: 11,
                width: 11,
              ),
              const SizedBox(width: 6),
              Text(
                '2.3%',
                style: AppTextStyles.display4(context,
                    color: AppColors.emeraldColor),
              )
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderPrice(),
            const SizedBox(width: 20),
            _renderPercent()
          ],
        );
      }

      Widget _renderBalanceText() {
        return Text('ACCOUNT BALANCE', style: AppTextStyles.display5(context));
      }

      return Column(
        children: [
          _renderMainPrice(),
          _renderGrowPrice(),
          const SizedBox(height: 6),
          _renderBalanceText()
        ],
      );
    }

    Widget _renderDetailsItem(
        {required String title, required String subTitle}) {
      return Column(children: [
        Text(title, style: AppTextStyles.display6(context)),
        const SizedBox(height: 4),
        Text(subTitle, style: AppTextStyles.display5(context)),
      ]);
    }

    Widget _renderDetailsArea() {
      return IntrinsicHeight(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _renderDetailsItem(title: '12', subTitle: 'Following'),
          const VerticalDivider(color: Colors.white),
          _renderDetailsItem(title: '36', subTitle: 'Transactions'),
          const VerticalDivider(color: Colors.white),
          _renderDetailsItem(title: '4', subTitle: 'Bills')
        ],
      ));
    }

    return Container(
        height: 329,
        decoration: _decoration,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              _renderTitleArea(),
              _renderPriceArea(),
              _renderDetailsArea()
            ])));
  }
}

extension HomeHeaderWidgetAddition on HomeHeaderWidget {
  BoxDecoration get _decoration => const BoxDecoration(
      color: AppColors.bigStoneColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)));
}
