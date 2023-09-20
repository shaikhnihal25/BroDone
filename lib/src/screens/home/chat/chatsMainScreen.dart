import 'package:brodone/src/constants/color-constants.dart';
import 'package:brodone/src/constants/imageConstants.dart';
import 'package:brodone/src/screens/home/chat/bot/botChatScreen.dart';
import 'package:brodone/src/widgets/homeSearchBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatsMainScreen extends StatefulWidget {
  const ChatsMainScreen({super.key});

  @override
  State<ChatsMainScreen> createState() => _ChatsMainScreenState();
}

class _ChatsMainScreenState extends State<ChatsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
            title: const Text("Chats & Messages"),
            bottom:
                const TabBar(tabs: [Tab(text: "CHATS"), Tab(text: "POSTS")])),
        body: const TabBarView(children: [ChatsListScreen(), PostsScreen()]),
      ),
    );
  }
}

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          NeumorphicSearchBar(onTextChanged: (value) {}, onFilterPressed: () {})
              .p(12),
          ListView.builder(
            itemCount: 12,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  if (index == 0) {
                    Get.to(() => const BotChatScreen());
                  }
                },
                leading: CircleAvatar(
                  backgroundImage: index == 0
                      ? const AssetImage('lib/assets/logos/main-logo.png')
                      : null,
                ),
                title: Text(
                  index == 0 ? "BRO ( AI bot )" : "User Name",
                ),
                subtitle: const Text(
                  "last messages shows here for preview...",
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Center(
                        child: Text(
                          index == 0 ? "9+" : "4",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Text(index == 0 ? "Online" : "2 hr ago"),
                  ],
                ),
              ).p(8);
            },
          ).pOnly(top: 10),
        ],
      ),
    );
  }
}

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return PostTile();
      },
    );
  }
}

class PostTile extends StatelessWidget {
  const PostTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: context.screenHeight / 2.2,
        width: context.screenWidth / 1.1,
        decoration: BoxDecoration(color: AppColors.backgroundColor),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(),
              title: Text("User Name"),
              subtitle: Text('Location'),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ),
            Image.network(
              DemoImages.postImage,
              fit: BoxFit.contain,
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
                    .p(4),
                IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined))
                    .p(4),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)).p(4),
                Expanded(child: SizedBox()),
                IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border))
                    .p(4),
              ],
            )
          ],
        ),
      ),
    );
  }
}
