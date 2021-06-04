import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key key}) : super(key: key);

  Widget _profile(String image, String name, String position, String birthDay,
      String insUrl, String twiUrl) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
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
                  top: 8,
                  right: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/icons/ico_instagram.svg',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset(
                      'assets/svg/icons/ico_twitter.svg',
                      width: 20,
                      height: 20,
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
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (Get.width / 2) - (Get.width - Get.width * 0.91),
                  height: (Get.height / 2) - (Get.height - Get.height * 0.8),
                  child: _profile('assets/images/img_min.png', 'MINYEONG',
                      'Main Vocalist', '1990.09.12', '', ''),
                ),
                Container(
                  width: (Get.width / 2) - (Get.width - Get.width * 0.91),
                  height: (Get.height / 2) - (Get.height - Get.height * 0.8),
                  child: _profile('assets/images/img_yoo.png', 'YUJEONG',
                      'Vocalist', '1991.05.02', '', ''),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (Get.width / 2) - (Get.width - Get.width * 0.91),
                height: (Get.height / 2) - (Get.height - Get.height * 0.8),
                child: _profile(
                  'assets/images/img_eun.png',
                  'EUNJI',
                  'Vocalist',
                  '1992.07.19',
                  '',
                  '',
                ),
              ),
              Container(
                width: (Get.width / 2) - (Get.width - Get.width * 0.91),
                height: (Get.height / 2) - (Get.height - Get.height * 0.8),
                child: _profile(
                  'assets/images/img_yuna.png',
                  'YUNA',
                  'Lead Vocalist',
                  '1993.04.06',
                  '',
                  '',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
