import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/constants/imageConstants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MainLeaderboardScreen extends StatefulWidget {
  const MainLeaderboardScreen({super.key});

  @override
  State<MainLeaderboardScreen> createState() => _MainLeaderboardScreenState();
}

class _MainLeaderboardScreenState extends State<MainLeaderboardScreen> {
  // Initial Selected Value
  String dropdownvalue = 'City';

  // List of items in our dropdown menu
  var items = [
    'City',
    'State',
    'National',
    'International',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Leaderboard"),
        actions: [
          DropdownButton(
            // Initial Value
            value: dropdownvalue,
            underline: SizedBox(),

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ).pOnly(left: 10, right: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rank-Up",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
                Text(
                  "Become topper by solving challenges & tests",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
              ],
            ).p(16),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return LeaderboardTile(
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  int? index;
  LeaderboardTile({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: context.screenHeight / 10,
        width: context.screenWidth / 1.1,
        decoration: BoxDecoration(
          color: index == 0
              ? const Color.fromARGB(255, 176, 172, 252)
              : AppColors.backgroundColor,
          border: Border.all(
              width: 2.0,
              color: index == 0
                  ? const Color.fromARGB(255, 98, 90, 255)
                  : const Color.fromARGB(255, 209, 209, 209)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.textColor,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.backgroundColor,
                child: Center(
                  child: index == 0
                      ? const Text(
                          "🏆",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : Text("${index! + 1}"),
                ),
              ),
            ).pOnly(left: 10),
            //------Pic----------//
            const CircleAvatar(
              radius: 26,
              //--------Current-User---------//
              backgroundColor: AppColors.backgroundColor,
              backgroundImage: NetworkImage(DemoImages.profileImage),
            ).pOnly(left: 10),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shaikh Nihal Ahmed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Shaikh Nihal Ahmed"),
              ],
            ).pOnly(left: 20),

            const Text("( 2400 )").pOnly(left: 20),
          ],
        ),
      ),
    ).p(8);
  }
}
