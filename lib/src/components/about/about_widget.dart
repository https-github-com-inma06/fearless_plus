import 'dart:ffi';
import 'dart:ui';

import 'package:fearlessassemble/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

  Widget _profileSnsView(String id, String domain, String assets) {
    return Visibility(
      visible: id.isNotEmpty,
      child: Container(
        child: GestureDetector(
          onTap: () {
            launchInBrowser("$domain/$id");
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 20,
            height: 20,
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
            launchInBrowser(path);
          },
          child: Container(
            child: SvgPicture.asset(assets),
          ),
        ),
      ),
    );
  }

  Widget _profile(String image, String name, String position, String birthDay,
      String instagramId, String twitterId, String youtubeId, String tictokId) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: const Color(0xffFF9D6B),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 18,
                  bottom: 8,
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    image + "s",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
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
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _profileSnsView(instagramId, "https://www.instagram.com",
                        'assets/svg/icons/ico_instagram.svg'),
                    _profileSnsView(twitterId, "https://www.twitter.com",
                        'assets/svg/icons/ico_twitter.svg'),
                    _profileSnsView(
                        youtubeId,
                        "https://www.youtube.com/channel",
                        'assets/svg/icons/ico_instagram.svg'),
                    _profileSnsView(tictokId, "https://www.tiktok.com",
                        'assets/svg/icons/ico_instagram.svg'),
                  ],
                ),
              ),
            ],
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
          SliverToBoxAdapter(),
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
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                              _officialSnsView("https://www.twitter.com/aaaaaa",
                                'assets/svg/icons/ico_official_youtube.svg'),
                              _officialSnsView("https://www.twitter.com",
                                'assets/svg/icons/ico_official_instagram.svg'),
                              _officialSnsView("https://www.twitter.com",
                                'assets/svg/icons/ico_official_twitter.svg'),
                              _officialSnsView("https://www.twitter.com",
                                'assets/svg/icons/ico_official_facebook.svg'),
                              _officialSnsView("https://www.twitter.com",
                                'assets/svg/icons/ico_official_youtube.svg'),
                              _officialSnsView("https://www.twitter.com",
                                'assets/svg/icons/ico_official_youtube.svg'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            sliver: SliverGrid(
                delegate: SliverChildListDelegate([
                  _profile(
                      'assets/images/img_min.png',
                      'MINYEONG',
                      'Main Vocalist',
                      '1990.09.12',
                      'nyong2ya',
                      'nyong2ya',
                      'UCM7sspcSzirLxsfIUt6i3Vw',
                      "@bravegirls_my"),
                  _profile(
                      'assets/images/img_yoo.png',
                      'YUJEONG',
                      'Vocalist',
                      '1991.05.02',
                      'braveg_yj',
                      'bgyjnice',
                      'UC0rYv-5_Ce72wegF9_pmDpw',
                      "@yjistimeless"),
                  _profile(
                      'assets/images/img_eun.png',
                      'EUNJI',
                      'Vocalist',
                      '1992.07.19',
                      'bg_eunji92',
                      'braveunji',
                      '',
                      "@bravegirls_eunji"),
                  _profile(
                      'assets/images/img_yuna.png',
                      'YUNA😘',
                      'Lead Vocalist',
                      '1993.04.06',
                      'u.nalee',
                      'u_nalee_',
                      'UCMLa547c-KJbOSzTf010Q1Q',
                      "@bravegirls_u_na"),
                ]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2)),
          ),
        ],
      ),
    );
  }
}
