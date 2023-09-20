import 'package:brodone/src/constants/color-constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CourseInfoCard extends StatefulWidget {
  String? image;
  String? courseTitle;
  String? teacherName;
  double? averageRating;
  int? totalRatings;
  int? newPrice;
  int? oldPrice;

  CourseInfoCard(
      {super.key,
      this.image,
      this.courseTitle,
      this.teacherName,
      this.averageRating,
      this.totalRatings,
      this.oldPrice,
      this.newPrice});

  @override
  State<CourseInfoCard> createState() => _CourseInfoCardState();
}

class _CourseInfoCardState extends State<CourseInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.screenHeight / 4.5,
            width: context.screenWidth / 1,
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.image ??
                        'https://images.unsplash.com/photo-1659301254614-8d6a9d46f26a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'))),
          ),
          Text(
            widget.courseTitle ?? "Course Title, Course Title, Course Title",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            overflow: TextOverflow.ellipsis,
          ).pOnly(left: 5, top: 10, right: 5),
          Text(
            widget.teacherName ?? 'Teacher Name',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.secondaryTextColor),
          ).pOnly(left: 5),
          Row(
            children: [
              Text("${widget.averageRating}"),
              VxRating(
                onRatingUpdate: (value) {},
                count: 5,
                maxRating: 5,
                value: widget.averageRating ?? 0.0,
                isSelectable: false,
              ),
              Text("(${widget.totalRatings})")
            ],
          ).p(8),
          Row(
            children: [
              Text(
                "₹${widget.oldPrice}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.secondaryTextColor),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "₹${widget.newPrice}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ).p(8),
        ],
      ),
    ).p(12);
  }
}
