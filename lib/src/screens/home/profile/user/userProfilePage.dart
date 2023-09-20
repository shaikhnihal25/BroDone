import 'package:brodone/src/screens/home/profile/user/editProfile.dart';
import 'package:brodone/src/screens/home/profile/user/settinhScreen.dart';
import 'package:brodone/src/widgets/dividerwithTitle.dart';
import 'package:brodone/src/widgets/profileHomeTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/color-constants.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Account",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                Text(
                  "View and edit your account information.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
              ],
            ).p(16),
            const ProfileHomeTile(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    child: TextButton(
                        onPressed: () =>
                            Get.to(() => const EditProfileScreen()),
                        child: const Text("👤 Edit Profile"))),
                Card(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("🔔 Notifications"))),
                Card(
                    child: TextButton(
                        onPressed: () => Get.to(() => const SettingScreen()),
                        child: const Text("⚙️ Settings"))),
              ],
            ).p(12),
            //------------------------------//
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  height: 10,
                )),
                Text(
                  "  Other Options  ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Divider(
                  height: 10,
                ))
              ],
            ).pOnly(top: 20, bottom: 20),
            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.library_books,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Your Courses & Notes",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                subtitle: Text(
                  "List of all study things",
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ).pOnly(left: 10, right: 10),
            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.payment,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Subscriptions & Payment History",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                subtitle: Text(
                  "Your all payment & subscription details",
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ).pOnly(left: 10, right: 10, top: 10),
            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.download,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Your Downloads",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                subtitle: Text(
                  "Offline saved courses, lectures, notes & etc.",
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ).pOnly(left: 10, right: 10, top: 10),

            DividerWithTitle(
              title: '  Account actions  ',
            ),
            const Card(
              color: Color.fromARGB(255, 241, 240, 255),
              child: ListTile(
                leading: Icon(
                  Icons.verified,
                  color: AppColors.successColor,
                ),
                title: Text(
                  "Apply For Verification",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                subtitle: Text(
                  "Become verified student/teacher and rank on top",
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ).pOnly(left: 10, right: 10, top: 10),
            const Card(
              color: Color.fromARGB(255, 255, 202, 102),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: AppColors.secondaryColor,
                ),
                title: Text(
                  "Become Teacher",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                subtitle: Text(
                  "Join our teachers & tutors community.",
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ).pOnly(left: 10, right: 10, top: 10),
            Card(
              child: ListTile(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: context.screenHeight / 4.6,
                            width: context.screenWidth / 1.2,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Material(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Confirm Logout",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Are you sure you want to log out from your account?",
                                    textAlign: TextAlign.center,
                                  ).pOnly(left: 50, right: 50),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            //------Logout--------//
                                          },
                                          child: const Text("YES")),
                                      Card(
                                          child: TextButton(
                                              onPressed: () => Get.back(),
                                              child: const Text("NO")))
                                    ],
                                  ).pOnly(top: 10, bottom: 20)
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                leading: const Icon(
                  Icons.logout,
                  color: AppColors.errorColor,
                ),
                title: const Text(
                  "Logout",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.errorColor),
                ),
                // subtitle: Text(
                //   "Join our teachers & tutors community.",
                //   overflow: TextOverflow.ellipsis,
                // ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ).pOnly(left: 10, right: 10, top: 10),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      )),
    );
  }
}
