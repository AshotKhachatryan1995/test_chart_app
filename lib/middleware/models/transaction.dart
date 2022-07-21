class Transaction {
  Transaction(
      {required this.name,
      required this.country,
      required this.amount,
      required this.date,
      required this.transactionStatus,
      this.imageUrl});

  final String name;
  final String country;
  final int amount;
  final DateTime date;
  final TransactionStatus transactionStatus;
  final String? imageUrl;

  factory Transaction.emptyLoadingModel() => Transaction(
      name: 'JOHN DOE',
      country: 'United Kingdom',
      amount: 80000,
      date: DateTime(2021, 8, 11),
      transactionStatus: TransactionStatus.inProgress);

  factory Transaction.emptyComplatedModel() => Transaction(
      name: 'JOHN DOE',
      country: 'United Kingdom',
      amount: 80000,
      date: DateTime(2021, 8, 11),
      transactionStatus: TransactionStatus.complated);
}

enum TransactionStatus { inProgress, complated }
