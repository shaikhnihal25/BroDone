import 'dart:io';

import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/constants/imageConstants.dart';
import 'package:brodone/src/functions/fileFunctions.dart';
import 'package:brodone/src/widgets/simpleInputField.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Your Profile"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Your Account",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor),
                  ),
                  Text(
                    "Edit & Update your account details.",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ).p(16),
              Card(
                child: ListTile(
                  onTap: () {
                    FileFunctions().pickGalleryImage(context, _imageUrl);
                  },
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(DemoImages.profileImage),
                    radius: 28,
                  ),
                  title: const Text(
                    "Tap to change profile picture.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Press & Hold to view profile picture."),
                ),
              ).p(12),
              Card(
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Your Name',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person)),
                ).p(8),
              ).pOnly(top: 10, left: 12, right: 12),
              Card(
                child: TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                      hintText: 'Your Short Description',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.description)),
                ).p(8),
              ).pOnly(top: 10, left: 12, right: 12),
              Card(
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Your Email',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.verified)),
                ).p(8),
              ).pOnly(top: 10, left: 12, right: 12),
              Align(
                alignment: Alignment.center,
                child: Card(
                        color: AppColors.buttonColor,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "     Save & Update     ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.backgroundColor),
                            ).p(8)))
                    .pOnly(top: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
