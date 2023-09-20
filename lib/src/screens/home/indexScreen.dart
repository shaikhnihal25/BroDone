import 'package:brodone/src/screens/home/chat/chatsMainScreen.dart';
import 'package:brodone/src/screens/home/explore/exploreMainScreen.dart';
import 'package:brodone/src/screens/home/homeScreen.dart';
import 'package:brodone/src/screens/home/notification/notificationMainPage.dart';
import 'package:brodone/src/screens/home/profile/user/userProfilePage.dart';
import 'package:brodone/src/screens/home/study/courses/courseListPage.dart';
import 'package:brodone/src/widgets/bottomNavHome.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final PageController _pageController = PageController();

  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        children: const [
          HomeScreen(),
          ExploreMainScreen(),
          ChatsMainScreen(),
          UserProfilePage()
        ],
        // LecturesScreen(), NotificationScreen(), ProfileScreen()
      ),
      bottomNavigationBar: BottomNavMain(
        pageIndex: pageIndex,
        pageController: _pageController,
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
