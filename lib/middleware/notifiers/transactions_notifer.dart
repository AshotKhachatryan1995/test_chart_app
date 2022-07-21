import 'package:flutter/material.dart';
import 'package:test_chart_project/middleware/models/transaction.dart';

class TransactionsNotifier extends ChangeNotifier {
  final List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  void initTransactions() {
    _transactions.addAll([
      Transaction.emptyLoadingModel(),
      Transaction.emptyComplatedModel(),
      Transaction.emptyComplatedModel(),
      Transaction.emptyComplatedModel()
    ]);

    notifyListeners();
  }
}
