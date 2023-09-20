import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/screens/home/explore/TeachersListScreen.dart';
import 'package:brodone/src/screens/home/explore/instituitionsListScreen.dart';
import 'package:brodone/src/screens/home/explore/notesScreen.dart';
import 'package:brodone/src/screens/home/explore/supportScreen.dart';
import 'package:brodone/src/screens/home/explore/toppersListScreen.dart';
import 'package:brodone/src/screens/home/explore/webinarsListScreen.dart';
import 'package:brodone/src/screens/home/leaderboard/leaderboardScreen.dart';
import 'package:brodone/src/screens/home/study/courses/courseListPage.dart';
import 'package:brodone/src/widgets/dividerwithTitle.dart';
import 'package:brodone/src/widgets/newsCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ExploreMainScreen extends StatefulWidget {
  const ExploreMainScreen({super.key});

  @override
  State<ExploreMainScreen> createState() => _ExploreMainScreenState();
}

class _ExploreMainScreenState extends State<ExploreMainScreen> {
  final List<String> _categories = [
    "Teachers",
    "Toppers",
    "Courses",
    "Instituitions",
    "Webinars",
    "Leaderboard",
    "Support",
    "Notes"
  ];

  final List<Widget> _navPages = [
    const TeachersListScreen(),
    const ToppersListScreen(),
    const CourseListPage(),
    const InstituitionsListScreen(),
    const WebinarsListScreen(),
    const MainLeaderboardScreen(),
    const SupportScreen(),
    const NotesListScreen()
  ];

  final List<String> _catImages = [
    "lib/assets/images/teacher.png",
    "lib/assets/images/topper.png",
    "lib/assets/images/course.png",
    "lib/assets/images/live.png",
    "lib/assets/images/webinar.png",
    "lib/assets/images/leaderboard.png",
    "lib/assets/images/support.png",
    "lib/assets/images/notes.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore BroDone",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                Text(
                  "Here you can find all your study needs",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
              ],
            ).p(16),
            DividerWithTitle(
              title: "  Explore by Categories  ",
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 150,
                ),
                shrinkWrap: true,
                itemCount: 8,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => _navPages[index]);
                        },
                        child: Container(
                          height: context.height / 8,
                          width: context.width / 4,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 246, 246, 255),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Image.asset(
                              _catImages[index],
                              height: 100,
                            ),
                          ),
                        ).p(8),
                      ),
                      Text(_categories[index]),
                    ],
                  );
                }),
            DividerWithTitle(
              title: "  Latest News  ",
            ),
            NewsCard(
              isVideo: false,
            )
          ],
        )),
      ),
    );
  }
}
