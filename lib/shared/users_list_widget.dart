import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chart_project/middleware/notifiers/transactions_notifer.dart';
import 'package:test_chart_project/shared/transaction_row_item.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({Key? key}) : super(key: key);

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Consumer<TransactionsNotifier>(
            builder: (context, notifer, child) => MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: notifer.transactions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => TransactionRowItem(
                        transaction: notifer.transactions[index])))));
  }
}
