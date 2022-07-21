import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_chart_project/constants/app_textstyles.dart';
import 'package:test_chart_project/middleware/models/transaction.dart';

class TransactionRowItem extends StatelessWidget {
  const TransactionRowItem({required this.transaction, Key? key})
      : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    Widget _renderImage() {
      return transaction.imageUrl == null
          ? Image.asset(
              'assets/images/group_icon.png',
              height: 38,
              width: 38,
            )
          : Image.network(transaction.imageUrl ?? '');
    }

    Widget _renderMainInfo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(transaction.name, style: AppTextStyles.display11(context)),
          const SizedBox(height: 5),
          Text(transaction.country,
              style: AppTextStyles.display8(context,
                  color: Colors.black.withOpacity(0.3))),
        ],
      );
    }

    Widget _renderAmountInfo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${transaction.amount} AED',
              style: AppTextStyles.display11(context)),
          const SizedBox(height: 5),
          Text(DateFormat('dd MM yyyy').format(transaction.date),
              style: AppTextStyles.display10(context,
                  color: Colors.black.withOpacity(0.3))),
        ],
      );
    }

    Widget _renderStatus() {
      return Image.asset(
        transaction.transactionStatus == TransactionStatus.complated
            ? 'assets/images/complated_icon.png'
            : 'assets/images/in_progress_icon.png',
        width: 12,
        height: 12,
      );
    }

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          _renderImage(),
          const SizedBox(width: 13),
          _renderMainInfo()
        ]),
        Row(children: [
          _renderAmountInfo(),
          const SizedBox(width: 20),
          _renderStatus()
        ]),
      ]),
      const SizedBox(height: 23),
    ]);
  }
}
