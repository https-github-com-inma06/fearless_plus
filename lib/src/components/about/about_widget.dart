import 'dart:ui';

import 'package:fearlessassemble/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

  Widget _profileSnsView(String id, String domain, String assets) {
    return Visibility(
      visible: id.isNotEmpty,
      child: Container(
        width: Get.width / 13,
        child: GestureDetector(
          onTap: () {
            LaunchInBrowser().launchInBrowser("$domain/$id");
            // launchInBrowser("$domain/$id");
          },
          child: Container(
            padding: EdgeInsets.all(5),
            width: 30,
            height: 30,
            child: SvgPicture.asset(assets),
          ),
        ),
      ),
    );
  }

  Widget _officialSnsView(String path, String assets) {
    return Visibility(
      visible: path.isNotEmpty,
      child: Container(
        child: GestureDetector(
          onTap: () {
            LaunchInBrowser().launchInBrowser(path);
            // launchInBrowser(path);
          },
          child: Container(
            width: 38,
            height: 38,
            child: SvgPicture.asset(assets),
          ),
        ),
      ),
    );
  }

  /* TODO : 이부분 높이 조정하는 방법좀 */
  Widget _profile(String image, String name, String position, String birthDay,
      String instagramId, String twitterId, String youtubeId, String tictokId) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Map<String, String> arg = {
            'image': image,
            'name': name,
            'position': position,
            'birthDay': birthDay,
            'instagramId': instagramId,
            'twitterId': twitterId,
            'youtubeId': youtubeId,
            'tictokId': tictokId,
          };
          Get.toNamed('/aboutDetail/', arguments: arg);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: const Color(0xffFF9D6B),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Hero(
                    tag: name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 75,
                          height: 75,
                          color: Colors.grey.withOpacity(0.5),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  position,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  birthDay,
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _profileSnsView(instagramId, "https://www.instagram.com",
                          'assets/svg/icons/ico_small_instagram.svg'),
                      _profileSnsView(twitterId, "https://www.twitter.com",
                          'assets/svg/icons/ico_small_twitter.svg'),
                      _profileSnsView(
                          youtubeId,
                          "https://www.youtube.com/channel",
                          'assets/svg/icons/ico_small_youtube.svg'),
                      _profileSnsView(tictokId, "https://www.tiktok.com",
                          'assets/svg/icons/ico_small_tictok.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          // SliverPersistentHeader(delegate: delegate),
          // SliverToBoxAdapter(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 10, 30),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(0),
                          child: SvgPicture.asset(
                            "assets/svg/icons/ico_aboutbg_on.svg",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "BRAVE GIRLS",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Row(
                            children: [
                              _officialSnsView(
                                  "https://www.youtube.com/channel/UCx_kYu6Wp1yxZP_KtrW52EQ",
                                  'assets/svg/icons/ico_youtube.svg'),
                              _officialSnsView(
                                  "https://www.instagram.com/bravegirls.official/",
                                  'assets/svg/icons/ico_instagram.svg'),
                              _officialSnsView("https://twitter.com/BraveGirls",
                                  'assets/svg/icons/ico_twitter.svg'),
                              _officialSnsView(
                                  "https://www.facebook.com/bravegirls.official/",
                                  'assets/svg/icons/ico_facebook.svg'),
                              _officialSnsView(
                                  "https://www.vlive.tv/channel/86FF07",
                                  'assets/svg/icons/ico_vlive.svg'),
                              _officialSnsView(
                                  "https://m.post.naver.com/my/series/detail.nhn?memberNo=40158097&seriesNo=394049",
                                  'assets/svg/icons/ico_naver.svg'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 24,
              left: 20,
              right: 20,
            ),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  _profile(
                    'minyeong',
                    'MINYEONG🎤',
                    'Main Vocalist',
                    '1990.09.12',
                    'nyong2ya',
                    'nyong2ya',
                    'UCM7sspcSzirLxsfIUt6i3Vw',
                    "@bravegirls_my",
                  ),
                  _profile(
                    'yujeong',
                    'YUJEONG🐢',
                    'Vocalist',
                    '1991.05.02',
                    'braveg_yj',
                    'bgyjnice',
                    'UC0rYv-5_Ce72wegF9_pmDpw',
                    "@yjistimeless",
                  ),
                  _profile(
                    'eunji',
                    'EUNJI👀',
                    'Vocalist',
                    '1992.07.19',
                    'bg_eunji92',
                    'braveunji',
                    '',
                    "@bravegirls_eunji",
                  ),
                  _profile(
                    'yuna',
                    'YUNA👩',
                    'Lead Vocalist',
                    '1993.04.06',
                    'u.nalee',
                    'u_nalee_',
                    'UCMLa547c-KJbOSzTf010Q1Q',
                    "@bravegirls_u_na",
                  ),
                ],
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2),
            ),
          ),
        ],
      ),
    );
  }
}
