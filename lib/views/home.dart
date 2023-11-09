// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/routes/route_names.dart';
import '../utils/app_colors.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({
    super.key,
    required this.child,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: _calculateSelectedIndex(context) == 0
                  ? AppColors.primaryColor
                  : Colors.grey,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _calculateSelectedIndex(context) == 1
                  ? AppColors.primaryColor
                  : Colors.grey,
              size: 30,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: _calculateSelectedIndex(context) == 2
                  ? AppColors.primaryColor
                  : Colors.grey,
              size: 30,
            ),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              color: _calculateSelectedIndex(context) == 3
                  ? AppColors.primaryColor
                  : Colors.grey,
              size: 30,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _calculateSelectedIndex(context) == 4
                  ? AppColors.primaryColor
                  : Colors.grey,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: _onItemTapped,
      ),
      body: widget.child,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(RouteName.first)) {
      return 0;
    } else if (location.startsWith(RouteName.second)) {
      return 1;
    } else if (location.startsWith(RouteName.third)) {
      return 2;
    } else if (location.startsWith(RouteName.fourth)) {
      return 3;
    } else if (location.startsWith(RouteName.fifth)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(RouteName.first);
        break;
      case 1:
        GoRouter.of(context).go(RouteName.second);
        break;
      case 2:
        GoRouter.of(context).go(RouteName.third);
        break;
      case 3:
        GoRouter.of(context).go(RouteName.fourth);
        break;
      case 4:
        GoRouter.of(context).go(RouteName.fifth);
        break;
    }
  }
}
