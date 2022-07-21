import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_chart_project/shared/navigation_widget.dart';
import 'package:test_chart_project/shared/section_title_widget.dart';
import 'package:test_chart_project/shared/tab_bar_widget.dart';
import 'package:test_chart_project/shared/users_list_widget.dart';

class SavedCardsScreen extends StatefulWidget {
  const SavedCardsScreen({Key? key}) : super(key: key);

  @override
  State<SavedCardsScreen> createState() => _SavedCardsScreenState();
}

class _SavedCardsScreenState extends State<SavedCardsScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;

  final ValueNotifier<double> _pageNotifier = ValueNotifier(0.0);

  final List<String> tabs = [
    'Menu title 1',
    'Menu title 2',
    'Menu title 3',
    'Menu title 4',
    'Menu title 5'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 0);
    _tabController = TabController(length: tabs.length, vsync: this);

    _pageController.addListener(_listener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageNotifier.dispose();
    _pageController.removeListener(_listener);
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.white,
            elevation: 0.0,
          )),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const NavigationWidget(title: 'My saved cards'),
                  const SizedBox(height: 25),
                  _renderCards(),
                  _renderDots(),
                  const SizedBox(height: 40),
                  TabBarWidget(controller: _tabController, tabs: tabs),
                  const SizedBox(height: 37),
                  _renderUsersList()
                ],
              ))),
    );
  }

  Widget _renderCards() {
    return SizedBox(
        height: 185,
        child: PageView(
          controller: _pageController,
          children: [
            _renderCardItem('assets/images/visa_1.png'),
            _renderCardItem('assets/images/visa_2.png'),
          ],
        ));
  }

  Widget _renderDots() {
    return ValueListenableBuilder(
        valueListenable: _pageNotifier,
        builder: (context, double page, child) => DotsIndicator(
              dotsCount: 2,
              position: page,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ));
  }

  Widget _renderCardItem(String asset) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Image.asset(asset));
  }

  Widget _renderUsersList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionTitleWidget(
          title: 'Recent Transactions',
          withButton: false,
        ),
        UsersListWidget()
      ],
    );
  }
}

extension _SavedCardsScreenStateAddition on _SavedCardsScreenState {
  void _listener() {
    _pageNotifier.value = _pageController.page ?? 0.0;
  }
}
