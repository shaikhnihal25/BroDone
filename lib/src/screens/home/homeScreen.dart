import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/screens/authentication/login_screen.dart';
import 'package:brodone/src/screens/home/study/courses/remainingCoursesHome.dart';
import 'package:brodone/src/screens/home/study/courses/topCoursesHome.dart';
import 'package:brodone/src/widgets/bottomNavHome.dart';
import 'package:brodone/src/widgets/courseCard.dart';
import 'package:brodone/src/widgets/homeSearchBar.dart';
import 'package:brodone/src/widgets/profileDetailCard.dart';
import 'package:brodone/src/widgets/profileHomeTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.screenHeight / 2.5,
                width: context.screenWidth,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: context.screenHeight / 150,
                    ),
                    const ProfileHomeTile(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileDetailCard(
                          title: "Attendance",
                          value: "${10}",
                          subtitle: "January",
                        ),
                        ProfileDetailCard(
                          title: "BD Score",
                          value: "${47}",
                          subtitle: "Average",
                        ),
                        ProfileDetailCard(
                          title: "Rank",
                          value: "${19}",
                          subtitle: "MUMBAI",
                        ),
                      ],
                    ).pOnly(bottom: 20),
                  ],
                ),
              ),
              NeumorphicSearchBar(
                      onTextChanged: (value) {}, onFilterPressed: () {})
                  .p(12),
              //--------Recent-Courses----------//
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your recents",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor),
                  ),
                  Text(
                    "Continue remaining lessons",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ).pOnly(left: 20, top: 5, bottom: 10),
              RecentCoursesHome(
                title: const [
                  "JavaScript With React JS & React Native",
                  "IELTS for USA & Canada Visa",
                  "HSC Physics : Chatper 09",
                  "How to Create Mobile App Using Flutter",
                  "Introduction to Machine Learning : Ruby On Rails & Python"
                ],
              ),

              //-----------Top-Courses----------//
              TopCoursesHome()
            ],
          ),
        ),
      ),
    );
  }
}
