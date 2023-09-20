import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/screens/home/study/courses/courseListPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../widgets/courseCard.dart';

class TopCoursesHome extends StatefulWidget {
  const TopCoursesHome({super.key});

  @override
  State<TopCoursesHome> createState() => _TopCoursesHomeState();
}

class _TopCoursesHomeState extends State<TopCoursesHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
                child: Divider(
              height: 15,
            )),
            Text(
              "  Top Courses  ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryColor,
                  fontSize: 22),
            ),
            Expanded(
                child: Divider(
              height: 15,
            )),
          ],
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
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
        Card(
          child: TextButton(
              onPressed: () => Get.to(() => CourseListPage()),
              child: const Center(
                child: Text("Explore All Courses"),
              )),
        ).pOnly(left: 20, right: 20, top: 5)
      ],
    );
  }
}
