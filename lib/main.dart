import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chart_project/home.dart';
import 'package:test_chart_project/middleware/notifiers/transactions_notifer.dart';
import 'package:test_chart_project/middleware/notifiers/users_notifier.dart';
import 'package:test_chart_project/saved_cards_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TransactionsNotifier>(
        create: (_) => TransactionsNotifier()..initTransactions()),
    ChangeNotifierProvider<UsersNotifier>(create: (_) => UsersNotifier())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/cardsRoute': (context) => const SavedCardsScreen()
      },
    );
  }
}
