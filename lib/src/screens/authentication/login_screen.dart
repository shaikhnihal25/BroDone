import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/screens/home/homeScreen.dart';
import 'package:brodone/src/utils/controllers/textControllers.dart';
import 'package:brodone/src/widgets/simpleInputField.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHide = true;
  bool isEmailError = false;
  bool isPassError = false;
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
                      height: height / 6,
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
                    //-------------Email------------------//
                    SimpleTextField(
                      isEmailError: isEmailError,
                    ),
                    //---------Password-------------//
                    const SizedBox(height: 30),
                    SimplePasswordInputField(
                      isPassError: isEmailError,
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "forgot password?",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold),
                        )).pOnly(right: 30, top: 15),

                    //--------Login-Button------------//
                    const SizedBox(height: 60),
                    InkWell(
                      onTap: () {
                        if (EmailValidator.validate(
                            TextInputControllers.loginEmailController.text)) {
                          if (TextInputControllers
                                  .loginEmailController.text.isNotEmpty &&
                              TextInputControllers
                                  .loginPasswordController.text.isNotEmpty) {
                            Get.to(HomeScreen());
                          }
                        } else {
                          setState(() {
                            isEmailError = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Please enter valid email address!")));
                        }

                        if (TextInputControllers
                            .loginPasswordController.text.isEmpty) {
                          setState(() {
                            isPassError = true;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Password cannot be empty!")));
                        }
                      },
                      child: Container(
                        height: height / 12,
                        width: width / 1.1,
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 211, 207, 207),
                                  offset: Offset(10, 10),
                                  spreadRadius: 0.05,
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 5)
                            ],
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonTextColor),
                        )),
                      ),
                    ),
                    //--------Sign-Up-Button-------//
                    RichText(
                        text: const TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(color: AppColors.textColor),
                            children: [
                          TextSpan(
                              text: "  Sign Up",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))
                        ])).pOnly(top: 20),

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
