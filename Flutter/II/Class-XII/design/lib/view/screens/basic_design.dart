import 'package:design/view/screens.dart';
import 'package:design/view/widget/basic.dart';
import 'package:flutter/material.dart';

class BasicDesign extends StatelessWidget {
  const BasicDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final videoURL =
        'https://packaged-media.redd.it/gceebh2nv5i91/pb/m2-res_1080p.mp4?m=DASHPlaylist.mpd&v=1&e=1729328400&s=7807e803ca91ab032388dfb95088f900647e60a3';
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Design Demo')),
      body: Column(
        children: [
          GestureDetector(
            child: const Image(
              image: AssetImage("assets/oeschinen_lake.jpg"),
              height: 270,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OeschinenVideo(
                    videoUrl: videoURL,
                    videoTxt: "Oeschinen Lake Campground",
                  ),
                ),
              );
            },
          ),
          TitleSection(),
          ButtonsSection(),
          TextSection(),
        ],
      ),
    );
  }
}
