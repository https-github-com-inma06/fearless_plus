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

  Widget _profile(String image, String name, String position, String birthDay,
      String instagramId, String twitterId, String youtubeId) {
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
                    image,
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
                    _profileSnsView(instagramId, "https://www.instagram.com", 'assets/svg/icons/ico_instagram.svg'),
                    _profileSnsView(twitterId, "https://www.twitter.com", 'assets/svg/icons/ico_twitter.svg'),
                    _profileSnsView(youtubeId, "https://www.twitter.com", 'assets/svg/icons/ico_instagram.svg'),
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
                        padding: EdgeInsets.all(20),
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
                          Text(
                            "BRAVE GIRLS",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/icons/ico_instagram.svg',
                                color: Colors.black,
                                width: 25,
                                height: 25,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SvgPicture.asset(
                                'assets/svg/icons/ico_twitter.svg',
                                color: Colors.black,
                                width: 25,
                                height: 25,
                              ),
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
                      'nyong2ya'),
                  _profile(
                      'assets/images/img_yoo.png',
                      'YUJEONG',
                      'Vocalist',
                      '1991.05.02',
                      'braveg_yj',
                      'bgyjnice',
                      'nyong2ya'),
                  _profile(
                      'assets/images/img_eun.png',
                      'EUNJI',
                      'Vocalist',
                      '1992.07.19',
                      'bg_eunji92',
                      'braveunji',
                      ''),
                  _profile(
                      'assets/images/img_yuna.png',
                      'YUNA😘',
                      'Lead Vocalist',
                      '1993.04.06',
                      'u.nalee',
                      'u_nalee_',
                      'nyong2ya'),
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
