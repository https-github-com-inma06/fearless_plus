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

  Widget _profile(String image, String name, String position, String birthDay,
      String instagram, String twitter, String youtube) {
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
                    Visibility(
                      visible: instagram.isNotEmpty,
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            launchInBrowser(instagram);
                            print('인스타클릭');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/svg/icons/ico_instagram.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: twitter.isNotEmpty,
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            launchInBrowser(twitter);
                            print('트위터 클릭');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/svg/icons/ico_twitter.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: youtube.isNotEmpty,
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            launchInBrowser(youtube);
                            print('트위터 클릭');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/svg/icons/ico_twitter.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
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
                      'https://www.instagram.com/nyong2ya',
                      'https://twitter.com/nyong2ya',
                      'https://twitter.com/nyong2ya'),
                  _profile(
                      'assets/images/img_yoo.png',
                      'YUJEONG',
                      'Vocalist',
                      '1991.05.02',
                      'https://www.instagram.com/braveg_yj',
                      'https://twitter.com/bgyjnice',
                      'https://twitter.com/nyong2ya'),
                  _profile(
                      'assets/images/img_eun.png',
                      'EUNJI',
                      'Vocalist',
                      '1992.07.19',
                      'https://www.instagram.com/bg_eunji92',
                      'https://twitter.com/braveunji',
                      ''),
                  _profile(
                      'assets/images/img_yuna.png',
                      'YUNA😘',
                      'Lead Vocalist',
                      '1993.04.06',
                      'https://www.instagram.com/u.nalee',
                      'https://twitter.com/u_nalee_',
                      'https://twitter.com/nyong2ya'),
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
