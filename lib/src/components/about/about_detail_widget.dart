import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/components/about/about_widget.dart';
import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AboutDetailWidget extends StatelessWidget {
  const AboutDetailWidget({Key key}) : super(key: key);

  Widget _profile(String image, String name, String position, String birthDay,
      String instagramId, String twitterId, String youtubeId, String tictokId) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 450,
        width: 300,
        padding: const EdgeInsets.all(16),
        color: const Color(0xffFF9D6B),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              child: Hero(
                tag: Get.arguments['name'],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/$image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              position,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              birthDay,
              style: TextStyle(color: Colors.white, fontSize: 18,),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _profileSnsView(instagramId, "https://www.instagram.com",
                      'assets/svg/icons/ico_small_instagram.svg'),
                  _profileSnsView(twitterId, "https://www.twitter.com",
                      'assets/svg/icons/ico_small_twitter.svg'),
                  _profileSnsView(youtubeId, "https://www.youtube.com/channel",
                      'assets/svg/icons/ico_small_youtube.svg'),
                  _profileSnsView(tictokId, "https://www.tiktok.com",
                      'assets/svg/icons/ico_small_tictok.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileSnsView(String id, String domain, String assets) {
    return Visibility(
      visible: id.isNotEmpty,
      child: Container(
        width: Get.width / 10,
        child: GestureDetector(
          onTap: () {
            LaunchInBrowser().launchInBrowser("$domain/$id");
            // launchInBrowser("$domain/$id");
          },
          child: Container(
            // padding: EdgeInsets.all(5),
            width: 50,
            height: 50,
            child: SvgPicture.asset(assets),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: CustomAppBar(
          title: 'About',
          hasNewNotify: true,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 30),
            child: _profile(
              Get.arguments['image'],
              Get.arguments['name'],
              Get.arguments['position'],
              Get.arguments['birthDay'],
              Get.arguments['instagramId'],
              Get.arguments['twitterId'],
              Get.arguments['youtubeId'],
              Get.arguments['tictokId'],
            ),
          ),
        ],
      ),
    );
  }
}
