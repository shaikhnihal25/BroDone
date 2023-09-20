import 'dart:io';

import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/widgets/homeSearchBar.dart';
import 'package:brodone/src/widgets/simpleInputField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class BotChatScreen extends StatefulWidget {
  const BotChatScreen({super.key});

  @override
  State<BotChatScreen> createState() => _BotChatScreenState();
}

class _BotChatScreenState extends State<BotChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<String>? _messages = [];
  List<String>? _sentTimes = [];
  String? _pickedImage;
  String? message;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('h:mm a').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with BRO"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages?.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  isUser: true,
                  message: _messages![index],
                  time: _sentTimes?[index],
                );
              },
            ),
          ),
          ChatTextField(
            controller: _controller,
            onSend: () {
              var msg = _controller.text;
              if (msg.isNotEmpty) {
                setState(() {
                  message = msg;
                  _messages?.add(msg);
                  _sentTimes?.add(formattedTime);
                  _controller.clear();
                });
              }
            },
            onFile: () {
              ImagePicker.platform
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                print(value?.path);
                setState(() {
                  _pickedImage = value?.path;
                });
              });
            },
          ).p(12)
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  bool isUser;
  String message;
  String? time;
  ChatBubble(
      {super.key, required this.isUser, required this.message, this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.topRight : Alignment.topLeft,
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Card(
            child: Text(message).p(12),
          ).pOnly(right: 10, left: 60),
          Text(
            time ?? "",
            style: TextStyle(color: AppColors.secondaryTextColor),
            textAlign: TextAlign.end,
          ).pOnly(right: 20, bottom: 10)
        ],
      ),
    );
  }
}
