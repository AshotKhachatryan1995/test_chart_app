import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chart_project/middleware/models/user.dart';
import 'package:test_chart_project/middleware/notifiers/users_notifier.dart';

class TopUsersListWidget extends StatelessWidget {
  const TopUsersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersNotifier>(
        builder: (context, usersNotifier, child) => SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: usersNotifier.users.length,
                itemBuilder: (context, index) => _renderItem(
                    user: usersNotifier.users[index], index: index))));
  }

  Widget _renderItem({required User user, required int index}) {
    return SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(_asset(index))),
            const SizedBox(height: 13),
            Text(
              user.name,
              style: const TextStyle(color: Colors.black),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}

extension TopUsersListWidgetAddition on TopUsersListWidget {
  String _asset(int index) {
    final value = index % 4;

    if (value == 0) {
      return 'assets/images/user_1.png';
    }

    if (value == 1) {
      return 'assets/images/user_2.png';
    }

    if (value == 2) {
      return 'assets/images/user_3.png';
    }

    return 'assets/images/user_4.png';
  }
}
