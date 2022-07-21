import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_chart_project/constants/app_colors.dart';
import 'package:test_chart_project/shared/home_header_widget.dart';
import 'package:test_chart_project/middleware/blocs/home/home_bloc.dart';
import 'package:test_chart_project/middleware/blocs/home/home_event.dart';
import 'package:test_chart_project/middleware/blocs/home/home_state.dart';
import 'package:test_chart_project/middleware/notifiers/users_notifier.dart';
import 'package:test_chart_project/middleware/repositories/api_repository_impl.dart';
import 'package:test_chart_project/shared/chart_widget.dart';
import 'package:test_chart_project/shared/progress_item_widget.dart';
import 'package:test_chart_project/shared/section_title_widget.dart';
import 'package:test_chart_project/shared/users_list_widget.dart';
import 'package:test_chart_project/top_users_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _homeBloc;
  late UsersNotifier _usersNotifer;

  @override
  void initState() {
    super.initState();

    _homeBloc = HomeBloc(ApiRepositoryImpl())..add(LoadUsersEvent());
    _usersNotifer = Provider.of<UsersNotifier>(context, listen: false);
  }

  @override
  void dispose() {
    _homeBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _homeBloc,
        child: BlocListener<HomeBloc, HomeState>(
            listener: _listener,
            child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.zero,
                    child: AppBar(
                      systemOverlayStyle: SystemUiOverlayStyle.light,
                      backgroundColor: AppColors.bigStoneColor,
                      elevation: 0.0,
                    )),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                    child: Column(children: [
                  const HomeHeaderWidget(),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 30),
                      child: Column(
                        children: [
                          const ChartWidget(),
                          _renderTopUsers(),
                          _renderRecentTransactions(),
                          _renderFinancicalGoals()
                        ],
                      ))
                ])))));
  }

  Widget _renderTopUsers() {
    return Column(
      children: const [
        SectionTitleWidget(
          title: 'Top USERS FROM YOUR COMMUNITY',
          withButton: false,
        ),
        SizedBox(height: 20),
        TopUsersListWidget(),
        SizedBox(height: 45)
      ],
    );
  }

  Widget _renderRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(
            title: 'Recent Transactions',
            onButtonTap: () => Navigator.pushNamed(context, '/cardsRoute')),
        const UsersListWidget()
      ],
    );
  }

  Widget _renderFinancicalGoals() {
    return Column(
      children: const [
        SectionTitleWidget(
          title: 'Financial Goals',
          withButton: false,
        ),
        ProgressItemWidget(progress: 0.3, color: AppColors.denimColor),
        ProgressItemWidget(progress: 0.75, color: AppColors.burntSiennaColor),
        ProgressItemWidget(progress: 0.6, color: AppColors.aquamarineColor),
      ],
    );
  }
}

extension _HomeScreenStateAddition on _HomeScreenState {
  void _listener(context, state) {
    if (state is UsersSuccessfullyLoadedState) {
      _usersNotifer.addUsers(users: state.users);
    }
  }
}
