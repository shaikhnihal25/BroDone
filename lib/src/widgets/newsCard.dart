import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

import '../constants/color-constants.dart';

class NewsCard extends StatefulWidget {
  String? imageUrl;
  bool? isVideo;
  String? videoUrl;
  String? title;
  String? subtitle;
  NewsCard(
      {super.key,
      this.imageUrl,
      required this.isVideo,
      this.videoUrl,
      this.title,
      this.subtitle});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  // late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl ??
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              child: Container(
                  height: context.screenHeight / 3.5,
                  width: context.screenWidth / 1,
                  child: Image.network(
                    widget.imageUrl ??
                        'https://marketplace.canva.com/EAFfT3S71Oc/1/0/1600w/canva-red-blue-modern-breaking-news-youtube-thumbnail-qJRhA0AmHOw.jpg',
                  ))),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          horizontalTitleGap: 0.0,
          contentPadding: const EdgeInsets.all(0.0),
          title: Text(
            widget.title ?? "LATEST ECONOMIC NEWS OF THIS MONTH",
            style: TextStyle(
                color: AppColors.textColor, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.subtitle ?? "By Zee News",
            style: TextStyle(color: AppColors.textColor),
          ),
          trailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ).pOnly(left: 8),
      ],
    );
  }
}
