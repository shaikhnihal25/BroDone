import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/widgets/homeSearchBar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widgets/courseCard.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Explore",
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search for Courses",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                Text(
                  "Start learning today.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
              ],
            ).p(16),
            NeumorphicSearchBar(
                    onTextChanged: (value) {}, onFilterPressed: () {})
                .p(12),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CourseInfoCard(
                  courseTitle: "Python Advanve With Pandas & Numpy",
                  teacherName: "Mike Dulet",
                  averageRating: 3.5,
                  totalRatings: 203,
                  oldPrice: 399,
                  newPrice: 249,
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
