import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/color-constants.dart';

class NotificationMainPage extends StatefulWidget {
  const NotificationMainPage({super.key});

  @override
  State<NotificationMainPage> createState() => _NotificationMainPageState();
}

class _NotificationMainPageState extends State<NotificationMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Notifications & Alerts"),
      ),
      body: SafeArea(
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
                "Notifications",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor),
              ),
              Text(
                "Stay updated on important events and messages.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
            ],
          ).p(16),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              Text(
                "ALL",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ).p(8),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://play-lh.googleusercontent.com/i8fGO7LrghUKcBCijVf09Vy_FET5-tCh35O6FTFjkHUMixnCRokmaKMZOKNvf4k2P3Y'),
                ),
                title: const Text("Hey, Nihal. "),
                subtitle: const Text("New sessions has arrived!"),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_horiz)),
              ).p(8);
            },
          ),
        ],
      )),
    );
  }
}
