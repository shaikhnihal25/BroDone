import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/color-constants.dart';
import '../utils/controllers/textControllers.dart';

class SimplePasswordInputField extends StatefulWidget {
  bool isPassError = false;
  TextEditingController? controller;
  String? placeholder;
  SimplePasswordInputField(
      {super.key,
      required this.isPassError,
      required this.controller,
      this.placeholder});

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
          controller: widget.controller,
          obscureText: isPasswordHide,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.placeholder ?? "Password",
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
  String? placeholder;
  TextEditingController? controller;
  SimpleTextField(
      {super.key,
      required this.isEmailError,
      this.placeholder,
      required this.controller});

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
          controller: widget.controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.placeholder ?? "Email",
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

class SimpleEmailTextField extends StatefulWidget {
  bool isEmailError = false;
  TextEditingController? controller;
  String? placeholder;

  SimpleEmailTextField(
      {super.key,
      required this.isEmailError,
      required this.controller,
      this.placeholder});

  @override
  State<SimpleEmailTextField> createState() => _SimpleEmailTextFieldState();
}

class _SimpleEmailTextFieldState extends State<SimpleEmailTextField> {
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
          controller: widget.controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.placeholder ?? "Email",
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

class ChatTextField extends StatefulWidget {
  void Function()? onSend;
  void Function()? onFile;
  TextEditingController? controller;
  ChatTextField({super.key, this.onSend, this.controller, this.onFile});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.backgroundColor, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: widget.onFile,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: widget.onSend,
          ),
        ],
      ),
    );
  }
}
