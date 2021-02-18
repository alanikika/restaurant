import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_alan/common/custom_colors.dart';
import 'package:restaurant_alan/common/dimens.dart';
import 'package:restaurant_alan/common/image_path.dart';
import 'package:restaurant_alan/common/strings.dart';
import 'package:restaurant_alan/common/styles.dart';
import 'package:restaurant_alan/feature/home/history.dart';
import 'package:restaurant_alan/feature/home/home.dart';

class MenuNavigation extends StatefulWidget {
  final int navigationIndex;
  final int tabBarIndex;

  MenuNavigation({this.navigationIndex, this.tabBarIndex = 0});

  @override
  _MenuNavigationState createState() => _MenuNavigationState();
}

class _MenuNavigationState extends State<MenuNavigation> {
  int _currentIndex;

  List<Widget> _bottomNavigationWidgets;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Image.asset(
        ImagePath.home,
        width: Dimens.standard_24,
        height: Dimens.standard_24,
        color: CustomColors.colorA1AAAB,
      ),
      label: Strings.home,
      activeIcon: Image.asset(
        ImagePath.home,
        color: CustomColors.primaryColor,
        width: Dimens.standard_24,
        height: Dimens.standard_24,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        ImagePath.history,
        width: Dimens.standard_24,
        height: Dimens.standard_24,
        color: CustomColors.colorA1AAAB,
      ),
      label: Strings.history,
      activeIcon: Image.asset(
        ImagePath.history,
        color: CustomColors.primaryColor,
        width: Dimens.standard_24,
        height: Dimens.standard_24,
      ),
    ),
  ];

  @override
  void initState() {
    if (widget.navigationIndex != null) {
      _currentIndex = widget.navigationIndex;
    } else {
      _currentIndex = 0;
    }

    _bottomNavigationWidgets = [
      HomeScreen(),
      HistoryScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
        body: _bottomNavigationWidgets[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          showUnselectedLabels: true,
          unselectedLabelStyle: Style.ibmPleXSansBold.copyWith(
            letterSpacing: .25,
            fontSize: Dimens.standard_12,
          ),
          selectedLabelStyle: Style.ibmPleXSansBold.copyWith(
            letterSpacing: .25,
            fontSize: Dimens.standard_12,
          ),
          currentIndex: _currentIndex,
          items: items,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
