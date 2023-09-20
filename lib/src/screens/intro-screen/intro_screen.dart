import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/route_manager.dart';
import 'package:gif_view/gif_view.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> _listOfPAges = [
    'lib/assets/images/Screen-01.png',
    'lib/assets/images/Screen-02.png',
    'lib/assets/images/Screen-03.png',
    'lib/assets/images/Screen-04.png',
    'lib/assets/images/Screen-05.png',
    'lib/assets/images/Screen-06.png',
    'lib/assets/images/Screen-07.png',
  ];

  PageController _pageController = PageController();
  int pageIndex = 0;
  bool pageDone = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (value) {
            value = pageIndex;
          },
          itemCount: _listOfPAges.length,
          itemBuilder: (context, index) {
            return Image.asset(
              _listOfPAges[index],
              fit: BoxFit.fill,
            );
          }),
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            pageIndex++;
            _pageController.animateToPage(pageIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          });
          if (pageIndex == 6) {
            setState(() {
              pageDone = true;
            });
          }
          if (pageIndex > 6) {
            Get.to(const LoginScreen());
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          height: 60,
          width: pageDone ? 180 : 120,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(18)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  pageDone ? "Login / Sign Up" : "Next ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.backgroundColor),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
          ),
        ).pOnly(
          bottom: 30,
        ),
      ),
    );
  }
}
