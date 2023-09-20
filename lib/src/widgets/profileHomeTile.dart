import 'package:brodone/src/constants/imageConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/color-constants.dart';
import '../screens/authentication/login_screen.dart';

class ProfileHomeTile extends StatefulWidget {
  const ProfileHomeTile({super.key});

  @override
  State<ProfileHomeTile> createState() => _ProfileHomeTileState();
}

class _ProfileHomeTileState extends State<ProfileHomeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onLongPress: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              context: context,
              builder: (context) {
                return Container(
                  height: context.screenHeight / 8,
                  width: context.screenWidth,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: ListTile(
                    onTap: () => Get.to(const LoginScreen()),
                    leading: const Icon(
                      Icons.logout,
                      color: AppColors.errorColor,
                    ),
                    title: const Text(
                      "Want To Logout?",
                      style: TextStyle(
                          color: AppColors.errorColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Click here to logout"),
                  ).p(12),
                );
              });
        },
        tileColor: const Color.fromARGB(255, 163, 158, 255),
        leading: const CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(DemoImages.profileImage),
        ),
        title: const Text(
          "Shaikh Nihal",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.backgroundColor),
        ),
        subtitle: const Text(
          "shaikhxnihal@gmail.com",
          style: TextStyle(color: AppColors.secondaryTextColor),
        ),
        trailing: Container(
          decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(4)),
          child: const Text(
            "👑 PRO",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ).p(4),
        ),
      ).p(12),
    ).p(14);
  }
}
