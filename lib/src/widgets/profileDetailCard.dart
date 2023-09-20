import 'package:brodone/src/constants/color-constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileDetailCard extends StatefulWidget {
  String? title;
  String? subtitle;
  String? value;
  ProfileDetailCard({super.key, this.title, this.subtitle, this.value});

  @override
  State<ProfileDetailCard> createState() => _ProfileDetailCardState();
}

class _ProfileDetailCardState extends State<ProfileDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight / 6,
      width: context.screenWidth / 3.5,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 163, 158, 255),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title ?? "",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor),
          ),
          Text(
            widget.value ?? "",
            style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor),
          ),
          Text(
            widget.subtitle ?? "",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor),
          )
        ],
      ),
    );
  }
}
