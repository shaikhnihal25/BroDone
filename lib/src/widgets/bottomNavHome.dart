import 'package:flutter/material.dart';

import '../constants/color-constants.dart';

class BottomNavMain extends StatefulWidget {
  int? pageIndex;
  PageController? pageController;
  void Function(int)? onTap;
  BottomNavMain({super.key, this.pageIndex, this.pageController, this.onTap});

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: AppColors.secondaryColor,
        selectedItemColor: AppColors.primaryColor,
        currentIndex: widget.pageIndex ?? 0,
        onTap: widget.onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
              ),
              label: "Study"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: "Study"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.celebration,
              ),
              label: "Study"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Study"),
        ]);
  }
}
