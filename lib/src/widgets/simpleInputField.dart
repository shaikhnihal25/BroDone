import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/color-constants.dart';
import '../utils/controllers/textControllers.dart';

class SimplePasswordInputField extends StatefulWidget {
  bool isPassError = false;
  SimplePasswordInputField({super.key, required this.isPassError});

  @override
  State<SimplePasswordInputField> createState() =>
      _SimplePasswordInputFieldState();
}

class _SimplePasswordInputFieldState extends State<SimplePasswordInputField> {
  bool isPasswordHide = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      height: height / 12,
      width: width / 1.1,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: widget.isPassError
              ? Border.all(color: AppColors.errorColor, width: 2)
              : null,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 211, 207, 207),
                offset: Offset(10, 10),
                spreadRadius: 0.05,
                blurStyle: BlurStyle.normal,
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: TextFormField(
          controller: TextInputControllers.loginPasswordController,
          obscureText: isPasswordHide,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordHide = !isPasswordHide;
                    });
                  },
                  icon: isPasswordHide
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))),
        ).pOnly(right: 20, left: 20),
      ),
    );
  }
}

class SimpleTextField extends StatefulWidget {
  bool isEmailError = false;
  SimpleTextField({super.key, required this.isEmailError});

  @override
  State<SimpleTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      height: height / 12,
      width: width / 1.1,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: widget.isEmailError
              ? Border.all(color: AppColors.errorColor, width: 2)
              : null,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 211, 207, 207),
                offset: Offset(10, 10),
                spreadRadius: 0.05,
                blurStyle: BlurStyle.normal,
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: TextFormField(
          controller: TextInputControllers.loginEmailController,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              suffixIcon: widget.isEmailError
                  ? Icon(
                      Icons.error,
                      color: AppColors.errorColor,
                    )
                  : SizedBox()),
        ).pOnly(right: 20, left: 20),
      ),
    );
  }
}
