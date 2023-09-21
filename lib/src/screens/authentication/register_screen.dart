import 'dart:async';
import 'dart:io';

import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/functions/fileFunctions.dart';
import 'package:brodone/src/screens/authentication/login_screen.dart';
import 'package:brodone/src/screens/home/homeScreen.dart';
import 'package:brodone/src/utils/controllers/textControllers.dart';
import 'package:brodone/src/widgets/simpleInputField.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordHide = true;
  bool isNameError = false;
  bool isEmailError = false;
  bool isPasswordError = false;
  bool isConfirmPasswordError = false;
  bool isPhotoUploaded = false;
  PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                'lib/assets/images/Screen-Background.png',
                fit: BoxFit.fill,
                height: height,
                width: width,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 8,
                    ),
                    const Text(
                      "Brodone - Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor),
                    ),
                    const Text(
                      "Create an account to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textColor),
                    ),

                    const SizedBox(height: 30),

                    //-------------Name------------------//
                    SizedBox(
                        height: context.screenHeight / 2.5,
                        width: context.screenWidth,
                        child: PageView(
                          controller: _pageController,
                          pageSnapping: false,
                          physics: NeverScrollableScrollPhysics(),
                          onPageChanged: (value) {
                            setState(() {
                              currentIndex = value;
                            });
                          },
                          children: [
                            Column(
                              children: [
                                RegisterNameEmailSection(
                                  isNameError: isNameError,
                                  isEmailError: isEmailError,
                                ),
                                //--------Login-Button------------//
                                const SizedBox(height: 60),
                                InkWell(
                                  onTap: () {
                                    if (TextInputControllers
                                            .registerEmailController
                                            .text
                                            .isNotEmpty &&
                                        TextInputControllers
                                            .registerNameController
                                            .text
                                            .isNotEmpty) {
                                      //------Save-Name-OR-Email-Here-------//

                                      if (EmailValidator.validate(
                                          TextInputControllers
                                              .registerEmailController.text)) {
                                        setState(() {
                                          isEmailError = false;
                                          isNameError = false;
                                        });
                                        setState(() {
                                          _pageController.animateToPage(1,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.easeInOutExpo);
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        isEmailError = true;
                                        isNameError = true;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: height / 12,
                                    width: width / 1.1,
                                    decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 211, 207, 207),
                                              offset: Offset(10, 10),
                                              spreadRadius: 0.05,
                                              blurStyle: BlurStyle.normal,
                                              blurRadius: 5)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.buttonTextColor),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            //------------__Second-Secion----------//
                            Column(
                              children: [
                                RegisterPasswordSection(
                                  isPasswordError: isPasswordError,
                                  isConfirmPasswordError:
                                      isConfirmPasswordError,
                                ),
                                //--------Next-Button------------//
                                const SizedBox(height: 60),
                                InkWell(
                                  onTap: () {
                                    if (TextInputControllers
                                            .registerPasswordController
                                            .text
                                            .isNotEmpty &&
                                        TextInputControllers
                                            .registerConfirmPasswordController
                                            .text
                                            .isNotEmpty) {
                                      setState(() {
                                        isPasswordError = false;
                                        isConfirmPasswordError = false;
                                      });
                                      setState(() {
                                        _pageController.animateToPage(2,
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.easeInOutExpo);
                                      });

                                      //------Save-Name-OR-Email-Here-------//
                                    } else {
                                      setState(() {
                                        isPasswordError = true;
                                        isConfirmPasswordError = true;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: height / 12,
                                    width: width / 1.1,
                                    decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 211, 207, 207),
                                              offset: Offset(10, 10),
                                              spreadRadius: 0.05,
                                              blurStyle: BlurStyle.normal,
                                              blurRadius: 5)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.buttonTextColor),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            //----------Upload-Profile-Photo------//
                            RegisterPhotoSection(
                              isPhotoUploaded: isPhotoUploaded,
                            )
                          ],
                        )),

                    // const Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Text(
                    //       "forgot password?",
                    //       style: TextStyle(
                    //           color: AppColors.textColor,
                    //           fontWeight: FontWeight.bold),
                    //     )).pOnly(right: 30, top: 15),

                    //--------Sign-Up-Button-------//
                    Visibility(
                      visible: currentIndex == 2 ? false : true,
                      //----------ReplaceMent----------//
                      replacement: InkWell(
                        onTap: () {
                          if (isPhotoUploaded) {
                            Get.to(() => const HomeScreen());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please Upload Profile Picture')));
                          }
                        },
                        child: Container(
                          height: height / 12,
                          width: width / 1.1,
                          decoration: BoxDecoration(
                              color: isPhotoUploaded
                                  ? AppColors.buttonColor
                                  : const Color.fromARGB(255, 219, 217, 255),
                              boxShadow: isPhotoUploaded
                                  ? const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 211, 207, 207),
                                          offset: Offset(10, 10),
                                          spreadRadius: 0.05,
                                          blurStyle: BlurStyle.normal,
                                          blurRadius: 5)
                                    ]
                                  : null,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.buttonTextColor),
                          )),
                        ),
                      ).pOnly(top: 50),

                      //---------OLD---Widget---------(Replaced)----//
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            child: RichText(
                                text: const TextSpan(
                                    text: "Already have an account?",
                                    style:
                                        TextStyle(color: AppColors.textColor),
                                    children: [
                                  TextSpan(
                                      text: "  Sign In",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))
                                ])).pOnly(top: 20),
                          ),

                          //----------Option-Divider-----------//
                          const Row(
                            children: [
                              Expanded(child: Divider()),
                              Text(
                                "  OR  ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Expanded(child: Divider())
                            ],
                          ).pOnly(top: 35, right: 20, left: 20),

                          //--------Google-Button------------//
                          const SizedBox(height: 30),
                          Container(
                            height: height / 14,
                            width: width / 1.3,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    color: AppColors.secondaryColor, width: 3),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'lib/assets/images/google.png',
                                  height: 30,
                                  width: 30,
                                ),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPasswordSection extends StatelessWidget {
  bool? isPasswordError;
  bool? isConfirmPasswordError;
  bool? isSecuredPassword;
  RegisterPasswordSection(
      {super.key,
      this.isPasswordError,
      this.isConfirmPasswordError,
      this.isSecuredPassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimplePasswordInputField(
          controller: TextInputControllers.registerPasswordController,
          placeholder: "Create Password",
          isPassError: isPasswordError ?? false,
        ),
        const SizedBox(height: 30),

        //-------------Email------------------//
        SimplePasswordInputField(
          controller: TextInputControllers.registerConfirmPasswordController,
          placeholder: "Confirm Password",
          isPassError: isConfirmPasswordError ?? false,
        ),
      ],
    );
  }
}

class RegisterNameEmailSection extends StatelessWidget {
  bool? isNameError;
  bool? isEmailError;
  RegisterNameEmailSection({super.key, this.isNameError, this.isEmailError});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleTextField(
          controller: TextInputControllers.registerNameController,
          placeholder: "Enter Your Name",
          isEmailError: isNameError ?? false,
        ),
        const SizedBox(height: 30),

        //-------------Email------------------//
        SimpleEmailTextField(
          controller: TextInputControllers.registerEmailController,
          placeholder: "Enter Email Address",
          isEmailError: isEmailError ?? false,
        ),
      ],
    );
  }
}

class RegisterPhotoSection extends StatefulWidget {
  bool? isPhotoUploaded;
  RegisterPhotoSection({super.key, this.isPhotoUploaded});

  @override
  State<RegisterPhotoSection> createState() => _RegisterPhotoSectionState();
}

class _RegisterPhotoSectionState extends State<RegisterPhotoSection> {
  bool isUpload = false;
  bool isUploaded = false;
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await FileFunctions().pickGalleryImage(context, _selectedImage);

        if (_selectedImage != null) {
          setState(() {
            isUpload = true;
          });

          Timer(const Duration(seconds: 3), () {
            setState(() {
              isUploaded = true;
              widget.isPhotoUploaded = true;
            });
          });
        }
      },
      child: Card(
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  _selectedImage != null ? FileImage(_selectedImage!) : null,
            ).p(12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isUploaded
                    ? const Text(
                        "Uploaded 😀",
                        style: TextStyle(
                            color: AppColors.successColor,
                            fontWeight: FontWeight.bold),
                      ).p(8)
                    : const Text("Tap to here upload profile picture.").p(8),
                SizedBox(
                    height: 10,
                    width: 200,
                    child: LinearProgressIndicator(
                      value: isUpload
                          ? null
                          : isUploaded
                              ? 100
                              : 0,
                      color: isUploaded
                          ? AppColors.successColor
                          : AppColors.secondaryTextColor,
                      borderRadius: BorderRadius.circular(8),
                    )).p(8)
              ],
            ),
            isUploaded
                ? const Icon(
                    Icons.verified,
                    color: AppColors.successColor,
                  )
                : const SizedBox()
          ],
        ).p(12),
      ).p(12),
    );
  }
}
