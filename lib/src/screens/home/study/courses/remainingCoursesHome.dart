import 'package:brodone/src/constants/color-constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RecentCoursesHome extends StatefulWidget {
  List<String>? title;
  List<double>? progressValue;
  RecentCoursesHome({super.key, this.title, this.progressValue});

  @override
  State<RecentCoursesHome> createState() => _RecentCoursesHomeState();
}

class _RecentCoursesHomeState extends State<RecentCoursesHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 5,
      width: context.screenWidth,
      child: Row(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    height: context.screenHeight / 8,
                    width: context.screenWidth / 2.5,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title?[index] ??
                              "Javascript with react js & react native.",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ).p(12),
                        RichText(
                            text: const TextSpan(
                                text: "32% ",
                                style: TextStyle(
                                    color: AppColors.alertColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: " Completed",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal))
                            ])).p(12),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: LinearProgressIndicator(
                            minHeight: 10,
                            // valueColor: Animation Colors.accents,
                            borderRadius: BorderRadius.circular(8),
                            value: widget.progressValue?[index] ?? 0.3,
                          ).p(12),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ).p(12);
  }
}
